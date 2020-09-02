const updateBackground = (val) => {
  if (val > 20) {
    document.getElementById('positive').style.opacity = (((val - 20) * 2.50) / 40);
    document.getElementById('negative').style.opacity = 0;
  } else {
    document.getElementById('positive').style.opacity = 0;
    document.getElementById('negative').style.opacity = (((20 - val) * 2.50) / 40);
  }
}

const bindRangeElements = () => {
  const sh_range = document.getElementById('mood_sad_happy');
  const ac_range = document.getElementById('mood_angry_calm');
  const hl_range = document.getElementById('mood_lowenergy_highenergy');  
  const as_range = document.getElementById('mood_anxious_social');

  sh_range.addEventListener('input', (e) => {
    const sum = parseInt(sh_range.value) + parseInt(ac_range.value) + parseInt(hl_range.value) + parseInt(as_range.value);
    updateBackground(sum);
  });
  ac_range.addEventListener('input', (e) => {
    const sum = parseInt(sh_range.value) + parseInt(ac_range.value) + parseInt(hl_range.value) + parseInt(as_range.value);
    updateBackground(sum);
  });
  hl_range.addEventListener('input', (e) => {
    const sum = parseInt(sh_range.value) + parseInt(ac_range.value) + parseInt(hl_range.value) + parseInt(as_range.value);
    updateBackground(sum);
  });
  as_range.addEventListener('input', (e) => {
    const sum = parseInt(sh_range.value) + parseInt(ac_range.value) + parseInt(hl_range.value) + parseInt(as_range.value)
    updateBackground(sum);
  });
}

export { bindRangeElements }