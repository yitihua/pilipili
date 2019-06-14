
$(function(){
// 添加账户
    $("#addUser").click(function(){
        $('#add-box1').show();

        //获取页面文档的高度
        var docheight = $(document).height();
        //追加一个层，使背景变灰
        $("body").append("<div id='greybackground'></div>");
        $("#greybackground").css({"opacity":"0.3","height":docheight});
        return false;
    });
    //点击关闭按钮
    $("#closeBtn1").click(function() {

        $("#add-box1").hide();
        //删除变灰的层
        $("#greybackground").remove();
        return false;
    });

// 修改权限
    $(".change-authority").click(function(){
        $('#change-authority-box').show();

        var currentName = this.getAttribute("user-name");
        var currentRoles = this.getAttribute("user-roles");
        $("#edit-name").val(currentName);
        $("#refundReason").val(currentRoles);

        //根据值让复选框选中
        var key = $("#refundReason").val();
        $("input[value='" + key + "']").prop('checked',true);

        //获取复选框选择值
        // var chenked=$("input[type='checkbox']:checked").val([]);
        // var names = "";
        // for(var i=0;i<chenked.length;i++){
        //     names += chenked[i].value +",";
        // }
        // $("#newRole").val(names);


        //获取页面文档的高度
        var docheight = $(document).height();
        //追加一个层，使背景变灰
        $("body").append("<div id='greybackground'></div>");
        $("#greybackground").css({"opacity":"0.3","height":docheight});
        return false;
    });
    //点击关闭按钮
    $("#closeBtn2").click(function() {
        $("#change-authority-box").hide();
        //删除变灰的层
        $("#greybackground").remove();
        return false;
    });



// 删除账户
    $(".delect").click(function() {
        $('#delect-box').show();

        var currentId = this.getAttribute("user-id");
        var actionIndex = $('#changeRoleform').attr('action');
        var tempurl =actionIndex +currentId;
        $('#changeRoleform').attr('action',tempurl);

        //获取页面文档的高度
        var docheight = $(document).height();
        //追加一个层，使背景变灰
        $("body").append("<div id='greybackground'></div>");
        $("#greybackground").css({"opacity":"0.3","height":docheight});
        return false;
    });
    $("#closeBtn3").click(function() {
        $("#delect-box").hide();
        //删除变灰的层
        $("#greybackground").remove();
        return false;
    });
});