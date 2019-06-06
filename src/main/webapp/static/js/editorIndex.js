document.getElementById('btn1').addEventListener('click', function () {
    // 读取 html
    let text=editor.txt.html()
    let tit = document.getElementById("title")
    let newArticle = document.createElement("input")
    newArticle.setAttribute("type","hidden")
    newArticle.setAttribute("name","content")
    newArticle.setAttribute("value",text)
    let newTitle = document.createElement("input")
    newTitle.setAttribute("type","hidden")
    newTitle.setAttribute("name","title")
    newTitle.setAttribute("value",tit)
    let fm = document.getElementById("new-article")
    fm.appendChild(newArticle)
    fm.appendChild(newTitle)
    fm.submit()
}, false)

// document.getElementById('btn2').addEventListener('click', function () {
//     // 读取 text
//     alert(editor.txt.text())
// }, false)