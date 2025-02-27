import '../css/app.css';
import JSConfetti from 'https://cdn.jsdelivr.net/npm/js-confetti@0.12.0/+esm'
document.addEventListener('DOMContentLoaded', () => {
    const jsConfetti = new JSConfetti()
    jsConfetti.addConfetti({
        emojis: ['💩']
    })
});