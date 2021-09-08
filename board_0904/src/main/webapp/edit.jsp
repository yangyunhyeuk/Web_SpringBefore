<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="model.protein.MessageVO" scope="request" />
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



	<a href="control.jsp?action=list">메인으로 돌아가기</a>
	<hr>
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="update"> <input
			type="hidden" name="mnum" value="<%=data.getMnum()%>">
		<table border="1">
			<tr>
				<td>작성 ID</td>
				<td><input type="text" name="mid"
					value="<%=data.getMid()%>" readonly></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="writer"
					value="<%=data.getWriter()%>"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"
					value="<%=data.getTitle()%>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="content"
					value="<%=data.getContent()%>"></td>
			</tr>

			<tr>
				<td colspan='2'><input type="submit" value="내용 변경하기"> <input
					type="button" value="글 삭제하기" onClick="del()"></td>
				<!-- 클릭 이벤트 -->
			</tr>
		</table>
	</form>






</body>
</html>