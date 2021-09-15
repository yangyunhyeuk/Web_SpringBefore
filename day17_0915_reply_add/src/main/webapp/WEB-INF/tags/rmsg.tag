<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name = "seUser" required = "true" %>
<%@ attribute name = "mcnt" required = "true" %>

<c:if test="${not empty seUser}">
	<h2>대댓글 작성하기</h2>
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="rinsert"> <input
			type="hidden" name="mcnt" value="${mcnt}"> <input
			type="hidden" name="mid" value="${m.mid}"> <input
			type="hidden" name="uuid" value="${seUser}">




		<!-- mid,uuid,rmsg -->
		<table border="1">
			<tr>
				<td>대댓글</td>
				<td><input type="text" name="rmsg"></td>
			</tr>

			<tr>
				<td colspan='2'><input type="submit" value="작성하기"></td>
			</tr>
		</table>

	</form>
</c:if>