document.getElementById('btn1').addEventListener('click', function () {
    // 读取 html
    let text=ditor.txt.html()
    let article = document.createElement("input")
    article.setAttribute("type","hidden")
    article.setAttribute("name","article")
    article.setAttribute("value",`${text}`)
    let fm = document.getElementById("new-article")
    fm.appendChild("article")
    fm.submit()
}, false)

// document.getElementById('btn2').addEventListener('click', function () {
//     // 读取 text
//     alert(editor.txt.text())
// }, false)