const reviewForm = document.getElementById('addReview');
const reviewsList = document.getElementById('reviewsList');

// Mock data for reviews
const reviews = [
    { rating: 5, comment: 'Amazing experience!', user: 'Alice' },
    { rating: 4, comment: 'Loved the animals.', user: 'Bob' }
];

function displayReviews() {
    reviewsList.innerHTML = '';
    reviews.forEach(review => {
        const reviewCard = document.createElement('div');
        reviewCard.classList.add('reviewCard');
        reviewCard.innerHTML = `
            <strong>Rating:</strong> ${review.rating} Stars<br>
            <strong>Comment:</strong> ${review.comment}<br>
            <em>- ${review.user}</em>
        `;
        reviewsList.appendChild(reviewCard);
    });
}

reviewForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const rating = parseInt(document.getElementById('rating').value);
    const comment = document.getElementById('comment').value;

    // Add review to list (mock functionality)
    reviews.push({ rating, comment, user: 'Anonymous' });
    displayReviews();

    // Clear form
    reviewForm.reset();
});

// Initial display
displayReviews();
