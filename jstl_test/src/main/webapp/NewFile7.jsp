<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내,외부 자원 예제</title>
</head>
<body>



<c:import url="NewFile6.jsp" var="innerURL"></c:import>
<!-- 내가 만든 내부 자원을 var 공간에 집어넣는다. -->
<c:out value="${innerURL}" escapeXml="false"></c:out>

<c:import url="https://www.naver.com/" var="outerURL"></c:import>
<!-- 존재하는 외부 자원을 var 공간에 집어넣는다. -->
<c:out value="${outerURL}" escapeXml="false"></c:out>









</body>
</html>