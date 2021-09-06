<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<table border="1">
		<c:forEach var="v" items="${members}">
			<tr>
				<td>${v.name}</td>
				<td>${v.email}</td>
			</tr>
		</c:forEach>
	</table>


	<br>

	<table border="1">
		<c:forEach var="v" items="${members}">
			<tr>
				<td>${v.name}</td>
				<td><c:out value="${v.email}">이메일 정보없음</c:out></td>
			</tr>
		</c:forEach>
	</table>

	<br>

	<table border="1">
		<c:forEach var="v" items="${members}">
			<tr>
				<td>${v.name}</td>
				<td><c:out value="${v.email}" escapeXml="false">
						<font color="red">이메일 정보없음 
					</c:out></td>
				<!-- cout의 속성 : escapeXml="false" -->
			</tr>
		</c:forEach>
	</table>

</body>
</html>