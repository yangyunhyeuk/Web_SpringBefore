<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	padding: 5px;
	margin: 5px;
}

ul {
	width: 900px;
	border: 3px solid #ccc;
	border-radius: 8px;
	margin: 10px 0 0 10px;
	list-style: none;
}

ul li {
	padding: 10px 0 0 10px;
	border-top: 1px dotted #ccc;
	margin-bottom: 10px;
}

ul li:first-child {
	border: 0 none;
}

ul li a {
	height: 20px;
	line-height: 20px;
	display: block;
	text-decoration: none;
	color: #000;
}

ul li div {
	color: coral;
}
</style>
<script src="assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("p").hide();
		// $("ul > li:first-child a").next().show();
		$("ul li a").click(function() {
			$(this).next().slideToggle(300);
			// $(this).next().slideDown(300);
			$("ul li a").not(this).next().slideUp(300);
			return false;
		});
		$("ul li a").eq(0).trigger("click");
	});
	function del() {

	}
</script>
</head>
<body>



	<c:choose>
		<c:when test="${empty selUser}">

			<li><a href="control.jsp?action=main">전체목록보기</a></li>
			<li><a
				href="control.jsp?action=main&mcnt=${mcnt+1}&selUser=${selUser}">더보기&gt;&gt;</a></li>
			<!-- ${mcnt+1}의 의미는 몇개를 더보겠냐는 의미이다. +10으로 하면 10개 더 보기의 의미이다. -->

			<!-- 페이지가 바뀌어도 열려있는 목록이 유지되게 하려면 세션 단위로 코딩한다. -->
			<!-- 페이지가 바뀌면 열려있는 목록이 유지되지 않게 하려면 a태그를 통해 액션을 컨트롤하여 코딩한다. -->
			<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

		</c:when>
		<c:otherwise>
			<li><a href="control.jsp?action=main">전체목록보기</a></li>
			<li><a
				href="control.jsp?action=main&mcnt=${mcnt+1}&selUser=${selUser}">더보기&gt;&gt;</a></li>
		</c:otherwise>
	</c:choose>








	<c:choose>
		<c:when test="${not empty selUser}">
			<form action="control.jsp" method="post" name="form2">
				<input type="hidden" name="action" value="minsert"> <input
					type="hidden" name="uuid" value="${selUser}">
				<table border="1">
					<tr>
						<td><input type="text" name="msg" placeholder="댓글 입력"></td>

					</tr>
					<tr>
						<td><input type="submit" value="댓글 작성하기"></td>
					</tr>
				</table>
			</form>

		</c:when>
	</c:choose>

	<!--회원아이디, 메시지내용  uuid, msg, -->




	<!-- ///////////////////////////////////////////////////////////////////////// -->
	<h2>전체목록</h2>
	<ul>
		<li><c:forEach var="v" items="${datas}">

				<c:set var="m" value="${v.m}" />
				<a href="#">

					<h3>
						[작성자 : ${m.uuid}] [댓글 내용 : ${m.msg}] &gt;&gt; [좋아요 ${m.favcount} |
						대댓글 ${m.replycount} | ${m.udate}]
						<button
							onclick="location.href='control.jsp?action=mdelete&mid=${m.mid}&mcnt=${mcnt}'">삭제</button>
					</h3>
				</a>

				<div>
					<ol>
						<c:forEach var="r" items="${v.rlist}">
							<li>${r.uuid}>>${r.rmsg}[${r.udate}]</li>
						</c:forEach>
					</ol>
					<h2>대댓글 작성하기</h2>
					<br>
					<form action="control.jsp" method="post" name="form1">
						<input type="hidden" name="action" value="rinsert"> <input
							type="hidden" name="mcnt" value="${mcnt}"> <input
							type="hidden" name="mid" value="${m.mid}"> <input
							type="hidden" name="uuid" value="${m.uuid}">


						<!-- mid,uuid,rmsg -->
						<table border="1">
							<tr>
								<td>대댓글</td>
								<td><input type="text" name="rmsg"></td>
							</tr>

							<tr>
								<td colspan='2'><input type="submit" value="작성하기"></td>
							</tr>
						</table>

					</form>
				</div>

			</c:forEach></li>
	</ul>

	<!-- ///////////////////////////////////////////////////////////////////////// -->


	<a href="insertUser.jsp">회원가입</a>
	<br>
	<br>
	<form action="control.jsp" method="post">
		<c:choose>
			<c:when test="${empty seUser}">
				<input type="hidden" name="mcnt" value="${mcnt}">
				<input type="hidden" name="action" value="login">
				<input type="text" name="uuid">
				<input type="password" name="passwd">
				<input type="submit" value="로그인">
			</c:when>

			<c:otherwise>
      ${seUser}님, 환영합니다!
      <input type="hidden" name="action" value="logout">
				<input type="submit" value="로그아웃">
				<br>
				<br>

				<a href="control.jsp?action=main&selUser=${seUser}">내 글 목록보기</a>
				<!-- 58번째줄과 데이터는 똑같으나 띄어쓰기나 특수기호를 허용하지 않는다. -->

			</c:otherwise>
		</c:choose>
	</form>






</body>
</html>