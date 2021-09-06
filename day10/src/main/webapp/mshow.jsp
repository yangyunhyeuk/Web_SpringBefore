<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="model.member.MemberVO, java.util.ArrayList"%>
<jsp:useBean id="mdatas" class="java.util.ArrayList" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border="1">
		<tr>
			<td>회원 번호</td>
			<td>아이디</td>
			<td>비번</td>
		</tr>

		<%
		for (MemberVO vo : (ArrayList<MemberVO>) mdatas) {
		%>
		<tr>
			<td><%=vo.getMnum()%></td>
			<td><%=vo.getMid()%></td>
			<td><%=vo.getMpw()%></td>
		</tr>
		<%
		}
		%>
	</table>


</body>
</html>