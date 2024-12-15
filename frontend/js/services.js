const servicesList = document.getElementById('servicesList');

async function fetchServices() {
    try {
        const response = await fetch('http://localhost/api/services.php');
        const data = await response.json();
        displayServices(data);
    } catch (error) {
        console.error('Error fetching services:', error);
    }
}

function displayServices(services) {
    servicesList.innerHTML = '';
    services.forEach(service => {
        const card = document.createElement('div');
        card.classList.add('service-card');
        card.innerHTML = `
            <img src="${service.image}" alt="${service.name}">
            <h2>${service.name}</h2>
            <p>${service.description}</p>
        `;
        servicesList.appendChild(card);
    });
}

fetchServices();
