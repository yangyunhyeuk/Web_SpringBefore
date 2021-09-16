<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="mcnt" required="true"%><!-- required 속성, 필수 attribute 명시 -->


<form action="control.jsp" method="post">
	<input type="hidden" name="mcnt" value="${mcnt}"> 
	<input type="hidden" name="action" value="login"> 
	<input type="text" name="uuid"> 
	<br>
	<input type="password" name="passwd"> 
	<br>
	<input type="submit" value="로그인">
</form>