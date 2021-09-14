$(document).ready(function() { // 스크롤이 필요한 경우에만 명시되도록 설정 

			$("#on").click(function() { // id가 on인 태그 클릭 시 수행
				$(".form-wrap").css("overflow", "hidden");
			});
			$("#off").click(function() { // id가 off인 태그 클릭 시 수행
				$(".form-wrap").css("overflow", "scroll");

			});

		});

		var x = document.getElementById("login");
		var y = document.getElementById("register");
		var z = document.getElementById("btn");

		function login() { // 클릭 시 위치 설정
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left = "0";
		}

		function register() { // 클릭 시 위치 설정
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left = "110px";
		}