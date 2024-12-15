<?php
require_once 'db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $enclosureId = $_POST['enclosureId'];
    $reviewText = $_POST['reviewText'];
    $rating = intval($_POST['rating']);

    $sql = "INSERT INTO reviews (enclosure_id, review_text, rating) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('isi', $enclosureId, $reviewText, $rating);

    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Review submitted successfully!']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to submit review.']);
    }

    $stmt->close();
    $conn->close();
} elseif ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $enclosureId = $_GET['enclosureId'];

    $sql = "SELECT review_text, rating FROM reviews WHERE enclosure_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $enclosureId);
    $stmt->execute();
    $result = $stmt->get_result();

    $reviews = [];
    while ($row = $result->fetch_assoc()) {
        $reviews[] = $row;
    }

    echo json_encode($reviews);

    $stmt->close();
    $conn->close();
}
?>
