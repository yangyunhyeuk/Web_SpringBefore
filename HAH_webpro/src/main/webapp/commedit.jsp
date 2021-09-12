<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="commdata" class="model.comment.FreeCoVO"
	scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function commdelete() {
		result = confirm("정말로 삭제하시겠습니까?");
		if (result == true) {
			document.form1.action.value = "commdelete";
			document.form1.submit();
		} else {
			return;
		}
	}
</script>
</head>
<body>
	<h3>여기는 댓글 수정 페이지</h3>
	<hr>

	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="commupdate"> <input
			type="hidden" name="cnum" value="${commdata.cnum}">
		<table border="1">


			<tr>
				<td>댓글 고유 번호</td>
				<td><input type="text" name="cnum" value="${commdata.cnum}"
					readonly></td>
			</tr>
			<tr>
				<td>댓글 내용</td>
				<td><input type="text" name="comm" value="${commdata.comm}"></td>
			</tr>
			<tr>
				<td>댓글 작성 일자</td>
				<td><input type="text" name="cdate" value="${commdata.cdate}"
					readonly></td>
			</tr>
			<tr>
				<td>게시글 번호</td>
				<td><input type="text" name="pnum" value="${commdata.pnum}"></td>
			</tr>
			<tr>
				<td>회원 닉네임</td>
				<td><input type="text" name="mname" value="${commdata.mname}"></td>
			</tr>
			<tr>
				<td>회원 아이디</td>
				<td><input type="text" name="mid" value="${commdata.mid}"></td>
			</tr>


			<tr>
				<td colspan='2'><input type="submit" value="내용 변경하기"> <input
					type="button" value="글 삭제하기" onClick="commdelete()"></td>
			</tr>
		</table>
	</form>
	
	
	
	
</body>
</html>