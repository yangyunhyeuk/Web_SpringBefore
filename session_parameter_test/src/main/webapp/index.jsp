<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function idCheck() {
		var id = document.form.id.value;
		//console.log(id);
		location.href = "control_member.jsp?action=check&id=" + id;
	}
</script>

</head>

<body>

	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value="login"> <input
			type="text" name="userID"> <input type="password"
			name="userPW"> <input type="submit" value="로그인"> <input
			type="button" value="중복체크" onclick="idCheck()">
	</form>

</body>
</html>