<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="rid" required="true" %>
<%@ attribute name="uuid" required="true" %>
<%@ attribute name="mid" required="true" %>


<c:if test="${seUser eq uuid}">
	<button style="font-size: 1px;"
		onclick="location.href='control.jsp?action=rdelete&rid=${rid}&mcnt=${mcnt}&selUser=${selUser}&mid=${mid}'">삭제</button>
</c:if>