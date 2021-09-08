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
<!-- 바로 값을 전송한다. -->
	<c:redirect url="NewFile3.jsp">
	<c:param name="test">p</c:param>
	</c:redirect>
</body>
</html>