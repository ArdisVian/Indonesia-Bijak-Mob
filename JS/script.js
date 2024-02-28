// Toggle class active
const navbarNav = document.querySelector('.navbar-nav');

// Hamburger menu di klik
document.querySelector('#hamburger-menu').onclick = () => {
    navbarNav.classList.toggle('active');

};

// Klik luar sidebar menghilangkan nav
const hamburger = document.querySelector('#hamburger-menu');

document.addEventListener('click', function (e) {
    if (!hamburger.contains(e.target) && !navbarNav.contains(e.target)) {
        navbarNav.classList.remove('active')
    }
});

// Slideshow functionality
let slideIndex = 0;

function showSlides() {
    let i;
    const slides = document.querySelectorAll('.partai-slide');
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = 'none';
    }
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1;
    }
    slides[slideIndex - 1].style.display = 'block';
    setTimeout(showSlides, 1000); // Change image every 1 second
}

showSlides();
