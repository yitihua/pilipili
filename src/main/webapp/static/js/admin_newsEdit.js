
$(document).ready(function(){
    //编辑器的初始化
    var E = window.wangEditor;
    var editor = new E('#editor-tools','#editor-text');
    editor.create();

    $('#btn1').click(function () {
        //获取表单信息并提交
        var content = editor.txt.html();
        var tit = $('#title').val();
        $('#new-article').append("<input type='text' name='content' class='newContent'>");
        $('#new-article').append("<input type='text' name= 'title' class='newTitle'> ");
        $('.newContent').val(content);
        $('.newTitle').val(tit);
        //判断事件为新增还是修改,然后提交表单
        var addPath = "${ctx}/newsEdit/create";
        if($(".title-text").val() == ""){
            $('#new-article').attr("action",addPath).submit();
        }else {
            $('#new-article').submit();
        }
    });
});