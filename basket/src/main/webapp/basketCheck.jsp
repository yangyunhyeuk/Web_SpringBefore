<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 전 장바구니 체크</title>
</head>
<body>

	<%
	ArrayList<String> list = (ArrayList) session.getAttribute("list");
	if (list == null) {
		out.println("장바구니에 상품이 없습니다. 유저 페이지로 이동합니다.");
		response.sendRedirect("user.jsp");
	} else {
		response.sendRedirect("buy.jsp");

	}
	%>



</body>
</html>