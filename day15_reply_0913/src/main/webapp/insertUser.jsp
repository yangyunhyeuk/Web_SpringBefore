<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<h2>회원가입하기</h2>
	<br>
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="insert">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uuid"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>

			<tr>
				<td colspan='2'><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form>


</body>
</html>