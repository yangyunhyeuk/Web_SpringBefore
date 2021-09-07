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
	<h6>코어태그 if</h6>
	<c:set var="msg" value="test" />

	<c:if test="${msg=='test'}" var="res">
	1. 결과는 [${res}]입니다.
</c:if>

	<c:if test="${msg!='test'}" var="res">
	2. 결과는 [${res}]입니다.
</c:if>


	<hr>
	<h6>코어태그 choose</h6>

	<form>
		<select name="test">
			<option>-</option>
			<option ${param.test=="A" ? 'selected':''}>A</option>
			<option ${param.test=="B" ? 'selected':''}>B</option>
			<option ${param.test=="C" ? 'selected':''}>C</option>
		</select> <input type="submit" value="선 택">
	</form>
	<hr>
	<!--param의 경우 null도 용인하기에 파람을 기입해준다. -->
	[${param.test}]을 선택했습니다
	<c:choose>
		<c:when test="${param.test=='A'}">
	A를 선택했습니다.
	</c:when>
		<c:when test="${param.test=='B'}">
	B를 선택했습니다.
	</c:when>
		<c:when test="${param.test=='C'}">
	C를 선택했습니다.
	</c:when>
		<c:otherwise>
	c:otherwise
	</c:otherwise>
	</c:choose>




















</body>
</html>