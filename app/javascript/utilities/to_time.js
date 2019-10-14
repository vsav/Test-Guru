function intToTime(int) {
    hours = Math.floor(int / 3600);
    minutes = Math.floor((int - (hours * 3600)) / 60);
    seconds = int - (hours * 3600) - (minutes * 60);
    hours = hours < 10 ? '0' + hours : hours;
    minutes = minutes < 10 ? '0' + minutes : minutes;
    seconds = seconds < 10 ? '0' + seconds : seconds;

    return time = hours + ':' + minutes + ":" + seconds;
}
