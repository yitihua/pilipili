//二级评论处理
//获取一级评论作者，与一级评论的id
let replyBtn1 = document.getElementsByClassName("reply-btn-1")
let replyBtn2 = document.getElementsByClassName("reply-btn-2")
var loginbtn = document.getElementById("loginbtn")
//设置每块评论的高度
let nav = document.getElementsByClassName("comment-nav")
for (let n = 0; n < nav.length; n++) {
    let child = nav[n].children[1];
    let h = child.offsetHeight
    nav[n].style.height = (h + 10) + "px"
}
//每层一级评论的状态记录
//levelCounter[0]记录了被展开的评论层数
//levelCounter[i]记录了第i层是否已闭合
//如果levelC[i]=1则未闭合
var levelCounter = {0: 0}
for (let i = 0; i < replyBtn1.length; i++) {
    levelCounter[i + 1] = 0
}
for (let i = 0; i < replyBtn1.length; i++) {
    replyBtn1[i].onclick = function () {
        if (!isloged) {
            loginbtn.click()
        } else {
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
            //将上一点击过的评论栏高度归回原样
            if (levelCounter[0] != 0 && levelCounter[levelCounter[0]] && levelCounter[0] != commentLevel) {
                let temp = Number(levelCounter[0]) - 1
                let h = Number(document.getElementById(`reply-form-${Number(levelCounter[0])}`).style.height.slice(0, -2))
                nav[temp].style.height = (nav[temp].offsetHeight - h) + "px"
                levelCounter[temp + 1] = 0
            }
            levelCounter[0] = Number(commentLevel)
            //更改当前评论栏高度
            let olderH = commentNav.offsetHeight;
            console.log(levelCounter[0])
            if (!levelCounter[commentLevel]) {
                commentNav.style.height = (olderH + 45) + "px"
                levelCounter[commentLevel] = 1
            }
            //显示回复表单
            for (let j = 0; j < replyForms.length; j++) {
                if (!replyForms[j].classList.contains("hide")) replyForms[j].classList.add("hide")
            }
            replyForm.classList.remove("hide")
            //回复表单下的textarea
            let replyText = document.getElementById(`reply-text-${commentLevel}`)
            //初始化回复表单样式
            replyText.value = ""
            replyForm.style.height = "40px"

            replyText.onfocus = function () {
                replyForm.style.height = "120px"
                let olderH = commentNav.offsetHeight;
                commentNav.style.height = (olderH + 80) + "px"
            }
            replyText.onblur = function () {
                if (replyText.value == "" || replyText.value == null) {
                    replyForm.style.height = "40px"
                    let olderH = commentNav.offsetHeight;
                    commentNav.style.height = (olderH - 80) + "px"
                }
            }
            //设置textarea的默认输出“回复 某某”
            replyText.setAttribute("placeholder", `回复 ${commentAuthor}`)
        }

    }
}
for (let i = 0; i < replyBtn2.length; i++) {
    replyBtn2[i].onclick = function () {
        if (!isloged) {
            loginbtn.click()
        } else {
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
            //将上一点击过的评论栏高度归回原样
            //将上一点击过的评论栏高度归回原样
            if (levelCounter[0] != 0 && levelCounter[levelCounter[0]] && levelCounter[0] != commentLevel) {
                let temp = Number(levelCounter[0]) - 1
                let h = Number(document.getElementById(`reply-form-${Number(levelCounter[0])}`).style.height.slice(0, -2))
                nav[temp].style.height = (nav[temp].offsetHeight - h) + "px"
                levelCounter[temp + 1] = 0
            }
            levelCounter[0] = Number(commentLevel)
            //更改评论栏高度
            let olderH = commentNav.offsetHeight;
            console.log(commentLevel)
            if (!levelCounter[commentLevel]) {
                commentNav.style.height = (olderH + 45) + "px"
                levelCounter[commentLevel] = 1
            }
            //显示回复表单
            for (let j = 0; j < replyForms.length; j++) {
                if (!replyForms[j].classList.contains("hide")) replyForms[j].classList.add("hide")
            }
            replyForm.classList.remove("hide")
            //回复表单下的textarea
            let replyText = document.getElementById(`reply-text-${commentLevel}`)
            replyText.value = ""
            replyForm.style.height = "40px"
            replyText.onfocus = function () {
                replyForm.style.height = "120px"
                let olderH = commentNav.offsetHeight;
                commentNav.style.height = (olderH + 80) + "px"
            }
            replyText.onblur = function () {
                if (replyText.value == "" || replyText.value == null) {
                    replyForm.style.height = "40px"
                    let olderH = commentNav.offsetHeight;
                    commentNav.style.height = (olderH - 80) + "px"
                }
            }
            //设置textarea的默认输出“回复 某某”
            replyText.setAttribute("placeholder", `回复 ${commentAuthor}`)
            let sendId = document.createElement("input")
            sendId.setAttribute("type", "hidden")
            sendId.setAttribute("name", "fatherCommentId")
            sendId.setAttribute("value", `${commentId}`)
            replyArea.appendChild(sendId)
        }

    }
}


