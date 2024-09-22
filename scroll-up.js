// Function to scroll to the top of the page
function scrollToTop() {
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  }
  
  // Function to show/hide the button based on scroll position
  function handleScroll() {
    const button = document.querySelector('.button');
    
    if (window.scrollY > 200) { // Show button after scrolling 200px down
      button.classList.add('active'); // Add the 'active' class to show the button
    } else {
      button.classList.remove('active'); // Remove the 'active' class to hide the button
    }
  }
  
  // Add event listeners
  document.addEventListener('scroll', handleScroll); // Monitor scroll event
  document.querySelector('.button').addEventListener('click', scrollToTop);
  