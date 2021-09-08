<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="model.singer.*, model.singer.*, java.util.ArrayList"%>

<jsp:useBean id="singVO" class="model.singer.SingerVO" scope="request" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		function check(snum) {
		document.location.href = "control.jsp?action=edit&snum=" + snum;
				
	}
</script>
</head>
<body>


	<a href="control.jsp?action=main">메인으로 돌아가기</a>
	<hr>
	<br>
	<br>
	<h2>가수 추가하기</h2>
	<br>
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="insert">
		<table border="1">

			<tr>
				<td>가수 이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>가수 나이</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td>노래 제목</td>
				<td><input type="text" name="song"></td>
			</tr>

			<tr>
				<td colspan='2'><input type="submit" value="가수 추가하기"></td>
			</tr>
		</table>
	</form>

	<h2>가수 목록</h2>
	<hr>
	<br>
	<table border="1">
		<tr>
			<td>넘버</td>
			<td>가수 이름</td>
			<td>가수 나이</td>
			<td>대표곡</td>
		</tr>

		<c:forEach var="vo" items="${datas}">
				<tr>
					<td><a href="javascript:check(${vo.snum})">${vo.snum}</a></td>
					<td>${vo.name}</td>
					<td>${vo.age}</td>
					<td>${vo.song}</td>
				</tr>
			</c:forEach>
	
	</table>
	
	
</body>
</html>