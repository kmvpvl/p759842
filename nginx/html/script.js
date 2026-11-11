const galleryMap = {
    "zmejeborec-trig": "zmejeborec-gallery",
    "starkon-trig": "starkon-gallery",
    "greenbank-trig": "greenbank-gallery",
    "monsoon-trig": "monsoon-gallery",
    "sbc-trig": "sbc-gallery",
    "time-trig": "time-gallery",
    "about-me-trig": "about-me-gallery",
    "hire-me-trig": "hire-me-gallery",
    "other-trig": "other-gallery",
    "cp-trig": "cp-gallery"
};

const galleries = document.querySelectorAll("[id$='-gallery']");
const triggers = document.querySelectorAll(".project-list-item, .header-buttons");

function hideAllGalleries() {
    galleries.forEach((gallery) => {
        gallery.hidden = true;
    });
}

hideAllGalleries();

triggers.forEach((trigger) => {
    const targetGalleryId = galleryMap[trigger.id];
    if (!targetGalleryId) return;

    const targetGallery = document.getElementById(targetGalleryId);
    if (!targetGallery) return;

    trigger.addEventListener("click", () => {
        const isVisible = !targetGallery.hidden;
        hideAllGalleries();

        if (!isVisible) {
            targetGallery.hidden = false;
            loadVisibleVideos();
        }
    });
});

function loadVideo(video) {
    const sources = video.querySelectorAll("source[data-src]");
    sources.forEach((source) => {
        source.src = source.dataset.src;
        delete source.dataset.src;
    });

    if (sources.length > 0) {
        video.load();
    }
}

const lazyVideos = document.querySelectorAll("video[loading='lazy']");

function loadVisibleVideos() {
    lazyVideos.forEach((video) => {
        if (video.closest("[hidden]") || !video.querySelector("source[data-src]")) return;

        const bounds = video.getBoundingClientRect();
        if (bounds.bottom >= -200 && bounds.top <= window.innerHeight + 200) {
            loadVideo(video);
        }
    });
}

window.addEventListener("scroll", loadVisibleVideos, { passive: true });
window.addEventListener("resize", loadVisibleVideos);