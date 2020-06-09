document.addEventListener('turbolinks:load', function() {
  var password = document.querySelector('.password')
  var password_confirmation = document.querySelector('.password_confirmation')

  password.addEventListener('input', password_validate)
  password_confirmation.addEventListener('input', password_validate)
})

function password_validate() {
  var password = document.querySelector('.password')
  var password_confirmation = document.querySelector('.password_confirmation')

  if (password_confirmation.value != "") {
    if (password.value == password_confirmation.value) {
      document.querySelector('.octicon-check').classList.remove('hide')
      document.querySelector('.octicon-issue-opened').classList.add('hide')
    }
    else {
      document.querySelector('.octicon-issue-opened').classList.remove('hide')
      document.querySelector('.octicon-check').classList.add('hide')
    }
  }
}

