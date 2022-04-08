$(function() {
	$(".default_option").click(function() {
		$(".dropdown ul").addClass("active");
	});
	

	$(".dropdown").click(function() {
		$(".dropdown ul").addClass("active");
		
	});

	$(".dropdown ul li").click(function(event) {
		console.log($(this).attr("data-value"))
		var text = $(this).text();
		$(".default_option").text(text);
		$("#c").val($(this).attr("data-value"))
		$(this).parent().removeAttr("class","active");
		event.stopPropagation()
	});

	
	$(".fas.fa-search").click(function(event){
		$("form[action=list]").submit();
	})
});// ready
