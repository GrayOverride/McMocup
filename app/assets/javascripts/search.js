$(document).ready(function(){
	$( "#search-toggle" ).click(function() {
		$(this).parent().toggleClass("search-toggle-active");

		$( "#search-div" ).slideToggle( "slow", function() {
			//Animation complete
		});
	});
});