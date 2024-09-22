/* INSTANT
function copyToClipboard() {
    const emailText = document.getElementById("emailText").textContent;
    navigator.clipboard.writeText(emailText).then(function() {
        // Show "Copied!" message
        const message = document.getElementById("copyMessage");
        message.style.display = 'inline';
        
        // Hide the message after 2 seconds
        setTimeout(function() {
            message.style.display = 'none';
        }, 2000);
    });
}
*/

function copyToClipboard() {
    const emailText = document.getElementById("emailText").textContent;
    navigator.clipboard.writeText(emailText).then(function() {
        // Show "Copied!" message with fade-in
        const message = document.getElementById("copyMessage");
        message.style.opacity = '1';

        // Hide the message after 2 seconds with fade-out
        setTimeout(function() {
            message.style.opacity = '0';
        }, 2000);
    });
}