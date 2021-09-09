<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(bnum) {
		document.location.href = "control.jsp?action=my&bnum=" + bnum;

	}
</script>
</head>
<body>
	<h4>어서오세요 **은행입니다</h4>


	<br>
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="my">
		<table border="1">
			<c:forEach var="vo" items="${datas}">
				<tr>
					<td>회원 번호</td>
					<td><a href="javascript:check(${vo.bnum})">${vo.bnum}</a></td>
				</tr>
				<tr>
					<td>성함</td>
					<td>${vo.bname}</td>
				</tr>
				<tr>
					<td>잔고</td>
					<td>${vo.money}</td>
				</tr>
				<br>
				<br>
			</c:forEach>
		</table>
	</form>




</body>
</html>