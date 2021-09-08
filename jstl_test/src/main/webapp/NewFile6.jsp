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

	<ul>
		<c:forTokens var="v" items="나서스,이렐리아,갱플랭크,티모,다리우스" delims=",">
			<li>${v}</li>
		</c:forTokens>
	</ul>


	<hr>

	<c:forEach var="v" items="${members}" begin="0" end="3" varStatus="vs">
	${vs.index} / ${vs.count} <br>
	${v.name} ${v.email} <hr>
	</c:forEach>

</body>
</html>