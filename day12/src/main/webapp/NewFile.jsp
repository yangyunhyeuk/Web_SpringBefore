<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- SQL 태그 -->
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCP 연결 테스트</title>
</head>
<body>

	<sql:query var="rs" dataSource="jdbc/orcl">
	SELECT * FROM TEST
	</sql:query>

	<h2>DBCP 연결 테스트</h2>
	<hr>
	<c:forEach var="v" items="${rs.rows}">
	${v.name} / ${v.email} <br>
	</c:forEach>

</body>
</html>