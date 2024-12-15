<?php
require_once 'db_connection.php';

function findShortestPath($graph, $start, $end) {
    $distances = [];
    $previousNodes = [];
    $queue = new SplPriorityQueue();

    foreach ($graph as $node => $edges) {
        $distances[$node] = INF;
        $previousNodes[$node] = null;
        $queue->insert($node, INF);
    }

    $distances[$start] = 0;
    $queue->insert($start, 0);

    while (!$queue->isEmpty()) {
        $current = $queue->extract();

        if ($current === $end) {
            $path = [];
            while ($previousNodes[$current]) {
                $path[] = $current;
                $current = $previousNodes[$current];
            }
            $path[] = $start;
            return array_reverse($path);
        }

        foreach ($graph[$current] as $neighbor => $weight) {
            $newDistance = $distances[$current] + $weight;
            if ($newDistance < $distances[$neighbor]) {
                $distances[$neighbor] = $newDistance;
                $previousNodes[$neighbor] = $current;
                $queue->insert($neighbor, $newDistance);
            }
        }
    }

    return [];
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $start = $_POST['start'];
    $end = $_POST['end'];

    // Example graph (to be replaced with dynamic DB data)
    $graph = [
        'A' => ['B' => 1, 'C' => 4],
        'B' => ['A' => 1, 'C' => 2, 'D' => 5],
        'C' => ['A' => 4, 'B' => 2, 'D' => 1],
        'D' => ['B' => 5, 'C' => 1]
    ];

    $path = findShortestPath($graph, $start, $end);

    if (!empty($path)) {
        echo json_encode(['status' => 'success', 'path' => $path]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'No path found.']);
    }
}
?>
