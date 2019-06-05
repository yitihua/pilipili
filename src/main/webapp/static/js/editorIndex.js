document.getElementById('btn1').addEventListener('click', function () {
    // 读取 html
    let text=editor.txt.html()
    let newArticle = document.createElement("input")
    newArticle.setAttribute("type","hidden")
    newArticle.setAttribute("name","article")
    newArticle.setAttribute("value",`${text}`)
    let fm = document.getElementById("new-article")
    fm.appendChild(newArticle)
    fm.submit()
}, false)

// document.getElementById('btn2').addEventListener('click', function () {
//     // 读取 text
//     alert(editor.txt.text())
// }, false)