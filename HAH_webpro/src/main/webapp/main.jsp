<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="commdatas" class="java.util.ArrayList" scope="request" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


//회원 mid 클릭 시 액션값 부여///////////////////////////////////////////////////////////////////////////////////
	function check(mid) {
		document.location.href = "control.jsp?action=edit&mid=" + mid;

	}
/////////////////////////////////////////////////////////////////////////////////////



//댓글 cnum 클릭 시 액션값 부여///////////////////////////////////////////////////////////////////////////////////
	function commcheck(cnum) {
		document.location.href = "control.jsp?action=commedit&cnum=" + cnum;

	}
/////////////////////////////////////////////////////////////////////////////////////


</script>
</head>
<body>



	<!--======================================================================================================================================================== -->
	<h2>댓글 작성하기</h2>
	<br>

	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="comminsert">
		<table border="1">


			<tr>
				<td>댓글 내용</td>
				<td><input type="text" name="comm"></td>
			</tr>

			<tr>
				<td>게시글 번호</td>
				<td><input type="text" name="pnum"></td>
			</tr>
			<tr>
				<td>회원 닉네임</td>
				<td><input type="text" name="mname"></td>
			</tr>
			<tr>
				<td>회원 아이디</td>
				<td><input type="text" name="mid"></td>
			</tr>

			<tr>
				<td colspan='2'><input type="submit" value="댓글 작성하기"></td>
			</tr>
		</table>
	</form>
	<!-- ======================================================================================================================================================= -->






	<!-- ======================================================================================================================================================= -->
	<br>
	<br>
	<hr>
	<h2>자유게시판 댓글 모음</h2>
	<hr>
	<br>
	<table border="1">
		<tr>
			<td>댓글 고유 번호</td>
			<td>댓글 내용</td>
			<td>댓글 작성 일자</td>
			<td>게시글 번호</td>
			<td>회원 닉네임</td>
			<td>회원 아이디</td>
		</tr>

		<c:forEach var="cvo" items="${commdatas}">
			<tr>
				<td><a href="javascript:commcheck('${cvo.cnum}')">${cvo.cnum}</a></td>
				<td>${cvo.comm}</td>
				<td>${cvo.cdate}</td>
				<td>${cvo.pnum}</td>
				<td>${cvo.mname}</td>
				<td>${cvo.mid}</td>
			</tr>
		</c:forEach>

	</table>
	<br>
	<br>
	<br>
	<!-- ======================================================================================================================================================= -->







	<!-- ======================================================================================================================================================= -->
	<hr>
	<h2>회원 목록</h2>
	<hr>
	<br>
	<table border="1">
		<tr>
			<td>회원 아이디</td>
			<td>회원 비밀번호</td>
			<td>회원 닉네임</td>
			<td>회원 이메일</td>
			<td>사용자/관리자</td>
		</tr>

		<c:forEach var="vo" items="${datas}">
			<tr>
				<td><a href="javascript:check('${vo.mid}')">${vo.mid}</a></td>
				<td>${vo.mpw}</td>
				<td>${vo.mname}</td>
				<td>${vo.memail}</td>
				<td>${vo.role}</td>
			</tr>
		</c:forEach>

	</table>
	<hr>
	<hr>
	<br>
	<!-- ======================================================================================================================================================= -->





	<!-- ======================================================================================================================================================= -->
	<br>
	<h2>회원 추가하기</h2>
	<br>
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="insert">
		<table border="1">
			<tr>
				<td>회원 아이디</td>
				<td><input type="text" name="mid"></td>
			</tr>
			<tr>
				<td>회원 비밀번호</td>
				<td><input type="text" name="mpw"></td>
			</tr>
			<tr>
				<td>회원 닉네임</td>
				<td><input type="text" name="mname"></td>
			</tr>
			<tr>
				<td>회원 이메일</td>
				<td><input type="text" name="memail"></td>
			</tr>
			<tr>
				<td>사용자/관리자</td>
				<td><input type="text" name="role"></td>
			</tr>

			<tr>
				<td colspan='2'><input type="submit" value="회원 추가하기"></td>
			</tr>
		</table>
	</form>
	<!-- ======================================================================================================================================================= -->
</body>
</html>