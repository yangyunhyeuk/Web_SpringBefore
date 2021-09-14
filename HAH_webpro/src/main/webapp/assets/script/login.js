// 로그인 js



//로그인 유효성 검사===========================================================================================================================
var logBtn = document.querySelector('#logCheck');
logBtn.onclick = function() {
	var idCheck = document.getElementById("idCheck");
	var pwCheck = document.getElementById("pwCheck");

	if (idCheck.value == "") {
		alert("아이디를 입력하세요.");
		idCheck.focus();
		return false;
	}
	if (pwCheck.value == "") {
		alert("비밀번호를 입력하세요.");
		pwCheck.focus();
		return false;
	} else {
		alert("로그인되었습니다.");
		return true;

	}

}
//==========================================================================================================================================








//이메일 입력방식 선택============================================================================================================================
$('#selectEmail').change(function() {
	$("#selectEmail option:selected").each(function() {
		if ($(this).val() == '1') {

			//직접입력일 경우 
			$("#str_email02").val(''); //값 초기화 
			$("#str_email02").attr("disabled", false);
			//활성화 
		} else {
			//직접입력이 아닐경우 
			$("#str_email02").val($(this).text());
			//선택값 입력 
			$("#str_email02").attr("disabled", true);
			//비활성화 
		}
	});
});
//==========================================================================================================================================










// querySelector : 구체적인 그룹과 일치하는 document 내 엘리먼트를 반환한다. 
// getElementById : id를 통해 엘리먼트를 반환한다. 
// 차이는 다음과 같다. 디테일이 다르다. 
// var username = document.getElementById("username");
// var username = document.querySelector("#userForm #username");

//회원가입 유효성 검사==========================================================================================================================
var btn = document.querySelector('#confirm');
btn.onclick = function() {
	var uid = document.getElementById("uid");
	var pwd = document.getElementById("pwd");
	var repwd = document.getElementById("repwd");
	var mobile = document.getElementById("mobile");
	var telInput = document.querySelectorAll(".tel");
	var tel1 = document.getElementById("tel1");
	var str_email01 = document.getElementById("str_email01");
	var str_email02 = document.getElementById("str_email02");
	var agree = document.getElementById("agree");
	var flag = false;


	if (uid.value == "") {
		alert("아이디를 입력하세요.");
		uid.focus();
		return false;
	}

	var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
	
	if (!idRegExp.test(uid.value)) {
		alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
		uid.focus();
		return false;
	};




	if (pwd.value == "") {
		alert("비밀번호를 입력하세요.");
		pwd.focus();
		return false;
	}

	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

	if (!pwdCheck.test(pwd.value)) { // 비밀번호 유효성 검사
		alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야합니다.");
		pwd.focus();
		return false;
	}
	;
	if (repwd.value !== pwd.value) { // 비밀번호 재확인 검사
		alert("비밀번호가 일치하지 않습니다.");
		repwd.focus();
		return false;
	}
	;
	while (true) {
		for (let i = 0; i < telInput.length; i++) {
			if (telInput[i].checked) {
				flag = true;
			}
		}
		if (flag) {
			break;
		} else {
			alert("통신사를 선택해주시기 바랍니다.");
			tel1.focus();
			return false;
			break;
		}
	}

	if (mobile.value == "") {
		alert("전화번호를 입력하세요.");
		mobile.focus();
		return false;
	}

	var phoneCheck = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

	if (!phoneCheck.test(mobile.value)) { // 폰번호 검사
		alert("전화번호를 형식에 맞춰 재입력바랍니다.");
		mobile.focus();
		return false;
	}

	;
	if (str_email01.value == "" || str_email02.value == "") {
		alert("이메일을 입력하세요.");
		str_email01.focus();
		return false;
	};
	var emailRegExp = /^[A-Za-z0-9]{5,12}$/; //이메일 유효성 검사
	if (!emailRegExp.test(str_email01.value)){                 
		alert("이메일의 경우 영문 대/소문자와 숫자를 사용하여 5~12자리 작성해주세요");
		str_email01.focus();
		return false;
	}
	
	;

	if (!agree.checked) {
		alert("약관 동의를 체크하세요.");
		agree.focus();
		return false;
	}

	else {
		alert("회원가입이 완료되었습니다.");
		return true;
	}
}
//==========================================================================================================================================