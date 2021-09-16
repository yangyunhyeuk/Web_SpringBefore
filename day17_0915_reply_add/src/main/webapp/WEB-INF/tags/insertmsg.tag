<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="uuid" required="true"%><!-- required 속성, 필수 attribute 명시 -->
<%@ attribute name="selUser" required="true"%><!-- required 속성, 필수 attribute 명시 -->
<%@ attribute name="mcnt" required="true"%><!-- required 속성, 필수 attribute 명시 -->

<form action="control.jsp" method="post" name="form2">
	<input type="hidden" name="action" value="minsert"> <input
		type="hidden" name="uuid" value="${seUser}"> <input
		type="hidden" name="selUser" value="${seUser}"> <input
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