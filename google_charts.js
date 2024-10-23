google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawChart);
target.replaceChildren();
let shadowRoot = target.attachShadow({ mode: 'open' });

let chartContainer = document.createElement('div');
shadowRoot.appendChild(chartContainer);

function drawChart() {
    //add "https://www.gstatic.com/charts/loader.js", 
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Mes');
    data.addColumn('number', 'monto');

    data.addRows([
        [informe.single(`model/data/row/@mes`), 1000],
        [informe.single(`model/data/row/prev/@mes`), 1030]
    ]);

    var options = {
        legend: { position: 'bottom' },
        width: 600,//target.querySelector("svg").getAttribute("width"),
        height: 200//target.querySelector("svg").getAttribute("height")
    };

    var chart = new google.visualization.LineChart(chartContainer);

    chart.draw(data, options);
}