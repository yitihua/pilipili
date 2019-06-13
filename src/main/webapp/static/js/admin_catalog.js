$(function(){

    //add
    $("#addType").click(function(){
        $('#add-box').show();

        //获取页面文档的高度
        var docheight = $(document).height();
        //追加一个层，使背景变灰
        $("body").append("<div id='greybackground'></div>");
        $("#greybackground").css({"opacity":"0.3","height":docheight});
        return false;

    });
    //点击关闭按钮
    $("#closeBtn").click(function() {
        $("#add-box").hide();
        //删除变灰的层
        $("#greybackground").remove();
        return false;
    });

    // edit
    $(".edit").click(function(){
        $('#edit-box').show();

        var currentName = this.getAttribute("type-name")
        var currentEngName = this.getAttribute("type-engName")
        $("#type-name").val(currentName);
        $("#type-engName").val(currentEngName);

        //获取页面文档的高度
        var docheight = $(document).height();
        //追加一个层，使背景变灰
        $("body").append("<div id='greybackground'></div>");
        $("#greybackground").css({"opacity":"0.3","height":docheight});
        return false;

    });
    //点击关闭按钮
    $("#closeBtn2").click(function() {
        $("#edit-box").hide();
        //删除变灰的层
        $("#greybackground").remove();
        return false;
    });

    // delect
    $(".delect").click(function(){
        $('#delect-box').show();

        var currentId = this.getAttribute("type-id");
        var actionIndex=$('#delectform').attr('action');
        var tempurl =actionIndex +currentId;
        $('#delectform').attr('action',tempurl);

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
})