<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="reg" class="model.member.MemberVO" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>회원가입</h2>
<hr>
<form action="control.jsp" method="post" name="form1">
<input type="hidden" name="action" value="mem_reg">
<table border="1">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="mid"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="mpw"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="회원가입"></td>
	</tr>
</table>
</form>


</body>
</html>