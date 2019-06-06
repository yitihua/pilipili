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

//    menu list
//获取新闻类型列表
var types = document.querySelectorAll(".type li");
//新闻列表选中nav被选中底部边框标红
for(let i = 0,l = types.length;i<l;i++){
    types[i].onclick = function(){
        let count = l-1
        while(count>=0){
            if(types[count].classList.contains("bottom-red")){
                types[count].classList.remove("bottom-red")
            }

            count--
        }
        types[i].classList.add("bottom-red")
        console.log(i)
    }
}

// function GetUrlRelativePath()
// {
//     var url = document.location.toString();
//     var arrUrl = url.split("//");

//     var start = arrUrl[1].indexOf("/");
//     var relUrl = arrUrl[1].substring(start);//stop省略，截取从start开始到结尾的所有字符

//     if(relUrl.indexOf("?") != -1){
//         relUrl = relUrl.split("?")[0];
//     }
//     return relUrl;
// }
// const ctx = GetUrlRelativePath();
// function check() {
//     let xhr =new XMLHttpRequest()
//     let user = document.getElementById("username").value
//     let password=document.getElementById("password").value
//     xhr.open("post", `${ctx}/login`, true)
//     xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
//     xhr.send("username="+user+"&password="+password)
//     xhr.onreadystatechange = function(){
//         if(xhr.readyState === 4){
//             if(xhr.status>=200 && xhr.status<300 || xhr.status===304){
//                 vm.seeme=false
//             }else {
//                 alert("用户名或密码错误")
//                 return false
//             }
//         }
//     }
// }