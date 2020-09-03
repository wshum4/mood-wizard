// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initMapbox } from '../plugins/init_mapbox';
import { DashboardChart } from "../plugins/init_chart";
import { triggerConfirmation, triggerReminder, triggerRating, ratingRedirect } from '../plugins/notifications';
import { tabBar } from '../plugins/tab_bar';
import { ratingStars } from '../plugins/rating_stars';
import { setStyles } from '../plugins/style_inject_rating';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // only load chart on the dashboard page
  if (window.location.pathname === '/') {
    // pass options into the chart to customize the style. Check docs at: https://www.chartjs.org/docs/latest/charts/polar.html

    const lineButton = document.getElementById('line-btn');
    const polarButton = document.getElementById('polar-btn');

    const lineChart = new DashboardChart({
      scales: {
        xAxes: [{
          type: 'time',
          time: {
            minUnit: 'day'
          }
        }],
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }, "historical");

    const polarChart = new DashboardChart({
      scale: {
        ticks: {
          beginAtZero: true,
          max: 10
        }
      }
    }, "average");

    lineButton.addEventListener('click', () => {
      lineChart.render();
    });
    polarButton.addEventListener('click', () => {
      polarChart.render();
    });

    lineChart.render();
  }

  // if (document.querySelector('#book-now')) {
  //   document.querySelector('#book-now').addEventListener('click', () => {
  //     triggerNotifications();
  //   });
  // }

  // initSelect2();
  const mapElement = document.getElementById('map');
  if (mapElement) {
    initMapbox(mapElement);
  }

  tabBar();
  if (document.getElementById('booking-confirmation')) {
    triggerConfirmation();
  }
  triggerReminder();
  triggerRating();
  ratingRedirect();
  ratingStars();
  setStyles();
});

