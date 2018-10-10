

$(document).ready(function () {

	var menu = $('#menu')
	var menu1 = $('#menu1')

	$('#menu-trigger').click(function (event) {
		event.preventDefault();

		if (menu1.is(":visible")) {
			menu1.slideUp(400);
			$(this).removeClass("open");
		}

		if (menu.is(":visible")) {
			menu.slideUp(400);
			$(this).removeClass("open");
		}

		else {
			menu.slideDown(400);
			$(this).addClass("open");
		}

	});


	$('#menu-trigger1').click(function (event) {
		event.preventDefault();

		if (menu.is(":visible")) {
			menu.slideUp(400);
			$(this).removeClass("open");
		}

		if (menu1.is(":visible")) {
			menu1.slideUp(400);
			$(this).removeClass("open");
		}

		else {
			menu1.slideDown(400);
			$(this).addClass("open");
		}
	});

	document.getElementById("body_general").addEventListener("wheel", myFunction);

	function myFunction() {
		if (menu.is(":visible")) {
			menu.slideUp(400);
			$(this).removeClass("open");
		}
		if (menu1.is(":visible")) {
			menu1.slideUp(400);
			$(this).removeClass("open");
		}

	}
	$(document).scroll(function (event) {
		if (menu.is(":visible")) {
			menu.slideUp(400);
			$(this).removeClass("open");
		}
		if (menu1.is(":visible")) {
			menu1.slideUp(400);
			$(this).removeClass("open");
		}
	});

});

