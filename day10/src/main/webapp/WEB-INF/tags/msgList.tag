<%@ tag language="java" pageEncoding="UTF-8"
	import="java.util.ArrayList, model.message.*" body-content="empty"%>
<jsp:useBean id="list" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />

<%
if (list.isEmpty()) {
%>
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
<%
}

else {
%>

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
<%
}
%>