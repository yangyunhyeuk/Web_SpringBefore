<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- url을 통해 값을 전송한다. -->
<c:url value="NewFile3.jsp" var="testURL">
	<c:param name="test">Z</c:param>
</c:url>


<a href="${testURL}">눌러보세요!</a>

</body>
</html>