<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	pageContext.forward("control.jsp?action=list"); 
	// 컨트롤러 페이지에게 list.jsp 페이지를 요청하는 코드로 액션을 사용해 제어하였다.
%>