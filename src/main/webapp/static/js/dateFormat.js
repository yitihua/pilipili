// const dateFormat = function (date) {
//     //将类似于2019-06-02T17:19:26.842980400的时间日期格式转化为
//     //“几天前”、“几小时前”或“xx年xx月xx日”的形式
//     let day = date.slice(8,2)
//     let month = date.slice(5,2)
//     let year = date.slice(0,4)
//     let hour = date.slice(11,2)
//     let minute = date.slice(14,2)
//     let json = {
//         day:day,
//         month:month,
//         year:year,
//         hour:hour,
//         minute:minute,
//     }
//     var myDate = new Date()
// }
function getDateTimeStamp (dateStr) {
    return Date.parse(dateStr.replace(/-/gi,"/"));
}
function getDateDiff (dateStr) {
    var publishTime = getDateTimeStamp(dateStr)/1000,
        d_seconds,
        d_minutes,
        d_hours,
        d_days,
        timeNow = parseInt(new Date().getTime()/1000),
        d,

        date = new Date(publishTime*1000),
        Y = date.getFullYear(),
        M = date.getMonth() + 1,
        D = date.getDate(),
        H = date.getHours(),
        m = date.getMinutes(),
        s = date.getSeconds();
    //小于10的在前面补0
    if (M < 10) {
        M = '0' + M;
    }
    if (D < 10) {
        D = '0' + D;
    }
    if (H < 10) {
        H = '0' + H;
    }
    if (m < 10) {
        m = '0' + m;
    }
    if (s < 10) {
        s = '0' + s;
    }

    d = timeNow - publishTime;
    d_days = parseInt(d/86400);
    d_hours = parseInt(d/3600);
    d_minutes = parseInt(d/60);
    d_seconds = parseInt(d);

    if(d_days > 0 && d_days < 3){
        return d_days + '天前';
    }else if(d_days <= 0 && d_hours > 0){
        return d_hours + '小时前';
    }else if(d_hours <= 0 && d_minutes > 0){
        return d_minutes + '分钟前';
    }else if (d_seconds < 60) {
        if (d_seconds <= 0) {
            return '刚刚发表';
        }else {
            return d_seconds + '秒前';
        }
    }else if (d_days >= 3 && d_days < 30){
        return M + '-' + D + '&nbsp;' + H + ':' + m;
    }else if (d_days >= 30) {
        return Y + '-' + M + '-' + D + '&nbsp;' + H + ':' + m;
    }
}