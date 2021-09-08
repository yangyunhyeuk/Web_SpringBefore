<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList,"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="list" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="memVO" class="model.member.MemberVO" scope="session" />
<%@ taglib tagdir="/WEB-INF/tags" prefix="msgtag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="control.jsp?action=mShow">회원 보러가기</a>
	<!-- 로그인, 로그아웃/////////////////////////////////////////////////////// -->
	<msgtag:loginout />

	<hr>
	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value="search"> <select
			name="condition">
			<option selected value="title">제목</option>
			<option value="writer">작성자</option>
		</select> <input type="text" name="content"> <input type="submit"
			value="검색하기">
	</form>
	<br>



	<!-- 전체 게시글, 검색 게시글/////////////////////////////////////////////////////// -->
	<msgtag:msgList />



</body>
</html>