<?php

require_once 'user.php';

// Fetch all enclosures
function getAllEnclosures() {
    $pdo = connectDatabase();
    $stmt = $pdo->query("SELECT * FROM enclosures");
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Fetch a specific enclosure by ID
function getEnclosureById($id) {
    $pdo = connectDatabase();
    $stmt = $pdo->prepare("SELECT * FROM enclosures WHERE id = :id");
    $stmt->execute([':id' => $id]);
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

// Create a new enclosure (admin only)
function createEnclosure($name, $description, $biome) {
    $pdo = connectDatabase();

    $stmt = $pdo->prepare(
        "INSERT INTO enclosures (name, description, biome) VALUES (:name, :description, :biome)"
    );

    $stmt->execute([
        ':name' => $name,
        ':description' => $description,
        ':biome' => $biome
    ]);
}

// Update an enclosure (admin only)
function updateEnclosure($id, $name, $description, $biome, $underConstruction) {
    $pdo = connectDatabase();

    $stmt = $pdo->prepare(
        "UPDATE enclosures SET name = :name, description = :description, biome = :biome, under_construction = :underConstruction WHERE id = :id"
    );

    $stmt->execute([
        ':id' => $id,
        ':name' => $name,
        ':description' => $description,
        ':biome' => $biome,
        ':underConstruction' => $underConstruction
    ]);
}

// Delete an enclosure (admin only)
function deleteEnclosure($id) {
    $pdo = connectDatabase();

    $stmt = $pdo->prepare("DELETE FROM enclosures WHERE id = :id");
    $stmt->execute([':id' => $id]);
}

?>
