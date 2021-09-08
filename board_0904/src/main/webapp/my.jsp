<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,model.protein.*, model.member.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<%
MemberVO vos = (MemberVO) session.getAttribute("mem");//네임을 인자로!
//vos.getMid();
//vos.getMpw();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





	<a href="control.jsp?action=list">메인으로 이동</a>
	<br>
	<br>
	<%
	if (session.getAttribute("mem") != null) {
		//messageDAO.getDBList();
	%>
	<a href="form.jsp">글 등록</a>
	<br>
	<br>
	<h2 class="major">
		<span><%=vos.getMid()%>님의 게시글</span>
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
			if (vos.getMid().equals(vo.getMid())) {
		%>


		<tr>
			<td><a href="javascript:check(<%=vo.getMnum()%>)"><%=vo.getMnum()%></a></td>
			<td><%=vo.getMid()%></td>
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



</body>
</html>