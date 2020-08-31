var Chart = require('chart.js');

class DashboardChart {
    constructor(options, type = "lineChart") {
        this.chartDomElement = document.getElementById('dashboardChart'),
        this.previousMoods = JSON.parse(this.chartDomElement.dataset.moods).map(mood => JSON.parse(mood)),
        this.ctx = this.chartDomElement.getContext('2d'),
        this.options = options,
        this.type = type
    }

    render() {
        var chart = new Chart(this.ctx, {
            type: 'line',
            options: this.options, // options is defined in application.js when you create a new instance of the chart
            data: {
                // labels: ['Sadness', 'Happiness', 'Anger', 'Calmness', 'Low Energy', 'High Energy'],
                labels: this.previousMoods.map(mood => mood.manual_created_at),
                datasets: [{
                    label: 'Sad | Happy',
                    data: this.previousMoods.map(mood => mood.sad_happy), // select one dimension of mood to plot on graph
                    backgroundColor: 'rgba(255, 99, 132, 0.1)',
                    //     'rgba(153, 102, 255, 0.1)',
                    //     'rgba(255, 159, 64, 0.1)'
                    borderColor: 'rgba(255, 99, 132, 1)',
                    //     'rgba(75, 192, 192, 1)',
                    //     'rgba(153, 102, 255, 1)',
                    //     'rgba(255, 159, 64, 1)'
                    borderWidth: 1
                },
                {
                    label: 'Calm | Angry',
                    data: this.previousMoods.map(mood => mood.angry_calm),
                    backgroundColor: 'rgba(54, 162, 235, 0.1)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                },
                {
                    label: 'Low | High Energy',
                    data: this.previousMoods.map(mood => mood.lowenergy_highenergy),
                    backgroundColor: 'rgba(255, 206, 86, 0.1)',
                    borderColor: 'rgba(255, 206, 86, 1)',
                    borderWidth: 1
                },
                {
                    label: 'Anxious | Social',
                    data: this.previousMoods.map(mood => mood.anxious_social),
                    backgroundColor: 'rgba(75, 192, 192, 0.1)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }
                ]
            },
        });
        console.table(chart);
    }
}

export { DashboardChart };