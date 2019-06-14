var $ = function(x,y){
    if(y===0){
        return document.querySelector.bind(document)(x);
    }else{
        return document.querySelectorAll.bind(document)(x);
    }
}
var field = $('.upload-field',0);
var fileBtn = $("#input-file",0)
var fileTip= $("#upload-tip",0)
if(document.getElementById("avatar-submit")){
    var fileSubmit = $("avatar-submit",0)
}else {
    var fileSubmit =$("btn1",0)
}
var img = document.getElementById("show-img")
field .ondragover = function (e) {
    e.preventDefault();
    e.stopPropagation();
    return false;
};
field .ondrop = function (e) {
    // 1.file对象
    console.log(e.dataTransfer.files);
    var file = e.dataTransfer.files.item(0);
    //判断文件是否为图片
    if(file[0].type=="image/jpeg"||file[0].type=="image/jpg"||file[0].type=="image/png"){
        fileBtn.files[0]=file
        // 创建文件读取对象
        let f = new FileReader();
        // 读取图片 格式base64
        f.readAsDataURL(file);
        f.onload = function(e) {
            // 格式base64
            img.src = this.result;
        };
        if(fileSubmit.hasOwnProperty("disabled")){
            fileSubmit.removeAttribute("disabled")
        }
    }else {
        fileTip.innerText="请提交格式为png、jpg或jpeg的图片"
        fileSubmit.setAttribute("disabled","true")
    }
    e.preventDefault();
    e.stopPropagation();
    return false;
}
function preview() {
    if(fileBtn.files&&fileBtn.files[0]){
        if(fileBtn.files[0].type=="image/jpeg"||fileBtn.files[0].type=="image/jpg"||fileBtn.files[0].type=="image/png"){
            let f=new FileReader();
            f.readAsDataURL(fileBtn.files[0])
            f.onload=function () {
                img.src = this.result
            }
            if(fileSubmit.hasOwnProperty("disabled")){
                fileSubmit.removeAttribute("disabled")
            }
        }else {
            fileTip.innerText="请提交格式为png、jpg或jpeg的图片"
            fileSubmit.setAttribute("disabled","true")
        }

    }
}