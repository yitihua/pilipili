
var hotnews={
    0:{
        0: "&#xe609" ,
        1:"国产动画电影《哪吒之魔童降世》定档8月16日"
    },
    1:{
        0: "&#xe60b" ,
        1:"《FGO》、《猎人任务第5弹》开播，首日放送道具是\“凶骨\” "
    },
    2:{
        0: "&#xe610" ,
        1:"国产动画电影《哪吒之魔童降世》定档8月16日"
    },
    3:{
        0: "&#xe60d" ,
        1:"国产动画电影《哪吒之魔童降世》定档8月16日"
    },
    4:{
        0: "&#xe60c" ,
        1:"国产动画电影《哪吒之魔童降世》定档8月16日"
    }
}
let list = $(".hot-news-list",0)
for(i in hotnews){
    let newli = document.createElement("li")
    newli.setAttribute("class","hot-news-nav")
    let newNum = document.createElement("span")
    newNum.setAttribute("class","iconfont")
    newNum.innerHTML=hotnews[i][0]
    let newTitle = document.createElement("span")
    newTitle.innerText=hotnews[i][1]
    newli.addPara(newNum)
    newli.addPara(newTitle)
}
