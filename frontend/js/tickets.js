const ticketForm = document.getElementById('buyTickets');
const totalCost = document.getElementById('totalCost');

ticketForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const ticketType = document.getElementById('ticketType').value;
    const quantity = parseInt(document.getElementById('quantity').value);

    let price = 0;
    if (ticketType === 'adult') price = 20;
    else if (ticketType === 'child') price = 10;
    else if (ticketType === 'senior') price = 15;

    const total = price * quantity;
    totalCost.textContent = `Total cost: $${total}`;
});
