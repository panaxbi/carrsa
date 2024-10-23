function interpolateAxisLabels(minAmount, maxAmount, numLines) {
    const step = (maxAmount - minAmount) / (numLines - 1);
    const labels = [];
    for (let i = 0; i < numLines; i++) {
        labels.push((minAmount + i * step).toFixed(2)); // Format to 2 decimal points
    }
    return labels;
}

function updateAxisLabels(minAmount, maxAmount, numLines, yDimensions) {
    const axisLabelsGroup = this.querySelector("#cePlotArea0_Axis_PrimaryValue0");
    const originalLabels = axisLabelsGroup.querySelectorAll('g:has(g.custom-data)');

    let model = originalLabels[0].cloneNode(true);
    originalLabels.forEach(lbl => lbl.remove());

    const labels = interpolateAxisLabels(minAmount, maxAmount, numLines);

    labels.forEach((labelText, index) => {
        const y = yDimensions.maxY - index * ((yDimensions.maxY - yDimensions.minY) / (labels.length - 1));
        const label = model.cloneNode(true);

        let text = label.querySelector('text');
        let transform = text.getAttribute("transform");
        const translate = transform.match(/matrix\(([\-\d\.\s]+)\)/);

        if (translate) {
            const values = translate[1].split(" ");
            values[5] = y; // Update Y position in the matrix
            text.setAttribute("transform", `matrix(${values.join(" ")})`);
        }

        text.textContent = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(labelText);
        axisLabelsGroup.appendChild(label);
    });
}

function updateDataPoints(dataPoints, labels, chartDimensions) {
    const seriesGroup = this.querySelector("#cePlotArea0_Series0");
    const paths = seriesGroup.querySelectorAll("path");

    const seriesData = [];

    paths.forEach(path => {
        const pathData = path.getAttribute("d");
        if (pathData) {
            const coordinates = extractCoordinatesFromPath(pathData);
            seriesData.push(coordinates);
        }
    });
    const [{ x: xStart }, { x: xEnd }] = seriesData[0];
    const { yStart, yEnd, minValue, maxValue } = chartDimensions;

    const numPoints = dataPoints.length;
    const xStep = (xEnd - xStart) / (numPoints - 1); // Space between points on the x-axis

    // Assume yStart is the highest value and yEnd is the lowest, invert values for visual purposes
    //const minValue = Math.min(...dataPoints);
    //const maxValue = Math.max(...dataPoints);
    //const yRange = maxValue - minValue;

    let newPath = `M${xStart},${mapValueToY(dataPoints[0], minValue, maxValue, yStart, yEnd)}`; // Move to first point

    for (let i = 1; i < dataPoints.length; i++) {
        const x = xStart + i * xStep; // Increment x based on the step
        const y = mapValueToY(dataPoints[i], minValue, maxValue, yStart, yEnd); // Calculate y for the data point
        newPath += ` L${x},${y}`; // Draw line to the next point
    }
    paths[0].setAttribute("d", newPath);
    paths[1].setAttribute("d", newPath);
    [...paths].slice(2).forEach(el => el.remove());

    // Plot circles for each data point
    let circles = "";
    for (let i = 0; i < dataPoints.length; i++) {
        const x = xStart + i * xStep;
        const y = mapValueToY(dataPoints[i], minValue, maxValue, yStart, yEnd);
        circles += `<circle cx="${x}" cy="${y}" r="4" fill="current" class="${paths[3].getAttribute("class")}"></circle>`;
    }

    // Append the path and data points to the chart's SVG
    seriesGroup.innerHTML += circles;


    //legends
    const legendsGroup = this.querySelector("#cePlotArea0_Axis_PrimaryCategory0");
    const originalLegends = legendsGroup.querySelectorAll('g:has(g.custom-data)');

    let model = originalLegends[0].cloneNode(true);
    originalLegends.forEach(lbl => lbl.remove());

    labels.forEach((labelText, i) => {
        const x = xStart + i * xStep;
        const label = model.cloneNode(true);

        let text = label.querySelector('text');
        let transform = text.getAttribute("transform");
        const translate = transform.match(/matrix\(([\-\d\.\s]+)\)/);

        if (translate) {
            const values = translate[1].split(" ");
            values[4] = x; // Update X position in the matrix
            text.setAttribute("transform", `matrix(${values.join(" ")})`);
        }

        text.textContent = labelText;
        legendsGroup.appendChild(label);
    });
}

function updateChart(axisLabels, dataPoints) {
    dataPoints = dataPoints = dataPoints.map(el => parseFloat(typeof (el) == 'string' ? el.replace(/[$,]/g, '') : el));
    let minAmount = Math.min(...dataPoints);
    let maxAmount = Math.max(...dataPoints) || 10000;
    let diff = Math.abs(maxAmount - minAmount);
    if (minAmount == maxAmount) {
        maxAmount = maxAmount * 2;
        minAmount = 0;
    } else {
        minAmount = Math.floor(minAmount - (diff / 2) );
        maxAmount = Math.ceil(maxAmount + (diff / 2));
    }

    // Get Y dimensions from the text elements
    const textElements = this.querySelectorAll("#cePlotArea0_Axis_PrimaryValue0 g.custom-data g text");
    const numGridlines = textElements.length; // Number of gridlines and labels
    const yValues = Array.from(textElements).map(text => {
        const transform = text.getAttribute("transform");
        const translate = transform.match(/matrix\(([\-\d\.\s]+)\)/);
        return translate ? parseFloat(translate[1].split(" ")[5]) : null; // Get the Y coordinate
    }).filter(y => y !== null);

    const minY = Math.min(...yValues);
    const maxY = Math.max(...yValues);
    updateAxisLabels.call(this, minAmount, maxAmount, numGridlines, { minY, maxY });
    const chartDimensions = { minValue: minAmount, maxValue: maxAmount, ...getChartDimensions.call(this) };
    updateGridlines.call(this, numGridlines, chartDimensions);
    updateDataPoints.call(this, dataPoints, axisLabels, chartDimensions);
    //updateLegends.call(this, axisLabels, minAmount, maxAmount, numGridlines, chartDimensions);
}

function updateGridlines(numLines, chartDimensions) {
    const gridlineArea = this.querySelector("#ceROOT_ELEMENT-1 path");

    // Get chart dimensions
    if (!chartDimensions) {
        console.error("Failed to get chart dimensions");
        return;
    }

    const { xStart, xEnd, yStart, yEnd } = chartDimensions;

    // Default numLines to current gridlines if not provided
    if (!numLines) {
        const currentLines = gridlineArea ? gridlineArea.getAttribute('d').match(/L[\d.]+,[\d.]+/g) : [];
        numLines = currentLines.length || 5; // Default to 5 if no lines are found
    }

    // Calculate the spacing between grid lines
    const yStep = (yEnd - yStart) / (numLines - 1);

    // Create new grid lines based on the number of lines and chart dimensions
    let newPathData = '';
    for (let i = 0; i < numLines; i++) {
        const y = yStart + i * yStep;
        newPathData += `M${xStart},${y} L${xEnd},${y} `;
    }

    // Update the path's 'd' attribute with the new gridlines
    const gridlinePath = this.querySelector("#cePlotArea0_Axis_PrimaryValue0_Gridlines_MajorGridlines0 path");
    if (gridlinePath) {
        gridlinePath.setAttribute('d', newPathData.trim());
    } else {
        console.error("Gridline path not found");
    }
}

function getChartDimensions() {
    const gridlineArea = this.querySelector("#ceROOT_ELEMENT-1 path");
    const pathData = gridlineArea.getAttribute("d");

    const coordinates = pathData.match(/M(\d+),(\d+) L(\d+),(\d+) L(\d+),(\d+) L(\d+),(\d+) Z/);

    if (coordinates) {
        const xStart = parseFloat(coordinates[1]);
        const yStart = parseFloat(coordinates[2]);
        const xEnd = parseFloat(coordinates[3]);
        const yEnd = parseFloat(coordinates[6]); // Getting yEnd from the last L in the path

        return {
            xStart,
            yStart,
            xEnd,
            yEnd
        };
    }
    throw new Error("Invalid path data");
}

function extractSeriesData() {
    const seriesGroup = this.querySelector("#cePlotArea0_Series0");
    const paths = seriesGroup.querySelectorAll("path");

    const seriesData = [];

    paths.forEach(path => {
        const pathData = path.getAttribute("d");
        if (pathData) {
            const coordinates = extractCoordinatesFromPath(pathData);
            seriesData.push(coordinates);
        }
    });

    return seriesData;
}

function extractCoordinatesFromPath(pathData) {
    const coords = [];

    const commandRegex = /([MLC])([^MLC]+)/g;
    let match;

    while ((match = commandRegex.exec(pathData)) !== null) {
        const command = match[1]; // Extracts 'M', 'L', 'C'
        const points = match[2].trim().split(/[\s,]+/); // Extracts coordinate pairs

        if (command === 'M' || command === 'L') {
            // Move or Line command - take pairs of coordinates
            const x = parseFloat(points[0]);
            const y = parseFloat(points[1]);
            coords.push({ x, y });
        } else if (command === 'C') {
            // Cubic Bezier curve command - multiple sets of coordinates
            for (let i = 0; i < points.length; i += 2) {
                const x = parseFloat(points[i]);
                const y = parseFloat(points[i + 1]);
                coords.push({ x, y });
            }
        }
    }

    return coords;
}

function mapValueToY(value, minValue, maxValue, yStart, yEnd) { // Utility function to map data value to y-coordinate
    return yEnd - ((value - minValue) / (maxValue - minValue || 1)) * (yEnd - yStart);
}
