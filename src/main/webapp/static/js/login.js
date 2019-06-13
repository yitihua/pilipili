var $ = function(x,y){
    if(y===0){
        return document.querySelector.bind(document)(x);
    }else{
        return document.querySelectorAll.bind(document)(x);
    }
}
//封装增加子节点方法
var addPara = document.createElement.bind(document);
let oheight = window.innerHeight||document.body.clientHeight;
let box = document.getElementById("login");
box.style.height = oheight+"px";
//topnav
var vm = new Vue({
    el:'#topnav',
    data:{
        registed:false,
        name:"",
        password:"",
        str:"",
        nametip:"请输入2到16位字母，数字或下划线",
        pwdtip:"以字母开头，长度在6-18之间，只能包含字符、数字和下划线",
        actived:true,
        seeme:false,
        namewrong:true,
        pwdwrong:true,
    },
    watch:{
        name:function(){
            let subBtn = document.getElementById("submit-btn")
            let reg=/^[\u4E00-\u9FA5A-Za-z0-9_]{2,16}$/;
            if(!reg.test(this.name) ){
                this.nametip= "请输入2到16位中文字符、字母、数字或下划线";
                this.namewrong = true
                if(subBtn.disabled=false){
                    subBtn.setAttribute("disabled","true")
                }
            }
            //用户名正则，2到16位（字母，数字，下划线）
            else{
                this.nametip= `available`
                this.namewrong = false
                if(subBtn.disabled = true){
                    subBtn.removeAttribute("disabled")
                }
            }
        },
        password:function(){
            let subBtn = document.getElementById("submit-btn")

            let reg = /^[a-zA-Z]\w{5,17}$/;
            if(!reg.test(this.password)){
                this.pwdtip= "长度在6-18之间，只能包含字符、数字和下划线";
                this.pwdwrong = true
                if(subBtn.disabled=false){
                    subBtn.setAttribute("disabled","true")
                }
            }
            else{
                this.pwdtip= `available`
                this.pwdwrong = false
                if(subBtn.disabled = true){
                    subBtn.removeAttribute("disabled")
                }
            }
        },
    },
        methods:{
        goregister:function(){
            this.actived = false
            console.log(this.actived)
        },
        gologin:function(){
            this.actived = true
        },
        getH:function(){
            this.seeme = true;
        },
        closeForm:function(){
            this.seeme = false;
        },
        /*logOrRegist:function(){
            if(this.actived){
                // 登录的跳转
                console.log("a")
                window.location.href=`${ctx}/userAuth/login`
                console.log("aa")
            }else{
                // 注册的跳转
                window.location.href=`${ctx}/register`
            }
        }*/
    }
})