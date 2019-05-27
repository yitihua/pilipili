//封装get方法
var $ = function(x,y){
	if(y===0){
		return document.querySelector.bind(document)(x);
	}else{
		return document.querySelectorAll.bind(document)(x);
	}
}
//封装增加子节点方法
var addPara = document.createElement.bind(document);
var opts = $("#carousel-opts",0)
var panel  = $("#carousel-panel",0)
var text = $(".carousel-text",0)
var photoes = {
    0:{0:"url(static/img/photo0.jpg)",1:"《神烦警探》翻拍"},
    1:{0:"url(static/img/photo1.jpg)",1:"游改番《多罗罗》广受好评"},
    2:{0:"url(static/img/photo2.jpg)",1:"《权利的游戏》第八季烂尾"},
}
var j = 0;//总图片数
for(i in photoes){
    var newOpt = addPara("li")
    newOpt.setAttribute("class","opt")
    newOpt.setAttribute("id",`opt${i}`)
    opts.appendChild(newOpt)
    var newImg = addPara("div")
    newImg.setAttribute("class","photo")
    newImg.style.backgroundImage = photoes[i][0]
    panel.appendChild(newImg)
    j++
}
document.getElementById("opt1").classList.add("opt-active")
panel.style.width = j*690+"px"
var i = 0
var optDone = document.getElementsByClassName("opt")
for(i;i<j;i++){
    optDone[i].onclick = (function(k){
        return function(){
            panel.style.left = -k*690+"px"
        }
    })(i);
}
var flag = 0;
var allOpt = document.getElementsByClassName("opt")
function translatePhoto(){
    let current = flag%3
    let site = -(current)*690+"px"
    panel.style.left = site   
    for(let i = 0;i<allOpt.length;i++){
        if(allOpt[i].classList.contains("opt-active")){
            allOpt[i].classList.remove("opt-active")
        }
    }
    
    allOpt[current].classList.add("opt-active")
    text.innerHTML = photoes[current][1]
    flag++
}
setInterval("translatePhoto()",2500)
