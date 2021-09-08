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
	<c:set var="Income" scope="session" value="${4000*4}" />
	<c:out value="${Income}" />


	<c:set var="income" scope="session" value="${4000*4}" />
	<c:if test="${income > 8000}">
		<p>
			My income is:
			<c:out value="${income}" />
		<p>
	</c:if>


	<c:choose>
		<c:when test="${income <= 1000}">  
       Income is not good.  
    </c:when>
		<c:when test="${income > 10000}">  
        Income is very good.  
    </c:when>
		<c:otherwise>  
       Income is undetermined...  
    </c:otherwise>
	</c:choose>


	

















</body>
</html>