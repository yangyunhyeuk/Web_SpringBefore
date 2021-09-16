<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="type" required="true"%><!-- required 속성, 필수 attribute 명시 -->

<c:choose>
	<c:when test="${type=='msg'}">
		<c:if test="${seUser != null}">
			<input type="text" name="msg">
			<input type="submit" value="댓글 추가">
		</c:if>
		<c:if test="${seUser == null}">
			<input type="text"  size="25" disabled value="로그인 후 작성가능합니다.">
		</c:if>
	</c:when>
	
	
	<c:when test="${type=='rmsg'}">
		<c:if test="${seUser != null}">
			<table border="1">
				<tr>
					<td>대댓글</td>
					<td><input type="text" name="rmsg"></td>
				</tr>

				<tr>
					<td colspan='2'><input type="submit" value="작성하기"></td>
				</tr>
			</table>
		</c:if>
		<c:if test="${seUser == null}">
			<input type="text" size="25" disabled value="로그인 후 작성가능합니다.">
		</c:if>
	</c:when>
</c:choose>