<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="model.bank.BankVO" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>



	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="update">
		<table border="1">

			<tr>
				<td>회원 번호</td>
				<td><input type="text" name="bnum" readonly
					value="${data.bnum}"></td>
			</tr>
			<tr>
				<td>성함</td>
				<td><input type="text" name="bname" readonly
					value="${data.bname}"></td>
			</tr>
			<tr>
				<td>잔고</td>
				<td><input type="text" name="money" readonly
					value="${data.money}"></td>
			</tr>
			<tr>
				<td>송금할 금액</td>
				<td><input type="text" name="change" placeholder="송금할 금액"></td>
			</tr>



			<tr>
				<td colspan='2'><input type="submit" value="송금하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>