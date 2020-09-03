var Chart = require('chart.js');

class DashboardChart {
    constructor(options, chartType = "historical") {
        this.chartDomElement = document.getElementById('dashboardChart'),
        this.previousMoods = JSON.parse(this.chartDomElement.dataset.moods).map(mood => JSON.parse(mood)),
        this.averageMoods = JSON.parse(this.chartDomElement.dataset.averages).map(dim => JSON.parse(dim)),
        this.ctx = this.chartDomElement.getContext('2d'),
        this.options = options,
        this.chartType = chartType
    }

    render() {
        if (this.chartType == "historical") {
            var chart = new Chart(this.ctx, {
                type: 'line',
                options: this.options, // options is defined in application.js when you create a new instance of the chart
                data: {
                    // labels: ['Sadness', 'Happiness', 'Anger', 'Calmness', 'Low Energy', 'High Energy'],
                    labels: this.previousMoods.map(mood => mood.created_at),
                    datasets: [{
                        label: 'Sad | Happy',
                        data: this.previousMoods.map(mood => mood.sad_happy), // select one dimension of mood to plot on graph
                        backgroundColor: 'rgba(255, 99, 132, 0.1)',
                        borderColor: 'rgba(255, 99, 132, 1)',
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
        }
        if (this.chartType == "average") {
            var chart = new Chart(this.ctx, {
                type: 'polarArea',
                options: this.options, // options is defined in application.js when you create a new instance of the chart
                data: {
                    labels: ['Happiness', 'Sadness', 'Calmness', 'Angriness', 'Low Energy', 'High Energy', 'Anxiousness', 'Socialness'],
                    datasets: [{
                        label: 'Sad | Happy',
                        data: this.averageMoods.flatMap(dim => Object.values(dim)), // select one dimension of mood to plot on graph
                        backgroundColor: [
                            'rgba(127, 255, 212, 0.1)',
                            'rgba(138, 43, 226, 0.1)',
                            'rgba(128, 128, 128, 0.1)',
                            'rgba(220, 20, 60, 0.1)',
                            'rgba(143, 188, 143, 0.1)',
                            'rgba(255, 140, 0, 0.1)',
                            'rgba(233, 150, 122, 0.1)',
                            'rgba(0, 255, 255, 0.1)'
                        ],
                        borderColor: [
                            'rgba(42, 169, 149, 1)',
                            'rgba(138, 43, 226, 1)',
                            'rgba(128, 128, 128, 1)',
                            'rgba(220, 20, 60, 1)',
                            'rgba(143, 188, 143, 1)',
                            'rgba(255, 140, 0, 1)',
                            'rgba(233, 150, 122, 1)',
                            'rgba(42, 142, 157, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
            });
        }
    }
}

export { DashboardChart };
