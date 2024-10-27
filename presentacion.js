(async () => {
    try {
        for (let image of document.querySelectorAll(`#WACViewPanel image[href*="./presentacion_files/media/image5.png"]`)) {
            let target = image.closest('div');
            target.setAttribute("xo-stylesheet", "resumen.xslt");
            await target.render();
        }
        activateSlide(4)
        let informe = xover.sources["presentacion.xml"];
        await informe.ready;
        await xover.evaluateReferencers.call(document, function (key) {
            let value = informe.single(`model/data/row`).single(key) || `{{${key}}}`;
            if (!["año"].includes(value.name) && !isNaN(value.toString())) {
                value = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(value)
            }
            return value
        });
        for (let target of document.querySelectorAll(`#ChartPlayerViewDiv`)) {
            let data = [...target.closest(".SlideContent").querySelectorAll("table .TableCellContent")].map(el => el.textContent)
            updateChart.apply(target,
                [data.slice(0, Math.ceil(data.length / 2)), data.slice(Math.ceil(data.length / 2))]
            );
        }
        for (let [ix, miniature] of Object.entries(document.querySelectorAll('.content-image-view-visible-class'))) {
            miniature.classList.add('SlideMiniature');
            let slide = document.querySelectorAll(`.SlideContent`)[ix].cloneNode(true);
            miniature.replaceChildren(slide)
        }
    } catch (error) {
        console.error('Error:', error);
    }
})(); 