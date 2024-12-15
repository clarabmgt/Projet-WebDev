<?php
// user.php : API pour la gestion des utilisateurs.

require_once 'db_connection.php'; // Inclure la configuration de la base de données.

session_start();

// Route pour l'inscription.
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_GET['action']) && $_GET['action'] === 'register') {
    $data = json_decode(file_get_contents('php://input'), true);
    $username = $data['username'] ?? '';
    $email = $data['email'] ?? '';
    $password = $data['password'] ?? '';

    if (empty($username) || empty($email) || empty($password)) {
        sendResponse(400, 'Tous les champs sont requis.');
        exit;
    }

    try {
        // Vérifier si l'email existe déjà.
        $query = $pdo->prepare('SELECT id FROM users WHERE email = ?');
        $query->execute([$email]);
        if ($query->fetch()) {
            sendResponse(409, 'Email déjà utilisé.');
            exit;
        }

        // Insérer le nouvel utilisateur.
        $hashedPassword = password_hash($password, PASSWORD_BCRYPT);
        $stmt = $pdo->prepare('INSERT INTO users (username, email, password) VALUES (?, ?, ?)');
        $stmt->execute([$username, $email, $hashedPassword]);

        sendResponse(201, 'Inscription réussie.');
    } catch (PDOException $e) {
        sendResponse(500, 'Erreur interne : ' . $e->getMessage());
    }
}

// Route pour la connexion.
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_GET['action']) && $_GET['action'] === 'login') {
    $data = json_decode(file_get_contents('php://input'), true);
    $email = $data['email'] ?? '';
    $password = $data['password'] ?? '';

    if (empty($email) || empty($password)) {
        sendResponse(400, 'Tous les champs sont requis.');
        exit;
    }

    try {
        // Vérifier l'email et le mot de passe.
        $query = $pdo->prepare('SELECT id, username, password FROM users WHERE email = ?');
        $query->execute([$email]);
        $user = $query->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($password, $user['password'])) {
            $_SESSION['user_id'] = $user['id'];
            sendResponse(200, 'Connexion réussie.', ['username' => $user['username']]);
        } else {
            sendResponse(401, 'Email ou mot de passe incorrect.');
        }
    } catch (PDOException $e) {
        sendResponse(500, 'Erreur interne : ' . $e->getMessage());
    }
}

// Route pour déconnecter l'utilisateur.
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_GET['action']) && $_GET['action'] === 'logout') {
    session_destroy();
    sendResponse(200, 'Déconnexion réussie.');
}

// Route pour obtenir les informations du profil utilisateur.
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['action']) && $_GET['action'] === 'profile') {
    if (!isset($_SESSION['user_id'])) {
        sendResponse(401, 'Utilisateur non connecté.');
        exit;
    }

    try {
        $query = $pdo->prepare('SELECT username, email FROM users WHERE id = ?');
        $query->execute([$_SESSION['user_id']]);
        $user = $query->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            sendResponse(200, 'Profil utilisateur récupéré avec succès.', $user);
        } else {
            sendResponse(404, 'Utilisateur non trouvé.');
        }
    } catch (PDOException $e) {
        sendResponse(500, 'Erreur interne : ' . $e->getMessage());
    }
}

?>
