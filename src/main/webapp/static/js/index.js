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
//      topnav
var vm = new Vue({
    el:'#topnav',
    data:{
        registed:false,
        name:"",
        password:"",
        str:"",
        nametip:"请输入4到16位字母，数字或下划线",
        pwdtip:"以字母开头，长度在6-18之间，只能包含字符、数字和下划线",
        actived:true,
        h:0,
        seeme:false,
        namewrong:true,
        pwdwrong:true
    },
    methods:{
        ntip:function(){
            let reg=/^[a-zA-Z0-9_]{4,16}$/;
            if(!reg.test(this.name) )this.nametip= "请输入4到16位字母，数字或下划线";
            //用户名正则，4到16位（字母，数字，下划线）
            else{
                this.nametip= `available`
                this.namewrong = false
            }
        },
        ptip:function(){
            let reg = /^[a-zA-Z]\w{5,17}$/;
            if(!reg.test(this.password)){this.pwdtip= "以字母开头，长度在6-18之间，只能包含字符、数字和下划线";}
            else{
                this.pwdtip= `available`
                this.pwdwrong = false
            }
        },
        goregister:function(){
            this.actived = false
            console.log(this.actived)
        },
        gologin:function(){
            this.actived = true

        },
        getH:function(){
            this.h = document.documentElement.clientHeight || document.body.clientHeight;
            let box = document.getElementById("login");
            console.log(this.h)
            box.style.height = this.h+"px";
            this.seeme = true;
        },
        closeForm:function(){
            this.seeme = false;
        },
        logOrRegist:function(){
            if(this.actived){
                // 登录的跳转
                window.location.href=`${ctx}/login`
            }else{
                // 注册的跳转
                window.location.href=`${ctx}/register`
            }
        }
    }
})
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