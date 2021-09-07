<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<h3>홀짝 판독기</h3>
	<form>
		<input type="number" name="num"> <input type="submit"
			value="숫자 입력">
	</form>
	[${param.num}]을 입력했습니다.

	<!-- jstl 코어 태그 choose, when -->

	<c:if test="${param.num%2 == 0}">
	짝수입니다
	</c:if>
	<c:if test="${param.num%2 == 1}">
	홀수입니다
	</c:if>


	<!-- 배열리스트 값 저장 -->
	<%
	ArrayList<String> korea = new ArrayList<String>();
	korea.add("seoul");
	korea.add("busan");
	korea.add("suwon");
	//request.setAttribute("city", korea); // 요청 단위
	pageContext.setAttribute("city", korea); //페이지 단위
	%>

	<h3>한국의 도시</h3>

	<!-- jstl 코어 태그 forEach 출력 -->
	<c:forEach var="my" items="${city}">
		<li>${my}</li>
	</c:forEach>






</body>
</html>