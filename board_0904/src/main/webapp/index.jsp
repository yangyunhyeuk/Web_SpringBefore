<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<%
	if (session.getAttribute("mem") == null) {
	%>
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="login">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mid"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="mpw"></td>
			</tr>
			<tr>
				<td colspan='1'><input type="submit" value="로그인"></td>
			</tr>

		</table>
	</form>
				<a href="reg.jsp"><input type="submit" value="회원가입" ></a>

	<%
	} else {
	%>
	<form action="control.jsp" method="post" name="form2">
		<input type="hidden" name="action" value="logout"> <input
			type="submit" value="로그아웃">
	</form>
	<%
	}
	%>

</body>
</html>