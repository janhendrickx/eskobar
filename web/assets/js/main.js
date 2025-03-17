document.addEventListener('DOMContentLoaded', function () {
    window.navigate = function(target) {
        const container = document.getElementById('container');
        const buttons = document.querySelectorAll('.btn-back');
        if (target === 'menu') {
            container.style.transform = 'translateX(0)'; // Ga naar Menu
            console.log('menu: ', target);
        } else if (target === 'home') {
            container.style.transform = 'translateX(-100%)'; // Ga naar Home
            console.log('home');
        } else if (target === 'info') {
            container.style.transform = 'translateX(-200%)'; // Ga naar Info
            console.log('info');
        }
    };
});

// const buttons = document.querySelectorAll('.btn');

// function updatePosition() {
//     const viewportHeight = window.innerHeight;
//     const scrollY = window.scrollY;

//     buttons.forEach(button => {
//         const newPosition = scrollY + viewportHeight * 0.5; // Bereken de nieuwe top-positie
//         button.style.position = 'absolute'; // Zorg ervoor dat position op 'absolute' staat
//         button.style.top = `${newPosition}px`; // Pas de top-waarde aan
//     });
// }

// window.addEventListener('scroll', updatePosition);
// window.addEventListener('resize', updatePosition);

// // Initialiseer de posities direct bij pagina-laden
// updatePosition();

