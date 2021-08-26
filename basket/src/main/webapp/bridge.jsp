<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String username=request.getParameter("username");
	//System.out.println(username+" 유저네임");
	if(username.equals("admin")){
		session.setAttribute("username", username);
		response.sendRedirect("admin.jsp");
	}
	else{
		session.setAttribute("username", username);
		response.sendRedirect("user.jsp");
	}
	//System.out.println(username+" 유저네임");
	


%>