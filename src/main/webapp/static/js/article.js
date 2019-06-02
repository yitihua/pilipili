//二级评论处理
//获取一级评论作者，与一级评论的id
let replyBtn1 = document.getElementsByClassName("reply-btn-1")
let replyBtn2 = document.getElementsByClassName("reply-btn-2")
//设置每块评论的高度
let nav = document.getElementsByClassName("comment-nav")
for(let i = 0;i<nav.length;i++){
    let child = nav[i].children[1];
    let h = child.offsetHeight
    nav[i].style.height=(h+10)+"px"
}
for(let i = 0;i<replyBtn2.length;i++){
    replyBtn2[i].onclick=function (){
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
        let commentNav = document.getElementById(`comment-nav-${commentLevel}`)
        //更改评论栏高度
        let olderH = commentNav.offsetHeight;
        commentNav.style.height = (olderH+45)+"px"
        //显示回复表单
        for(let j = 0;j<replyForms.length;j++){
            if(!replyForms[j].classList.contains("hide"))replyForms[j].classList.add("hide")
        }
        replyForm.classList.remove("hide")
        //回复表单下的textarea
        let replyText = document.getElementById(`reply-text-${commentLevel}`)
        replyText.onfocus=function(){
            replyForm.style.height = "120px"
            let olderH = commentNav.offsetHeight;
            commentNav.style.height = (olderH+80)+"px"
        }
        replyText.onblur=function(){
            replyForm.style.height = "40px"
            let olderH = commentNav.offsetHeight;
            commentNav.style.height = (olderH-80)+"px"
        }
        //设置textarea的默认输出“回复 某某”
        replyText.setAttribute("placeholder",`回复 ${commentAuthor}`)
        let sendId = document.createElement("input")
        sendId.setAttribute("type","hidden")
        sendId.setAttribute("name","fatherCommentId")
        sendId.setAttribute("value",`${commentId}`)
        replyArea.appendChild(sendId)
    }
}
for(let i = 0;i<replyBtn1.length;i++){
    replyBtn1[i].onclick=function (){
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
        let commentNav = document.getElementById(`comment-nav-${commentLevel}`)
        //更改评论栏高度
        let olderH = commentNav.offsetHeight;
        commentNav.style.height = (olderH+45)+"px"
        //显示回复表单
        for(let j = 0;j<replyForms.length;j++){
            if(!replyForms[j].classList.contains("hide"))replyForms[j].classList.add("hide")
        }
        replyForm.classList.remove("hide")
        //回复表单下的textarea
        let replyText = document.getElementById(`reply-text-${commentLevel}`)
        replyText.onfocus=function(){
            replyForm.style.height = "120px"
            let olderH = commentNav.offsetHeight;
            commentNav.style.height = (olderH+80)+"px"
        }
        replyText.onblur=function(){
            replyForm.style.height = "40px"
            let olderH = commentNav.offsetHeight;
            commentNav.style.height = (olderH-80)+"px"
        }
        //设置textarea的默认输出“回复 某某”
        replyText.setAttribute("placeholder",`回复 ${commentAuthor}`)


    }
}

