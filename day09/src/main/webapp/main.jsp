<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib tagdir="/WEB-INF/tags" prefix="newtag"%>
    <jsp:useBean id="memVO" class="model.member.MemberVO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1><%=memVO.getMid()%>님 접속!</h1>
<h3>로그인 성공</h3>
<hr>


<a href="control.jsp?action=logout">로그아웃</a>
<hr>

</body>
</html>