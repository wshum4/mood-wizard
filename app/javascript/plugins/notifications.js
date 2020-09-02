const triggerConfirmation = () => {
  $('#booking-confirmation').modal('show');
};

// open reminder modal
const openReminderModal = () => {
  $('#booking-reminder').modal('show');
}

// listening to spotify card click
const triggerReminder = () => {
  const spotify = document.getElementById("medium-16");
  if (spotify) {
    spotify.addEventListener("click", (event) => {
      window.setTimeout(openReminderModal, 2*1000);
    });
  }
};

// opening rating modal
const openRatingModal = () => {
  $('#rating-reminder').modal('show');
}

// listening to reminder modal close modal btn
const triggerRating = () => {
  const ratingModal = document.getElementById("reminder-modal-close-btn");
  if (ratingModal) {
    ratingModal.addEventListener("click", (event) => {
      window.setTimeout(openRatingModal, 2*1000);
    });
  }
};

// listen to click reminder modal 'rate now'/close modal btn
// and redirect to activity rating page
const ratingRedirect = () => {
  const ratingModalBtn = document.getElementById("rating-modal-close-btn");
  if (ratingModalBtn) {
    ratingModalBtn.addEventListener("click", (event) => {
      const url = window.location.href;
      const path = window.location.pathname;
      const query = window.location.search;
      const baseUrl = url.replace(path, "").replace(query, "")
      const queryArray = query.split("=")
      const actionId = queryArray[queryArray.length - 1]
      window.location.assign(`${baseUrl}/activities/${actionId}/ratings/new`)
    });
  }
};

export { triggerConfirmation, triggerReminder, triggerRating, ratingRedirect };

