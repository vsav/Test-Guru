document.addEventListener('turbolinks:load', function() {
    passwordConfirmationField = document.getElementById('user_password_confirmation');
        if (passwordConfirmationField) { addEventListener('input', checkPassword) }
});

function checkPassword() {
    var password = document.getElementById('user_password');
    var passwordConfirmation = document.getElementById('user_password_confirmation');

    if (passwordConfirmation.value === '') {
        document.querySelector('.octicon-circle-slash').classList.add('hide');
    } else if (password.value === passwordConfirmation.value) {
        document.querySelector('.octicon-check').classList.remove('hide');
        document.querySelector('.octicon-circle-slash').classList.add('hide');
    } else {
        document.querySelector('.octicon-circle-slash').classList.remove('hide');
        document.querySelector('.octicon-check').classList.add('hide');
    }
}

