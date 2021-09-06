<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memVO" class="model.member.MemberVO" scope="session" />
<jsp:useBean id="data" class="model.member.MemberVO" scope="request" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del() { // del 확인 작업
		result = confirm("정말로 삭제하시겠습니까?");
		if (result == true) {
			document.form1.action.value = "delete";
			document.form1.submit();
		} else {
			return;
		}
	}
</script>
</head>
<body>

	<h1>여기는 마이페이지</h1>

	<a href="control.jsp?action=main">메인으로 돌아가기</a>
	<hr>
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="update">
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td><input type="text" name="mnum" value="<%=data.getMnum()%>"
					readonly></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mid" value="<%=data.getMid()%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="mpw" value="<%=data.getMpw()%>"></td>
			</tr>



			<tr>
				<td colspan='2'><input type="submit" value="정보 변경하기"> <input
					type="button" value="회원 탈퇴하기" onClick="del()"></td>
				<!-- 클릭 이벤트 -->
			</tr>
		</table>
	</form>

</body>
</html>