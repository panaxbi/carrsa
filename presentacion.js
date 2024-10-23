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
        document.select(`//text()[contains(.,'{{')]`).forEach(txt => {
            let value = txt.value.replace(/\{\{([^\}]+)\}\}/g, (match, key) => informe.single(`model/data/row/${key}`) || `{{${key}}}`)
            if (!isNaN(value)) {
                value = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(value)
            }
            txt.textContent = value
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
        // Pruebas de captura de imágenes
        //function captureTo(target) {
        //    const source = this;

        //    html2canvas(source).then(canvas => {
        //        target.src = canvas.toDataURL("image/png");
        //    });
        //}

        //function getScreenshotOfElement(element, posX, posY, width, height, callback) {
        //    html2canvas(element, {
        //        onrendered: function (canvas) {
        //            var context = canvas.getContext('2d');
        //            var imageData = context.getImageData(posX, posY, width, height).data;
        //            var outputCanvas = document.createElement('canvas');
        //            var outputContext = outputCanvas.getContext('2d');
        //            outputCanvas.width = width;
        //            outputCanvas.height = height;

        //            var idata = outputContext.createImageData(width, height);
        //            idata.data.set(imageData);
        //            outputContext.putImageData(idata, 0, 0);
        //            callback(outputCanvas.toDataURL().replace("data:image/png;base64,", ""));
        //        },
        //        width: width,
        //        height: height,
        //        useCORS: true,
        //        taintTest: false,
        //        allowTaint: false
        //    });
        //}


        //for (let [ix, snapshot] of Object.entries(document.querySelectorAll(`.grid-frame-view-visible-class img`))) {
        //    captureTo.call(document.querySelectorAll('.PageContentSizeWrapper')[ix], snapshot)
        //}
    } catch (error) {
        console.error('Error:', error);
    }
})(); 