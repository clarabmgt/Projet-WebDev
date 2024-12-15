<?php
require_once 'db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $animalName = $_GET['animal'];

    $sql = "SELECT enclosures.id, enclosures.name, enclosures.description 
            FROM enclosures 
            INNER JOIN animals ON enclosures.id = animals.enclosure_id 
            WHERE animals.name LIKE ?";
    $stmt = $conn->prepare($sql);
    $animalSearch = '%' . $animalName . '%';
    $stmt->bind_param('s', $animalSearch);
    $stmt->execute();
    $result = $stmt->get_result();

    $enclosures = [];
    while ($row = $result->fetch_assoc()) {
        $enclosures[] = $row;
    }

    echo json_encode($enclosures);

    $stmt->close();
    $conn->close();
}
?>
