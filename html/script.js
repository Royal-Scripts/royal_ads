let hideTimeout;

window.addEventListener('message', function (event) {
    if (event.data.type === "showAd") {
        const text = event.data.text;
        const name = event.data.name || "Anonymous";

        const adContainer = document.getElementById('ad-container');
        const adText = document.getElementById('ad-text');
        const adSignature = document.getElementById('ad-signature');

        adText.innerText = text;
        adSignature.innerText = "- " + name;

        // Clear existing timeout if any
        if (hideTimeout) {
            clearTimeout(hideTimeout);
            hideTimeout = null;
        }

        // Reset animation or show
        adContainer.classList.remove('hidden');

        // Play sound if needed
        // const audio = new Audio('paper_rustle.mp3');
        // audio.play();

        // Hide after some time (match server duration 10s)
        hideTimeout = setTimeout(() => {
            adContainer.classList.add('hidden');
        }, 10000);
    }
});
