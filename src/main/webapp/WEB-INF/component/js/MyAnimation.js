function move(x) {

	if (x === 1) {

		$(".icon-box").mouseover(function() {

			$("#p1").addClass("animate__animated");
			$("#p1").addClass("animate__fadeInUp");
			$("#p1").addClass("animate__adeInUp");

		})
	}

	if (x === 2) {

		$(".icon-box").mouseover(function() {

			$("#p2").addClass("animate__animated");
			$("#p2").addClass("animate__fadeInUp");
			$("#p2").addClass("animate__adeInUp");

		})
	}

	if (x === 3) {

		$(".icon-box").mouseover(function() {

			$("#p3").addClass("animate__animated");
			$("#p3").addClass("animate__fadeInUp");
			$("#p3").addClass("animate__adeInUp");

		})
	}

	if (x === 4) {

		$(".icon-box").mouseover(function() {

			$("#p4").addClass("animate__animated");
			$("#p4").addClass("animate__fadeInUp");
			$("#p4").addClass("animate__adeInUp");

		})
	}

	if (x === 5) {

		$(".icon-box").mouseover(function() {

			$("#p5").addClass("animate__animated");
			$("#p5").addClass("animate__fadeInUp");
			$("#p5").addClass("animate__adeInUp");

		})
	}

	if (x === 6) {

		$(".icon-box").mouseover(function() {

			$("#p6").addClass("animate__animated");
			$("#p6").addClass("animate__fadeInUp");
			$("#p6").addClass("animate__adeInUp");

		})
	}


}

function nomove(x) {

	$(".icon-box").mouseleave(function() {

		$("#p1").removeClass("animate__animated");
		$("#movep").removeClass("animate__fadeInUp");
		$("#movep").removeClass("animate__adeInUp");

		if (x === 1) {

			$(".icon-box").mouseover(function() {

				$("#p1").removeClass("animate__animated");
				$("#p1").removeClass("animate__fadeInUp");
				$("#p1").removeClass("animate__adeInUp");

			})
		}

		if (x === 2) {

			$(".icon-box").mouseover(function() {

				$("#p2").removeClass("animate__animated");
				$("#p2").removeClass("animate__fadeInUp");
				$("#p2").removeClass("animate__adeInUp");

			})
		}

		if (x === 3) {

			$(".icon-box").mouseover(function() {

				$("#p3").removeClass("animate__animated");
				$("#p3").removeClass("animate__fadeInUp");
				$("#p3").removeClass("animate__adeInUp");

			})
		}

		if (x === 4) {

			$(".icon-box").mouseover(function() {

				$("#p4").removeClass("animate__animated");
				$("#p4").removeClass("animate__fadeInUp");
				$("#p4").removeClass("animate__adeInUp");

			})
		}

		if (x === 5) {

			$(".icon-box").mouseover(function() {

				$("#p5").removeClass("animate__animated");
				$("#p5").removeClass("animate__fadeInUp");
				$("#p5").removeClass("animate__adeInUp");

			})
		}

		if (x === 6) {

			$(".icon-box").mouseover(function() {

				$("#p6").removeClass("animate__animated");
				$("#p6").removeClass("animate__fadeInUp");
				$("#p6").removeClass("animate__adeInUp");

			})
		}

	})
	
	
}


$(function(){
	$('.search_btn').on('click',function(){
	$(".search_open, .search_close").toggleClass("search_open search_close");
		$(".search_Data").toggleClass("search_actives");
		$(".search_btn").toggleClass("squar_btn");
		$(".Searchinpt").toggleClass("inpt_lg");
		$('.go_btn').toggleClass('search_active_go_btn');
	});
	});


