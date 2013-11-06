$(function() {
	$(".comment-form-link").click(function() {
		$(this).parent().children(".comment-form").slideToggle();
	});
});