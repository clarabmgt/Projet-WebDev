document.addEventListener('DOMContentLoaded', () => {
    const userData = JSON.parse(localStorage.getItem('userData'));

    if (!userData) {
        alert('You are not logged in!');
        window.location.href = "login.html";
        return;
    }

    document.getElementById('username').textContent = userData.username;
    document.getElementById('email').textContent = userData.email;

    document.getElementById('logoutButton').addEventListener('click', () => {
        localStorage.removeItem('userData');
        alert('You have been logged out.');
        window.location.href = "login.html";
    });
});
