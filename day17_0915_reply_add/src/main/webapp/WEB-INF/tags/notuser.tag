<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${seUser != null}">
	<form action="control.jsp" method="post" name="form2">
		<input type="hidden" name="action" value="minsert"> <input
			type="hidden" name="uuid" value="${seUser}"> <input
			type="hidden" name="mcnt" value="${mcnt}">
		<table border="1">
			<tr>
				<td><input type="text" name="msg" placeholder="댓글 입력"></td>

			</tr>
			<tr>
				<td><input type="submit" value="댓글 작성하기"></td>
			</tr>
		</table>
	</form>
			
			
      ${seUser}님, 환영합니다!	
			<form action="control.jsp" method="post" name="form3">
		<input type="hidden" name="action" value="logout"> <input
			type="submit" value="로그아웃"> <br> <br> <a
			href="control.jsp?action=main&selUser=${seUser}">내 글 목록보기</a>
		<!-- 58번째줄과 데이터는 똑같으나 띄어쓰기나 특수기호를 허용하지 않는다. -->

	</form>
</c:if>
