<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 페이지</title>
<style>
h, form, table, tr, td, a, input, div {
	margin: 5px;
	padding: 5px;
}

#wrapper {
	background-color: lightblue;
	text-align: center;
}

table {
	border: inset; 
	margin-left : auto;
	margin-right: auto;
	margin-left: auto;
}

</style>

</head>
<body>


	<%
	request.setCharacterEncoding("UTF-8");

	// 유지보수 : 같은 의미,같은 값을 가지고있다면 변수명을 일치시킨다!
	// 설계 -> 변수명 정의, 주석
	%>

	<%=session.getAttribute("username")%>님 환영합니다!
	<br>

	<br>

	<div id="wrapper">
		<h2>=== 프로틴 제품 목록 ===</h2>
		<table>
			<tr>
				<td>제품</td>
				<td>가격</td>
			</tr>
			<tr>
				<td>민트초코맛</td>
				<td>10,000</td>
			</tr>
			<tr>
				<td>초코케이크맛</td>
				<td>20,000</td>
			</tr>
			<tr>
				<td>딸기맛</td>
				<td>30,000</td>
			</tr>
		</table>

		<br> <br> <br>
		<form action="add.jsp" name="form1" method="post">
			<select name="protein">
				<option selected>민트초코맛</option>
				<option>초코케이크맛</option>
				<option>딸기맛</option>
			</select> <input type="number" name="cnt" value="1" min="1" max="100">
			<input type="submit" value="장바구니에 담기">
		</form>
		<hr>
		<br> <br> <br> <br> <a href="buy.jsp">구매하기</a>


	</div>




</body>
</html>