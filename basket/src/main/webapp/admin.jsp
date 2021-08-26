<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
h, div {
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
		<%
		// 캐스팅(형변환)
		int buyCnt = (Integer)application.getAttribute("buyCnt");
		%>



	<div id="wrapper">

		<h2>
			결제 방문 횟수 :
			<%=buyCnt%></h2>

	</div>
	
	

</body>
</html>