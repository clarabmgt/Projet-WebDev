<?php
require_once 'db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fullName = $_POST['fullName'];
    $email = $_POST['email'];
    $ticketType = $_POST['ticketType'];
    $quantity = intval($_POST['quantity']);

    $prices = ['adult' => 20, 'child' => 10, 'senior' => 15];
    $totalCost = $prices[$ticketType] * $quantity;

    $sql = "INSERT INTO tickets (full_name, email, ticket_type, quantity, total_cost) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('sssii', $fullName, $email, $ticketType, $quantity, $totalCost);

    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Ticket purchased successfully!', 'totalCost' => $totalCost]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to purchase ticket.']);
    }

    $stmt->close();
    $conn->close();
}
?>
