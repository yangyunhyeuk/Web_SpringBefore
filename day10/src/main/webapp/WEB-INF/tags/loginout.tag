<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${sessionScope.mem eq null}">
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="login">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mid"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="mpw"></td>
			</tr>
			<tr>
				<td colspan='2'><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
</c:if>

<c:if test="${sessionScope.mem ne null}">
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="logout"> <input
			type="submit" value="로그아웃">
	</form>
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="MyPage"><input
			type="submit" value="마이페이지">
	</form>
	<br>
</c:if>