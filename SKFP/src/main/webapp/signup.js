document.addEventListener('DOMContentLoaded', function() {
    // Check if there is a message attribute and display it
    const message = document.getElementById('message').textContent.trim();
    if (message) {
        document.getElementById('message').style.display = 'block';
    }
});

function validateForm() {
    const email = document.getElementById('email').value.trim();
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();
    const confirmPassword = document.getElementById('confirm_password').value.trim();

    if (!email || !username || !password || !confirmPassword) {
        alert('Please fill in all fields.');
        return false;
    }

    if (password !== confirmPassword) {
        alert('Passwords do not match.');
        return false;
    }

    return true;
}
