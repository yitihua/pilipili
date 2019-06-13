document.getElementById('btn1').addEventListener('click', function () {
    // 读取 html
    let fm = document.getElementById("new-article")
    let text=editor.txt.html()
    let tit = document.getElementById("title").value
    let radioes = document.getElementsByClassName("radioes")
    let newArticle = document.createElement("input")
    let newType = document.createElement("input")
    for(let i=0;i<radioes.length;i++){
        if(radioes[i].checked){
            var typeValue = radioes[i].value
        }
    }
    newArticle.setAttribute("type","hidden")
    newArticle.setAttribute("name","content")
    newArticle.setAttribute("value",text)
    let newTitle = document.createElement("input")
    newTitle.setAttribute("type","hidden")
    newTitle.setAttribute("name","title")
    newTitle.setAttribute("value",tit)
    newType.setAttribute("type","hidden")
    newType.setAttribute("name","type")
    newType.setAttribute("value",typeValue)
    fm.appendChild(newArticle)
    fm.appendChild(newTitle)
    fm.appendChild(newType)
    fm.submit()
}, false)

// document.getElementById('btn2').addEventListener('click', function () {
//     // 读取 text
//     alert(editor.txt.text())
// }, false)