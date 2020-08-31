var Chart = require('chart.js');

class DashboardChart {
    constructor(options) {
        this.chartDomElement = document.getElementById('dashboardChart'),
        this.previousMoods = JSON.parse(this.chartDomElement.dataset.moods).map(mood => JSON.parse(mood)),
        this.ctx = this.chartDomElement.getContext('2d'),
        this.options = options
    }

    render() {
        var chart = new Chart(this.ctx, {
            type: 'polarArea',
            data: {
                labels: ['Sadness', 'Happiness', 'Anger', 'Calmness', 'Low Energy', 'High Energy'],
                datasets: [{
                    label: 'Moods',
                    data: this.previousMoods.map(mood => mood.sad_happy),
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
        console.table(chart);
    }
}

export { DashboardChart };