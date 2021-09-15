<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name = "rid" required = "true" %>
<%@ attribute name = "mcnt" required = "true" %>
<c:if test="${v.rlist != null}">
	<ol>
		<c:forEach var="r" items="${v.rlist}">
			<li>${r.uuid}>>${r.rmsg}[${r.udate}]</li>
			<c:if test="${seUser eq r.uuid}">
				<button style="font-size: 1px;"
					onclick="location.href='control.jsp?action=rdelete&rid=${r.rid}&mcnt=${mcnt}'">삭제</button>
			</c:if>
		</c:forEach>
	</ol>
</c:if>