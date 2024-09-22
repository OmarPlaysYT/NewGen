document.querySelector('.nav-toggle').addEventListener('click', function() {
    const navItems = document.querySelector('.nav-items');
    navItems.style.display = (navItems.style.display === 'block') ? 'none' : 'block';
});
// Toggling the menu in small screens
document.querySelector('.nav-toggle').addEventListener('click', function() {
    const navItems = document.querySelector('.nav-items');
    navItems.classList.toggle('show'); // Toggle the 'show' class to display/hide the menu
});