var $ = function(x,y){
    if(y===0){
        return document.querySelector.bind(document)(x);
    }else{
        return document.querySelectorAll.bind(document)(x);
    }
}
//封装增加子节点方法
var addPara = document.createElement.bind(document);
var hotnews={
    0:{
        0: "&#xe609" ,
        1:"国产动画电影《哪吒之魔童降世》定档8月16日",
        2:`${ctx}/article/view/1`
    },
    1:{
        0: "&#xe60b" ,
        1:"《FGO》、《猎人任务第5弹》开播，首日放送道具是\“凶骨\” ",
        2:`${ctx}/article/view/1`
    },
    2:{
        0: "&#xe610" ,
        1:"广告位招租",
        2:`${ctx}/article/view/1`
    },
    3:{
        0: "&#xe60d" ,
        1:"广告位招租",
        2:`${ctx}/article/view/1`
    },
    4:{
        0: "&#xe60c" ,
        1:"广告位招租",
        2:`${ctx}/article/view/1`
    }
}
let list = $(".hot-news-list",0)
for(i in hotnews){
    let newli = addPara("li")
    newli.setAttribute("class","hot-news-nav")
    let newNum = addPara("span")
    newNum.setAttribute("class","iconfont")
    newNum.innerHTML=hotnews[i][0]
    let newTitle = addPara("span")
    newTitle.innerText=hotnews[i][1]
    newli.appendChild(newNum)
    newli.appendChild(newTitle)
    list.appendChild(newli)
    newli.onclick=function(){
        window.location.href=hotnews[i][2]
    }
    console.log(i)
}
