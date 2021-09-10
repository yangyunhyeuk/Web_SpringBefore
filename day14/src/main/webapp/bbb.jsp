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

	실습 필터 사용 결과 : ${param.coffee}


	<c:if test="${param.coffee eq '아포가토'}">

		<c:out value="${param.cnt*2500}원입니다." />

	</c:if>
	<c:if test="${param.coffee eq '아메리카노'}">

		<c:out value="${param.cnt*3000}원입니다." />

	</c:if>
	<c:if test="${param.coffee eq '민트초코'}">

		<c:out value="${param.cnt*5000}원입니다." />

	</c:if>



</body>
</html>