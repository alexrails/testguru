document.addEventListener('turbolinks:load', function () {
  var progressBar = document.querySelector('.progress-bar')
  if(progressBar) setProgress(progressBar)
})

function setProgress(progressBar) {
  var currentNumber = progressBar.dataset.currentNumber
  var totalNumber = progressBar.dataset.totalNumber

  var percent = (((currentNumber-1) * 100) / totalNumber) + '%'

  progressBar.style.width = percent
  progressBar.textContent = percent
}
