const enclosuresList = document.getElementById('enclosuresList');
const searchBar = document.getElementById('searchBar');

async function fetchEnclosures() {
    try {
        const response = await fetch('http://localhost/api/enclosures.php');
        const data = await response.json();
        displayEnclosures(data);
    } catch (error) {
        console.error('Error fetching enclosures:', error);
    }
}

function displayEnclosures(enclosures) {
    enclosuresList.innerHTML = '';
    enclosures.forEach(enclosure => {
        const card = document.createElement('div');
        card.classList.add('enclosure-card');
        card.innerHTML = `
            <img src="${enclosure.image}" alt="${enclosure.name}">
            <h2>${enclosure.name}</h2>
            <p>${enclosure.biome}</p>
            <button onclick="viewDetails(${enclosure.id})">View Details</button>
        `;
        enclosuresList.appendChild(card);
    });
}

function viewDetails(id) {
    window.location.href = `enclosure-details.html?id=${id}`;
}

searchBar.addEventListener('input', (e) => {
    const query = e.target.value.toLowerCase();
    const cards = document.querySelectorAll('.enclosure-card');
    cards.forEach(card => {
        const animalName = card.querySelector('h2').textContent.toLowerCase();
        card.style.display = animalName.includes(query) ? 'block' : 'none';
    });
});

fetchEnclosures();
