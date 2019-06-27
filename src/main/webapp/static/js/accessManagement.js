
$(function(){

// 修改权限
    $(".change-authority").click(function(){

        $('#change-authority-box').show();

        var currentId = this.getAttribute("user-id");
        var actionIndex = $('#changeRoleform').attr('action');
        var tempurl =actionIndex +currentId;
        $('#changeRoleform').attr('action',tempurl);

        var currentName = this.getAttribute("user-name");
        $("#edit-name").val(currentName);
        var currentRoles = this.getAttribute("user-roles");
        $("#refundReason").val(currentRoles);

        //根据值让复选框选中
        var r = $("#refundReason").val();
        var result = r.split(",");
        for(var i=0;i<result.length;i++){
            $("input[value='"+result[i]+"']").attr("checked","checked");
        }

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

});