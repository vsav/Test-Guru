document.addEventListener('turbolinks:load', function() {
    var timer = document.querySelector('.timer');
    var testTimer, hours, minutes, seconds;
    var form = document.querySelector('.test_passage');

    if (timer && timer.dataset.testTimer > 0) {

        testTimer = timer.dataset.testTimer;

        var timeLeft = setInterval(function () {
 //           intToTime(testTimer);
            testTimer--;
            hours = Math.floor(testTimer / 3600);
            minutes = Math.floor((testTimer - (hours * 3600)) / 60);
            seconds = testTimer - (hours * 3600) - (minutes * 60);
            hours = hours < 10 ? '0' + hours : hours;
            minutes = minutes < 10 ? '0' + minutes : minutes;
            seconds = seconds < 10 ? '0' + seconds : seconds;

            timer.innerHTML = hours + ':' + minutes + ":" + seconds;

            if (testTimer <= 0) {
                clearInterval(timeLeft);
                form.submit();
            }
        }, 1000);

    }
});
