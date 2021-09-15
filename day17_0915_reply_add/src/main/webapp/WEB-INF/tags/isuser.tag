<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${seUser == null}">
	<form action="control.jsp" method="post">
		<h4>로그인 후 댓글, 대댓글 작성이 가능합니다.</h4>

		<input type="hidden" name="mcnt" value="${mcnt}"> <input
			type="hidden" name="action" value="login"> <input type="text"
			name="uuid"> <input type="password" name="passwd"> <input
			type="submit" value="로그인">
	</form>
</c:if>