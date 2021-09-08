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

	<h3>이름 데이터 존재 유무</h3>
	<form>
		<input type="text" name="name"> <input type="submit"
			value="이름 입력">
	</form>
	<c:choose>
		<c:when test="${empty param.name}">
		이름이 비어있습니다.
		<br>
		</c:when>
		<c:when test="${not empty param.name}">
		이름이 비어있지 않습니다.
		<br>
		</c:when>
	</c:choose>

	<c:if test="${param.name eq '홍길동'}">
		이름이 홍길동입니다.
		<br>
	</c:if>
	<c:if test="${param.name ne '홍길동'}">
		이름이 홍길동이 아닙니다.
		<br>
	</c:if>


</body>
</html>