// simple form wont accept custom classes so its hard to style with CSS files.
// this Js file will use query selectors on the simple form classes to manually inject css styles.
// it is a temporary workaround


const setStyles = () => {
  // fix styling issues on new review form
  if (window.location.pathname.match(/ratings\/new/)) {
    const textArea = document.querySelector('.text').children[1];
    console.log(textArea);
    textArea.setAttribute('style', 'width: 356.86px; height: 113.63px; left: 34px; top: 426px; border-radius: 20px 60px 20px 60px;');
  }
}

export { setStyles };
