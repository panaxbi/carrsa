async function initPresentation() {
    this.initializing = this.initializing || xover.delay(1).then(async () => {
        try {
            for (let image of document.querySelectorAll(`#WACViewPanel image[href*="./presentacion_files/media/image5.png"]`)) {
                activateSlide(0)
                let target = image.closest('div');
                target.setAttribute("xo-stylesheet", "resumen.xslt");
                await target.render();
            }
            let informe = xover.stores["#presentacion"];
            await informe.ready;
            let row = informe.single(`//data/*[@rs=//razon_social/@state:selected][@month=//meses/@state:selected]`) || informe.single(`*`);
            if (!row) {
                return Promise.reject(new Error('Información no disponible'));
            }

            await xover.signal.update.call(row, document, function (key) {
                let value = row.single(key) || '';// `<slot name="${key.replace(/"/g,'&quote;')}"/>`;//`{{${key}}}`;
                if (!["año"].includes(value.name) && value != '' && !isNaN(value.toString())) {
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
    }).finally(() => {
        delete this.initializing
    })
}

top.window.initPresentation = initPresentation;
initPresentation()
xover.listener.on(`change::model/*[@xsi:type="dimension"]/@state:selected`, function ({ value, old }) {
    if (value || !value && old) {
        initPresentation()
    }
})