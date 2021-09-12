<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<jsp:useBean id="data" class="model.member.MemVO" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del() {
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
	<h3>여기는 회원 수정 페이지</h3>
	<hr>

	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="update"> <input
			type="hidden" name="snum" value="${data.mid}">
		<table border="1">
			<tr>
				<td>회원 아이디</td>
				<td><input type="text" name="mid" value="${data.mid}" readonly></td>
			</tr>
			<tr>
				<td>회원 비밀번호</td>
				<td><input type="text" name="mpw" value="${data.mpw}"></td>
			</tr>
			<tr>
				<td>회원 닉네임</td>
				<td><input type="text" name="mname" value="${data.mname}"></td>
			</tr>
			<tr>
				<td>회원 이메일</td>
				<td><input type="text" name="memail" value="${data.memail}"></td>
			</tr>
			<tr>
				<td>사용자/관리자</td>
				<td><input type="text" name="role" value="${data.role}"></td>
			</tr>

			<tr>
				<td colspan='2'><input type="submit" value="내용 변경하기"> <input
					type="button" value="글 삭제하기" onClick="del()"></td>
			</tr>
		</table>
	</form>
</body>
</html>