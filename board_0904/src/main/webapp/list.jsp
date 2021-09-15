<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, model.message.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<!-- action 내부에 request로 요청한 값을 다루기 위해 액션태그 사용 -->
<jsp:useBean id="memberVO" class="model.member.MemberVO" scope="session"></jsp:useBean>
<jsp:useBean id="list" class="java.util.ArrayList" scope="request" />
<!-- ★★★★★★★★★★★★★★주석 확인★★★★★★★★★★★★★★★★ -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* 로그인 후 본인이 작성한 게시글이 보이기 때문에 따로 보안절차 X
	 */
	function check(mnum) {
		mid = prompt("글 정보 변경을 위해 작성자를 입력하시오.");
		document.location.href = "control.jsp?action=edit&mnum=" + mnum
				+ "&mid=" + mid;
	} //if (vos.getMid().equals(vo.getWriter()))
</script>
</head>
<body>

<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	<div>
		<ul>
			<li><a href="index.jsp">로그인 화면으로 이동하기</a></li>
			<li><a href="control.jsp?action=list">게시판으로 이동하기</a></li>
			<li><a href="control.jsp?action=my">내가 쓴 글 보기</a></li>
		</ul>

	</div>

<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	<br>
	<br>
	<br>
	<hr>
	<form action="control.jsp" method="post">
		<input type="hidden" name="action" value="search"> <select
			name="condition">
			<option selected value="title">제목</option>
			<option value="writer">작성자</option>
		</select> <input type="text" name="content"> <input type="submit"
			value="검색하기">
	</form>



	<hr>
	<br>
	<h2>검색 게시글 목록</h2>
	<hr>

	<hr>
	<table border="1">
		<tr>
			<td>글 번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>내용</td>
		</tr>

		<%
		for (MessageVO vo : (ArrayList<MessageVO>) list) {
		%>
		<tr>
			<!-- "control.jsp?action=edit&mnum=vo.getMnum()" -->
			<td><%=vo.getMnum()%></td>
			<!-- 글 변경을 위한 비밀번호 등의 인증작업처리 필요! -->
			<td><%=vo.getTitle()%></td>
			<td><%=vo.getWriter()%></td>
			<td><%=vo.getContent()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<br>
	<br>
	<br>


<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	<h2>게시글 목록</h2>
	<hr>

	<hr>
	<table border="1">
		<tr>
			<td>글 번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>내용</td>
		</tr>

		<%
		for (MessageVO vo : (ArrayList<MessageVO>) datas) {
		%>
		<tr>
			<!-- "control.jsp?action=edit&mnum=vo.getMnum()" -->
			<td><a href="javascript:check(<%=vo.getMnum()%>)"><%=vo.getMnum()%></a></td>
			<!-- 글 변경을 위한 비밀번호 등의 인증작업처리 필요! -->
			<td><%=vo.getTitle()%></td>
			<td><%=vo.getWriter()%></td>
			<td><%=vo.getContent()%></td>
		</tr>
		<%
		}
		%>
	</table>

	<br>
	<br>

	<a href="form.jsp">글 작성하러가기</a>
	<br>
	<br>

	<br>
	<br>
	<hr>
	<a href="index.jsp">메인으로 이동</a>









<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<%
							if (request.getAttribute("mem") != null) {
								//messageDAO.getDBList();
							%>
							<a href="form.jsp">글 등록</a> <br> <br>
							<h2 class="major">
								<span><%=memberVO.getMid()%>님의 게시글</span>
							</h2>

							<table border="1">
								<tr>
									<td>글 번호</td>
									<td>제목</td>
									<td>작성자</td>
									<td>내용</td>
								</tr>


								<%
								for (MessageVO vo : (ArrayList<MessageVO>) datas) {
									if (memberVO.getMid().equals(vo.getWriter())) {
								%>


								<tr>
									<td><a href="javascript:check(<%=vo.getMnum()%>)"><%=vo.getMnum()%></a></td>
									<td><%=vo.getTitle()%></td>
									<td><%=vo.getWriter()%></td>
									<td><%=vo.getContent()%></td>
								</tr>
								<%
								}
								}
								%>
							</table>
							<%
							} else {
							%>

							<p>작성된 게시글이 없습니다.</p>
							<%
							}
							%>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->




















</body>
</html>