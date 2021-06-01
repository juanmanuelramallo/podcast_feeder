import '../stylesheets/landing.scss';

require("turbolinks").start()

document.addEventListener("turbolinks:load", function() {
  let audioTriggerers = document.querySelectorAll('[data-audio-src]');

  audioTriggerers.forEach(audioTriggerer => {
    audioTriggerer.addEventListener('click', (e) => {
      e.target.classList.add('hidden');

      let audioElem = document.createElement('audio');
      audioElem.controls = true;
      audioElem.src = e.target.dataset.audioSrc;
      audioElem.classList.add('w-full');

      e.target.insertAdjacentElement('afterend', audioElem);
    });
  });
})


