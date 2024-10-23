function getPrecedingSiblingsWithClass(element, selector) {
    const siblings = [];
    let prev = element.previousElementSibling;

    while (prev) {
        if (prev.matches(selector)) {
            siblings.push(prev);
        }
        prev = prev.previousElementSibling;
    }

    return siblings;
}
if (document.querySelector(`form[action*="live.com"]`)) {
    [...document.querySelectorAll(`body > :not([id="applicationOuterContainer"]),iframe,link[href^=http],link[href*=download],script,#regionComposerRoot > *,.ShapeSelectionOverlay,.CommentsOverlay,.AnimationMarkersOverlay,.ShapeMoveHandle,.GrippersContainer,#PageViewHiddenLabel,svg:has(.ShapeMoveHandle)`), document.querySelectorAll(`#WACInnerFrame`)[1]].filter(el => el && !["EditorContainer", "NearPane"].includes(el.id)).forEach(el => el.remove());

    [...document.querySelectorAll(`form[action*="live.com"]`)].forEach(el => el.setAttributeNS(null, 'action', 'javascript:void(0);'));

    [...document.querySelectorAll(`style:not([href])`)].filter(el => !el.textContent.trim()).forEach(el => el.remove());
}
[...document.querySelectorAll(`image[href^="./"]`)].forEach(image => image.setAttribute("href", image.getAttribute("href").replace(/^\.(\/media)/, document.querySelector(`link[href^="./"]`).getAttribute("href").replace(/\/[^\/]+$/, '') + `$1`)));

[...document.querySelectorAll(`image[href^="blob:"],image:not([pointer-events=none]):not([href])`)].filter(image => image.hasAttribute("href") || image.hasAttributeNS('http://www.w3.org/1999/xlink', 'href')).map((image, ix, arr) => [image, [...new Set(arr.map(image => image.getAttribute("href")))].indexOf(image.getAttribute("href")) + 1, image.getAttribute("href"), getPrecedingSiblingsWithClass(image.closest(`.PageContentSizeWrapper`), '.PageContentSizeWrapper').length]).filter(([, , src]) => src).forEach(([image, ix]) => {
    image.setAttribute("href", `./media/image${ix}.jpeg`);
    image.setAttribute("onerror", `let href = this.getAttribute("href"); href.indexOf(".jpeg") != -1 && this.setAttribute("href",href.replace(".jpeg", ".png"))`);
});
function activateSlide(ix) {
    ix = !isNaN(Number(ix)) ? ix : [...document.querySelectorAll('.content-image-view-visible-class')].findIndex(el => el == this);
    document.querySelectorAll('.PageContentSizeWrapper').forEach(wrapper => wrapper.style.display = 'none');
    document.querySelectorAll('.PageContentSizeWrapper')[ix].style.display = 'inherit'
    document.querySelectorAll(`.grid-frame-view-visible-class`).forEach(wrapper => wrapper.classList.remove("grid-frame-view-selected-class"));
    document.querySelectorAll(`.grid-frame-view-visible-class`)[ix].classList.add("grid-frame-view-selected-class");

    document.querySelector(`button.pptonline-thumbnail-panel-toggle-button`).setAttribute("onclick", `closest('#NearPaneRegion').classList.toggle('hidden')`)
}

for (let img of document.querySelectorAll('.content-image-view-visible-class')) {
    img.addEventListener('click', activateSlide)
}

for (let slide of document.querySelectorAll('#WACViewPanel')) {
    slide.addEventListener('dblclick', function () {
        toggleFullscreen(this)
    })
}

var currentSlideIndex = 0;
function toggleFullscreen(silde) {
    if (document.exitFullscreen && document.fullscreenElement) {
        document.exitFullscreen();
    } else {
        currentSlideIndex = [...document.querySelectorAll('.PageContentSizeWrapper')].findIndex(wrapper => wrapper.style.display != 'none');
        silde.requestFullscreen();
    }
}

document.addEventListener('keydown', function (event) {
    if (!document.fullscreenElement) {
        return
    }
    let totalSlides = document.querySelectorAll('.PageContentSizeWrapper').length;
    switch (event.key) {
        case 'Home':
            currentSlideIndex = 0;
            break;
        case 'End':
            currentSlideIndex = totalSlides - 1;
            break;
        case 'ArrowRight': 
        case 'PageDown':
            if (currentSlideIndex < totalSlides - 1) {
                currentSlideIndex++;
            } else if (document.exitFullscreen && document.fullscreenElement) {
                document.exitFullscreen();
            }
            break;
        case 'ArrowLeft': 
        case 'PageUp':
            if (currentSlideIndex > 0) {
                currentSlideIndex--;
            }
            break;
    }
    activateSlide(currentSlideIndex);
});

document.addEventListener('wheel', function (event) {
    if (!document.fullscreenElement) {
        return
    }
    let totalSlides = document.querySelectorAll('.PageContentSizeWrapper').length;
    if (event.deltaY > 0) {
        if (currentSlideIndex < totalSlides - 1) {
            currentSlideIndex++;
            activateSlide(currentSlideIndex);
        }
    } else {
        if (currentSlideIndex > 0) {
            currentSlideIndex--;
            activateSlide(currentSlideIndex);
        }
    }
});


setTimeout(() => [...document.querySelectorAll(`image[onerror]`)].forEach(image => image.removeAttribute("onerror")), 5000);