    // Wait for the window to fully load, including images
    window.addEventListener('load', function() {
        // Select the loading screen
        const loadingScreen = document.getElementById('loading-screen');
    
        // Once everything is loaded, add the 'hide-loading' class to trigger the animation
        loadingScreen.classList.add('hide-loading');
    
        // Remove the loading screen from the DOM after the animation is done (1 second delay)
        setTimeout(() => {
          loadingScreen.style.display = 'none';
        }, 1000); // Match this time with the animation duration in CSS
      });