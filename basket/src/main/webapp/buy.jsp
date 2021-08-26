<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 페이지</title>
<style>
h, a {
	margin: 5px;
	padding: 5px;
}

#wrapper {
	background-color: lightblue;
	text-align: center;
}
</style>
</head>
<body>

	<div id="wrapper">
		<h3>구매한 상품 목록</h3>
		<hr>
		<%
		ArrayList<String> list = (ArrayList) session.getAttribute("list");
		ArrayList<String> cntlist = (ArrayList) session.getAttribute("cntlist");
		if (list == null) {
			out.println("구매한 상품이 없습니다.");
		} else {
			application.setAttribute("buyCnt",((Integer)application.getAttribute("buyCnt"))+1);
			int cnt = 0;
			for (String v : list) {
				out.println(v + " : " + cntlist.get(cnt) + "<br>");
				cnt++;
			}
			
		}
		%>
		<br> <br> <br> <a href="index.jsp">로그인 화면으로 이동</a>

	</div>
</body>
</html>