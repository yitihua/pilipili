function GetUrlRelativePath()
{
    var url = document.location.toString();
    var arrUrl = url.split("//");

    var start = arrUrl[1].indexOf("/");
    var relUrl = arrUrl[1].substring(start);//stop省略，截取从start开始到结尾的所有字符

    if(relUrl.indexOf("?") != -1){
        relUrl = relUrl.split("?")[0];
    }
    return relUrl;
}
const ctx = GetUrlRelativePath();
var data ={
    name: "buza",
    age: "3",
}
//用一个josn形式的data变量储存你要传输的数据
function join(data){
    let str = ""
    for(let i in data){
    str+= i+"="+data[i]+"&"
     }
    return str.replace(/&$/, "")
}
//这个方法将数据转化为para1=val1&para2=val2....的形式
function ajax1(){
    let xhr =new XMLHttpRequest()
//post方法如下
//    xhr.open("post", "http://localhost:8080?", true)
//    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
//    xhr.send(join(data))
//get方法如下
    xhr.open("get","http://localhost:8080?"+join(data),true)
    xhr.send()
    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4){
            if(xhr.status>=200 && xhr.status<300 || xhr.status===304){
                document.body.innerHTML+=xhr.responseText
            }
        }            
    }
}