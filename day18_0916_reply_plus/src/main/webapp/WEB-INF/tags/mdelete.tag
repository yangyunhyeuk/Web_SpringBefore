<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="mid" required="true" %>
<%@ attribute name="uuid" required="true" %>

<c:if test="${seUser eq uuid}">
	<button style="font-size: 1px;"
		onclick="location.href='control.jsp?action=mdelete&mid=${mid}&mcnt=${mcnt}&selUser=${selUser}'">삭제</button>
</c:if>