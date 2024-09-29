document.getElementById('loginForm').addEventListener('submit', async function (e) {
    e.preventDefault();
  
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
  
    try {
      const response = await fetch('/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, password })
      });
  
      const data = await response.json();
      if (response.ok) {
        document.getElementById('message').innerText = 'Login successful';
        // You can now redirect to another page or show subscription details
      } else {
        document.getElementById('message').innerText = data.message;
      }
    } catch (error) {
      document.getElementById('message').innerText = 'Error logging in';
    }
  });
  

  // make password 8+
  function validatePassword() {
    var password = document.getElementById("password").value;
    if (password.length < 8) {
      alert("Password must be at least 8 characters long.");
      return false;
    }
    return true;
  }