<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="model.member.MemberVO, java.util.ArrayList"%>
<jsp:useBean id="mdatas" class="java.util.ArrayList" scope="request" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<h1>멤버 정보</h1>
	<table border="1">
		<tr>
			<td>회원 번호</td>
			<td>아이디</td>
			<td>비번</td>
		</tr>
		<c:forEach var="v" items="${mdatas}">
			<tr>
				<td>${v.mnum}</td>
				<td>${v.mid}</td>
				<td>${v.mpw}</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>