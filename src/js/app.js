import JSConfetti from 'https://cdn.jsdelivr.net/npm/js-confetti@0.12.0/+esm'
import '../css/app.css';
import * as ryan from '../images/ryan-rect.jpg';
document.addEventListener('DOMContentLoaded', () => {
    const jsConfetti = new JSConfetti()
    jsConfetti.addConfetti({})
});

// Get the button and the target div
const showConeBtn = document.getElementById('showCone');
const coneDiv = document.getElementById('cone');

showConeBtn.addEventListener('click', () => {
    console.log(ryan)
    // Dynamically create an img tag and set the src to the imported image
    const img = document.createElement('img');
    img.src = ryan.default || ryan; // Use ryan.default if it's an object, or just ryan if it's a path
    img.alt = 'Ryan Image';
    img.style.width = '100%'; // Optional styling
    img.style.height = 'auto'; // Optional styling

    // Append the image to the coneDiv
    coneDiv.innerHTML = ''; // Clear previous content if needed
    coneDiv.appendChild(img);
});