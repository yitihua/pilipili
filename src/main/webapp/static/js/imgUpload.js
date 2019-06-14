var field = document.querySelector('.upload-field');
var fileBtn = document.getElementById("input-file")
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
    fileBtn.files[0]=file
    console.log(fileBtn.files[0])
    // 创建文件读取对象
    let f = new FileReader();
    // 读取图片 格式base64
    f.readAsDataURL(file);
    f.onload = function(e) {
        // 格式base64
        img.src = this.result;
    };
    e.preventDefault();
    e.stopPropagation();
    return false;
}
function preview() {
    if(fileBtn.files&&fileBtn.files[0]){
        let f=new FileReader();
        f.readAsDataURL(fileBtn.files[0])
        f.onload=function () {
            img.src = this.result
        }
    }
}