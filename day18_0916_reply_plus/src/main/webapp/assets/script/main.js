/**
 * 
 */
$(document).ready(function() {
		$("p").hide();
		// $("ul > li:first-child a").next().show();
		$("ul li a").click(function() {
			$(this).next().slideToggle(300);
			// $(this).next().slideDown(300);
			$("ul li a").not(this).next().slideUp(300);
			return false;
		});
		$("ul li a").eq(0).trigger("click");
	});