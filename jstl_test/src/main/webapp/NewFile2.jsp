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

<!-- 다음의 코드 대신 에러페이지를 만들어서 처리 -->
<c:catch var="errMsg">
<%=10/0 %>
</c:catch>
${errMsg} <br>


<c:set var="msg" value="안녕하세요!"></c:set>
<h1>${msg}</h1>

<c:remove var="msg"/>

<hr>

<c:set target="${member}" property="email" value="qwer@naver.com"/> 
${member.name}<br>
${member.email}<br>

<c:set target="${member}" property="email" value="coding_helper@naver.com" />
${member.name} <br>
${member.email}<br>


</body>
</html>