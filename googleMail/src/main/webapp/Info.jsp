<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="web.mail.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function mSubmit() {
		var uid = document.getElementById('uid').value;
		var mymail = document.getElementById('mymail').value;
		
		if (uid === '')
			alert('아이디를 입력하세요');
		else if (mymail === '')
			alert('이메일을 입력하세요');
		else if (!/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/.test(mymail))
			alert('이메일 형식에 맞춰 입력하세요');
		else {
			fetch("/mail/send?uid=" + uid + "&mymail=" + mymail).then(window.close);
	}
</script>

</head>
<body>

	<input type="text" id="uid" name="uid" placeholder="회원 아이디">
	<br>
	<input type="email" id="mymail" name="mymail" placeholder="받으실 이메일">
	<br>
	<button type="button" onclick="mSubmit()">정보입력 완료</button>


</body>
</html>