<%@ tag language="java" pageEncoding="UTF-8"
	import="java.util.ArrayList, model.message.*" body-content="empty"%>
<jsp:useBean id="list" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 
위 size는 로깅 작업
화면이 뜨자마자 초기화면 출력 
검색작업 시 검색결과 출력 
검색할 때 없는 값 검색 시 초기화면 출력 
-->
<c:choose>

	<c:when test="${empty list}">
		<h2>초기 화면</h2>
		<hr>
		<hr>
		<table border="1">
			<tr>
				<td>글 번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>내용</td>
			</tr>
			<c:forEach var="v" items="${datas}">
				<tr>
					<td>${v.mnum}</td>
					<td>${v.title}</td>
					<td>${v.writer}</td>
					<td>${v.content}</td>
				</tr>
			</c:forEach>

		</table>
	</c:when>


	<c:when test="${not empty list}">
		<h2>검색 결과</h2>
		<hr>
		<hr>
		<table border="1">
			<tr>
				<td>글 번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>내용</td>
			</tr>
			<c:forEach var="l" items="${list}">
				<tr>
					<td>${l.mnum}</td>
					<td>${l.title}</td>
					<td>${l.writer}</td>
					<td>${l.content}</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>

</c:choose>