<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.member.*"%>
<jsp:useBean id="memDAO" class="model.member.MemberDAO" />
<jsp:useBean id="memVO" class="model.member.MemberVO" scope="session"/>
<jsp:setProperty property="*" name="memVO" />


<%
String action = request.getParameter("action");

if (action.equals("login")) {
	//System.out.println("로그인 액션 접속");
	MemberVO mem = memDAO.getDBData(memVO);
	if (mem != null) {
		session.setAttribute("mem", mem);
		response.sendRedirect("control.jsp?action=list");
	} else {
		out.println("<script>alert('로그인 실패!');history.go(-1)</script>");
	}
}

else if (action.equals("list")) {
	
	pageContext.forward("main.jsp");
}
else if (action.equals("logout")) {
	session.invalidate();
	pageContext.forward("index.jsp");

}
%>





























































<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





</body>
</html>