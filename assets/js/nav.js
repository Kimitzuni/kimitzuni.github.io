window.addEventListener('scroll', (event) => {
    let em = 10;
    let sz = Math.max(3*em, 5.5*em-window.scrollY*0.2);
    let opacity = 4 - window.scrollY / (5*em);
    let nav = document.getElementsByClassName("nav-container")[0];
    nav.style.opacity = opacity.toString();
});