var $ = function(x,y){
    if(y===0){
        return document.querySelector.bind(document)(x);
    }else{
        return document.querySelectorAll.bind(document)(x);
    }
}
var times = $(".time",1)
function cut(time,demand) {
    time.toString()
    console.log(time)
    let year=time.slice(0,4)
    let month=time.slice(5,7)
    let date = time.slice(8,10)
    let hour = time.slice(11,13)
    let minute = time.slice(14,16)
    let second=time.slice(17,19)
    switch (demand) {
        case "year":return Number(year);break;
        case "month":return Number(month);break;
        case "date":return Number(date);break;
        case "hour":return Number(hour);break;
        case "minute":return Number(minute);break;
        default:return Number(second);
    }
}
for(let i=0;i<times.length;i++){
    let currentTime=""
    // let newsTime=times[i].innerText
    let newsTime=times[i].innerText
    let myDate=new Date()
    let newsYear=cut(newsTime,"year")
    let myYear=myDate.getFullYear()
    let newsMonth=cut(newsTime,"month")
    let myMonth=myDate.getMonth()
    let newsDate=cut(newsTime,"date")
    let myDay=myDate.getDate()
    let newsHour=cut(newsTime,"hour")
    let myHour=myDate.getHours()
    let newsMinute=cut(newsTime,"minute")
    let myMinute=myDate.getMinutes()
    if(newsYear<myYear){
        currentTime=newsYear+"年"+newsMonth+"月"
    }else if(newsMonth<myMonth){
        let temp=myMonth-newsMonth
        currentTime=temp+"月前"
    }else if(newsDate<myDay){
        let temp=myDay-newsDate
        currentTime=temp+"天前"
    }else if(newsHour<myHour){
        let temp=myHour-newsHour
        currentTime=temp+"小时前"
    }else if(newsMinute<myMinute){
        let temp=myMinute-newsMinute
        currentTime=temp+"分钟前"
    }else {
        currentTime="几秒前"
    }
    times[i].innerText=currentTime
}

