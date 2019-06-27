$(function () {
    //排序

    //

    $(".delect").click(function(){
        $('#delect-box').show();

        var currentId = this.getAttribute("dict-id");
        var actionIndex=$('#delectform').attr('action');
        var tempurl =actionIndex +currentId;
        $('#delectform').attr('action',tempurl);

        getElementById("delectform").submit();
        //获取页面文档的高度
        var docheight = $(document).height();
        //追加一个层，使背景变灰
        $("body").append("<div id='greybackground'></div>");
        $("#greybackground").css({"opacity":"0.3","height":docheight});
        return false;

    });
    //点击关闭按钮
    $("#closeBtn3").click(function() {
        $("#delect-box").hide();
        //删除变灰的层
        $("#greybackground").remove();
        return false;
    });

});