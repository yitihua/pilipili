$(function(){
// 添加账户
	$("#add").click(function(){
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
	$("#change-authority").click(function(){
		$('#change-authority-box').show();
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
	$('#delect').click(function() {
		$('#delect-box').show();
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




})