document.addEventListener('turbolinks:load', function() {
    document.getElementById('user_password_confirmation').addEventListener('input', checkPassword);
});

function checkPassword() {
    let password = document.getElementById('user_password');
    let passwordConfirmation = document.getElementById('user_password_confirmation');

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
