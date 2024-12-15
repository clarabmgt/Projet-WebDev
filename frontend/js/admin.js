document.querySelectorAll('.closeBtn').forEach(button => {
    button.addEventListener('click', () => {
        alert('Enclosure marked as closed.');
        log("hh");
        });
});

document.querySelectorAll('.openBtn').forEach(button => {
    button.addEventListener('click', () => {
        alert('Enclosure reopened to the public.');
        // Logic to update status in the backend
    });
});

document.querySelectorAll('.updateTimeBtn').forEach(button => {
    button.addEventListener('click', () => {
        const newTime = prompt('Enter new feeding time (e.g., 2:00 PM):');
        if (newTime) {
            alert(`Feeding time updated to ${newTime}`);
            // Logic to update feeding time in the backend
        }
    });
});
