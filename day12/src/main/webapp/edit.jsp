<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="data" class="model.singer.SingerVO" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function del(){
	result=confirm("정말로 삭제하시겠습니까?");
	if(result==true){
		document.form1.action.value="delete";
		document.form1.submit();
	}
	else{
		return;
	}
}
</script>
</head>
<body>

	<h3>여기는 수정 페이지</h3>




	<a href="control.jsp?action=main">메인으로 돌아가기</a>
	<hr>
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="update"> <input
			type="hidden" name="snum" value="${data.snum}">
		<table border="1">
			<tr>
				<td>가수 이름</td>
				<td><input type="text" name="name"
					value="${data.name}"></td>
			</tr>
			<tr>
				<td>가수 나이</td>
				<td><input type="text" name="age"
					value="${data.age}"></td>
			</tr>
			<tr>
				<td>노래 제목</td>
				<td><input type="text" name="song"
					value="${data.song}"></td>
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