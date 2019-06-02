$(function() {
	$('.sidenav-second-level').hide();

	$('.sidenav-first-level').click(function() {
		$(this).next('.sidenav-second-level').toggle('fast');
		if ($(this).children('i').hasClass('fa-rotate-90')) {
			$(this).children('i').removeClass('fa-rotate-90');
			$(this).children('i').removeClass('fa-rotate-270');
		} else{
			$(this).children('i').addClass('fa-rotate-90');
		}
		
	});


});