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
	<c:choose>
		<c:when test="${empty selUser}">
			<ol>
				<li><a href="control.jsp?action=main">전체목록보기</a></li>
				<li><a
					href="control.jsp?action=main&mcnt=${mcnt+1}&selUser=${selUser}">더보기&gt;&gt;</a></li>
			</ol>

			<hr>

			<h2>전체목록</h2>
			<c:forEach var="v" items="${datas}">
				<c:set var="m" value="${v.m}" />
				<h3>[${m.uuid}] ${m.msg} &gt;&gt; [좋아요 ${m.favcount} | 댓글
					${m.replycount} | ${m.udate}]</h3>
				<ol>
					<c:forEach var="r" items="${v.rlist}">
						<li>${r.uuid}>>${r.rmsg}[${r.udate}]</li>
					</c:forEach>
				</ol>
			</c:forEach>

			<hr>


			<hr>
		</c:when>
	</c:choose>


	<a href="insertUser.jsp">회원가입</a>
	<br>
	<br>
	<form action="control.jsp" method="post">
		<c:choose>
			<c:when test="${empty selUser}">
				<input type="hidden" name="action" value="login">
				<input type="text" name="uuid">
				<input type="password" name="passwd">
				<input type="submit" value="로그인">
			</c:when>

			<c:otherwise>
      ${selUser.uuid}님, 환영합니다!
      <input type="hidden" name="action" value="logout">
				<input type="submit" value="로그아웃">
				<br>
				<br>
				<a href="control.jsp?action=main&selUser=${selUser.uuid}">내 글 목록보기</a>
			</c:otherwise>
		</c:choose>
	</form>

</body>
</html>