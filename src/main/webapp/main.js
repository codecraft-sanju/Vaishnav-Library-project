// show menu
const navMenu = document.getElementById('nav-menu'),
    navToggle = document.getElementById('nav-toggle'),
    navClose = document.getElementById('nav-close')

//menu show
if (navToggle) {
    navToggle.addEventListener('click', () => {
            navMenu.classList.add('show-menu')
        })
}
    
//menuhidden
if (navClose) {
    navClose.addEventListener('click', () => {
        navMenu.classList.remove('show-menu')
    })
}

//Remove menu mobile
const navLink = document.querySelectorAll('.nav__link')
const linkAction = () => {
    const navMenu = document.getElementById('nav-menu')
    navMenu.classList.remove('show-menu')
}
navLink.forEach(n => n.addEventListener('click', linkAction))

//change background header
const bgHeader = () => {
    const header = document.getElementById('header')
    //when the scroll is greater than 50 viewport height, add the bg-header class to the header tag
    this.scrollY >= 50 ? header.classList.add('bg-header')
        : header.classList.remove('bg-header')
}
window.addEventListener('scroll', bgHeader)

//gsap animation
gsap.from('.home__img-2', 1.2, { opacity: 0, y: 200, delay: .1 })
gsap.from('.home__img-3', 1.2, { opacity: 0, y: 200, delay: .5 })
gsap.from('.home__data', 1.2, { opacity: 0, y: -60, delay: .1 })
gsap.from('.home__bird-1', 1.2, { opacity: 0, x: -80, delay: 1.1 })
gsap.from('.home__bird-2', 1.2, { opacity: 0, x: 80, delay: 1.2 })
gsap.from('.home__img-1', 1.2, { opacity: 0, y: 200, delay: 1.2 })
gsap.from('.home__img-4', 1.2, { opacity: 0, x: 200, delay: 1.3 })


// Dark Mode Toggle
const darkModeToggle = document.getElementById('dark-mode-toggle');
const themeIcon = document.getElementById('theme-icon');
const body = document.body;

const setDarkMode = (isDark) => {
    if (isDark) {
        body.classList.add('dark-theme');
        themeIcon.classList.replace('ri-sun-line', 'ri-moon-line');
    } else {
        body.classList.remove('dark-theme');
        themeIcon.classList.replace('ri-moon-line', 'ri-sun-line');
    }
}

// Check for saved theme in local storage
const savedTheme = localStorage.getItem('dark-theme');
if (savedTheme === 'enabled') {
    setDarkMode(true);
} else {
    setDarkMode(false);
}

darkModeToggle.addEventListener('click', () => {
    const isDark = body.classList.contains('dark-theme');
    setDarkMode(!isDark);

    // Save the theme preference to local storage
    localStorage.setItem('dark-theme', !isDark ? 'enabled' : 'disabled');
});




