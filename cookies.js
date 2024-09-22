/*let showBookmarkedOnly = false; // Toggle state

// Function to toggle bookmark status                                                  //MALE
function toggleBookmark(pictureId) {
    const picture = document.getElementById(pictureId);
    picture.classList.toggle('bookmarked'); // Toggle the bookmarked class
    saveBookmarks(); // Save the current bookmarks to cookies
}

// Function to save the bookmarked pictures into a cookie                              //MALE
function saveBookmarks() {
    // if (getCookie('cookiesAccepted') !== 'true') return; // Check if cookies are accepted                    <--- cookie perm
    const bookmarkedPics = [];
    document.querySelectorAll('.picture.bookmarked').forEach((pic) => {
        bookmarkedPics.push(pic.id);
    });
    document.cookie = "bookmarks=" + JSON.stringify(bookmarkedPics) + ";path=/";
}

// Function to load bookmarks from the cookie
function loadBookmarks() {
    // if (getCookie('cookiesAccepted') !== 'true') return; // Only load if cookies are accepted                <--- cookie perm
    const cookieArr = document.cookie.split(';');
    let bookmarksCookie = cookieArr.find(row => row.trim().startsWith('bookmarks='));
    if (bookmarksCookie) {
        const bookmarks = JSON.parse(bookmarksCookie.split('=')[1]);
        bookmarks.forEach((picId) => {
            document.getElementById(picId).classList.add('bookmarked'); // Mark as bookmarked
        });
    }
}

// Function to get a cookie value by name
function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
    return "";
}


// Function to accept cookies
function acceptCookies() {
    document.cookie = "cookiesAccepted=true;path=/";
    document.getElementById('cookieConsent').style.display = 'none';
    loadBookmarks(); // Load bookmarks now that cookies are accepted
}

// Show cookie consent banner if cookies not accepted
function checkCookieConsent() {
    if (getCookie('cookiesAccepted') !== 'true') {
        document.getElementById('cookieConsent').style.display = 'block';
    } else {
        loadBookmarks(); // If cookies were already accepted, load bookmarks
    }
}


// Function to toggle between showing all and only bookmarked pictures
function toggleBookmarkedView() {
    showBookmarkedOnly = !showBookmarkedOnly;
    const pictures = document.querySelectorAll('.picture');
    if (showBookmarkedOnly) {
        document.getElementById('toggleButton').innerText = "FAVORITES ONLY";
        pictures.forEach(picture => {
            if (!picture.classList.contains('bookmarked')) {
                picture.classList.add('hidden'); // Hide non-bookmarked pictures
            }
        });
    } else {
        document.getElementById('toggleButton').innerText = "FAVORITES ONLY";
        pictures.forEach(picture => {
            picture.classList.remove('hidden'); // Show all pictures
        });
    }
}

// Function to delete cookies
function deleteCookies() {
    document.cookie = "bookmarks=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
    document.cookie = "cookiesAccepted=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
    alert("Cookies have been deleted. Bookmarks will be cleared.");
    document.querySelectorAll('.picture.bookmarked').forEach((pic) => {
        pic.classList.remove('bookmarked');
    });
    document.getElementById('cookieConsent').style.display = 'block';
}

// Load bookmarks or show consent when the page loads
/* window.onload = checkCookieConsent;
window.onload = loadBookmarks;
*/


/*
    DOT COLOR     


let isRed = false;

// Function to toggle the color of the dot
function toggleStatus() {
    const dot = document.querySelector('.dot');

    if (isRed) {
        dot.classList.remove('red'); // Switch to green
    } else {
        dot.classList.add('red'); // Switch to red
    }

    isRed = !isRed; // Toggle state
}

*/











let showBookmarkedOnly = false; // Toggle state

// Function to toggle bookmark status for male outfits
function toggleBookmarkMale(pictureId) {
    const picture = document.getElementById(pictureId);
    picture.classList.toggle('bookmarked-male'); // Toggle the bookmarked-male class
    saveMaleBookmarks(); // Save the current male bookmarks to cookies
}

// Function to toggle bookmark status for female outfits
function toggleBookmarkFemale(pictureId) {
    const picture = document.getElementById(pictureId);
    picture.classList.toggle('bookmarked-female'); // Toggle the bookmarked-female class
    saveFemaleBookmarks(); // Save the current female bookmarks to cookies
}

// Function to save male bookmarked pictures into a cookie
function saveMaleBookmarks() {
    const bookmarkedMalePics = [];
    document.querySelectorAll('.picture.bookmarked-male').forEach((pic) => {
        bookmarkedMalePics.push(pic.id);
    });
    document.cookie = "maleBookmarks=" + JSON.stringify(bookmarkedMalePics) + ";path=/";
}

// Function to save female bookmarked pictures into a cookie
function saveFemaleBookmarks() {
    const bookmarkedFemalePics = [];
    document.querySelectorAll('.picture.bookmarked-female').forEach((pic) => {
        bookmarkedFemalePics.push(pic.id);
    });
    document.cookie = "femaleBookmarks=" + JSON.stringify(bookmarkedFemalePics) + ";path=/";
}

// Function to load male and female bookmarks from cookies
function loadBookmarks() {
    const cookieArr = document.cookie.split(';');
    
    // Load male bookmarks
    let maleBookmarksCookie = cookieArr.find(row => row.trim().startsWith('maleBookmarks='));
    if (maleBookmarksCookie) {
        const maleBookmarks = JSON.parse(maleBookmarksCookie.split('=')[1]);
        maleBookmarks.forEach((picId) => {
            document.getElementById(picId).classList.add('bookmarked-male'); // Mark as male bookmarked
        });
    }

    // Load female bookmarks
    let femaleBookmarksCookie = cookieArr.find(row => row.trim().startsWith('femaleBookmarks='));
    if (femaleBookmarksCookie) {
        const femaleBookmarks = JSON.parse(femaleBookmarksCookie.split('=')[1]);
        femaleBookmarks.forEach((picId) => {
            document.getElementById(picId).classList.add('bookmarked-female'); // Mark as female bookmarked
        });
    }
}

// Function to toggle between showing all and only bookmarked pictures (male and female)
function toggleBookmarkedView() {
    showBookmarkedOnly = !showBookmarkedOnly;
    const pictures = document.querySelectorAll('.picture');
    if (showBookmarkedOnly) {
        document.getElementById('toggleButton').innerText = "FAVORITES ONLY";
        pictures.forEach(picture => {
            if (!picture.classList.contains('bookmarked-male') && !picture.classList.contains('bookmarked-female')) {
                picture.classList.add('hidden'); // Hide non-bookmarked pictures
            }
        });
    } else {
        document.getElementById('toggleButton').innerText = "FAVORITES ONLY";
        pictures.forEach(picture => {
            picture.classList.remove('hidden'); // Show all pictures
        });
    }
}

// Function to delete cookies for both male and female bookmarks
function deleteCookies() {
    document.cookie = "maleBookmarks=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
    document.cookie = "femaleBookmarks=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
    document.cookie = "cookiesAccepted=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
    alert("Cookies have been deleted. Bookmarks will be cleared.");
    document.querySelectorAll('.picture.bookmarked-male').forEach((pic) => {
        pic.classList.remove('bookmarked-male');
    });
    document.querySelectorAll('.picture.bookmarked-female').forEach((pic) => {
        pic.classList.remove('bookmarked-female');
    });
    document.getElementById('cookieConsent').style.display = 'block';
}

// Function to accept cookies
function acceptCookies() {
    document.cookie = "cookiesAccepted=true;path=/";
    document.getElementById('cookieConsent').style.display = 'none';
    loadBookmarks(); // Load bookmarks now that cookies are accepted
}

// Show cookie consent banner if cookies not accepted
function checkCookieConsent() {
    if (getCookie('cookiesAccepted') !== 'true') {
        document.getElementById('cookieConsent').style.display = 'block';
    } else {
        loadBookmarks(); // If cookies were already accepted, load bookmarks
    }
}

// Function to get a cookie value by name
function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
    return "";
}

// Load bookmarks or show consent when the page loads
window.onload = loadBookmarks;
