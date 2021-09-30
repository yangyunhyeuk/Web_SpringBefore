<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send_mail() {
		window.open("./Info.jsp", "", "width=370, height=360, resizable=no, scrollbars=no, status=no");
	}
</script>
</head>
<body>


	<div class="form-group" style="width: 38%; margin: 10px auto;">
		<button type="button" class="btn btn-primary btn-lg btn-block"
			onclick="send_mail()">임시비밀번호 발급</button>
	</div>



</body>
</html>