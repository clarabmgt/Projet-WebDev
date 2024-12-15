const routeForm = document.getElementById('routeForm');
const routeResult = document.getElementById('routeResult');

routeForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const start = document.getElementById('start').value;
    const destination = document.getElementById('destination').value;

    if (start === destination) {
        routeResult.textContent = 'You are already at your destination!';
    } else {
        // Simulate a route calculation
        routeResult.textContent = `Route from ${start} to ${destination}: Take path A → Turn left → Arrive at ${destination}.`;
    }
});
