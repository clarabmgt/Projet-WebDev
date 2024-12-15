<?php
// db.php : Configuration de la base de données.

$host = 'localhost';       // Adresse de l'hôte (localhost ou IP)
$dbname = 'zoo';           // Nom de la base de données
$username = 'root';        // Nom d'utilisateur MySQL
$password = '';            // Mot de passe MySQL

try {
    // Créer une connexion PDO.
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Gestion des erreurs de connexion.
    die("Erreur de connexion à la base de données : " . $e->getMessage());
}
?>
