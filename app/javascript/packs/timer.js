document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer')

  if (timer) {
    var timeLeft = timer.dataset.time

    setInterval(function() {
      if (timeLeft > 0) {
        timeLeft -= 1
      } else {
        alert('Time is over!')
        document.querySelector('form').submit()
      }

      resultTime = parseInt(timeLeft / 60) + ':' + timeLeft % 60
      timer.innerHTML = resultTime
    }, 1000)
  }
})
