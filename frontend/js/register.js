document.getElementById('registerForm').addEventListener('submit', async function (event) {
    event.preventDefault();

    const username = document.getElementById('username').value;
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    if (password !== confirmPassword) {
        alert("Passwords do not match!");
        return;
    }

    const data = {
        username: username,
        email: email,
        password: password
    };

    try {
        const response = await fetch('http://localhost/api/register.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        });

        const result = await response.json();
        if (result.success) {
            alert('Registration successful! Redirecting to login...');
            window.location.href = "login.html";
        } else {
            alert(`Error: ${result.message}`);
        }
    } catch (error) {
        console.error('Error during registration:', error);
        alert('Something went wrong. Please try again later.');
    }
});
