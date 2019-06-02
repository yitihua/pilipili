//二级评论处理
//获取一级评论作者，与一级评论的id
let replyBtn = document.getElementsByClassName("reply-btn")
for(let i = 0;i<replyBtn.length;i++){
    replyBtn[i].onclick=function (){
        //通过“回复”按钮获取被评论的评论的id以及该评论的作者,以及该层评论的层数
        let commentId = this.getAttribute("data-comment-id")
        let commentAuthor = this.getAttribute("data-comment-author")
        let commentLevel = this.getAttribute("data-comment-level")
        //    获取该一级评论下的回复框和回复框中的输入框
        //    当前回复表单
        let replyArea = document.getElementById(`reply-area-${commentLevel}`)
        //所有回复表单
        let replyForms = document.getElementsByClassName("reply-form")
        let replyForm = document.getElementById(`reply-form-${commentLevel}`)
        //显示回复表单
        for(let j = 0;j<replyForms.length;j++){
            if(!replyForms[j].classList.contains("hide"))replyForms[j].classList.add("hide")
        }
        replyForm.classList.remove("hide")
        //回复表单下的textarea
        let replyText = document.getElementById(`reply-text-${commentLevel}`)
        replyText.onfocus=function(){
            replyForm.style.height = "120px"
        }
        replyForm.onblur=function(){
            replyForm.style.height = "40px"
        }
        //设置textarea的默认输出“回复 某某”
        replyText.setAttribute("placeholder",`回复 ${commentAuthor}`)
        let sendId = document.createElement("input")
        sendId.setAttribute("type","hidden")
        sendId.setAttribute("name","fatherCommentId")
        sendId.setAttribute("value",`${commentId}`)
    }
}
let nav = document.getElementsByClassName("comment-nav")
for(let i = 0;i<nav.length;i++){
    let child = nav[i].children[1];
    let h = child.offsetHeight
    // console.log(child)
    // console.log(h)
    nav[i].style.height=(h+10)+"px"

}