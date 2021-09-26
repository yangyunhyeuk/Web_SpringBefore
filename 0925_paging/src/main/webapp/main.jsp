<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yh_게시판</title>
<script type="text/javascript">
	function PageMove(page) {
		location.href = "main.do?page=" + page;
	}
</script>
<link rel="stylesheet" href="assets/css/main.css">
<script src="assets/js/jquery-3.6.0.min.js"></script>
</head>
<body>



	<div align="center" class="hh">
		<mytag:logo />
	</div>
	<br>
	<br>
	<br>
	<div class="content" align="center">

		<h6>페이지네이션</h6>
		<br> <br>
		<table border="1px">
			<tr>
				<td>작성자</td>
				<td>댓글내용</td>
				<td>좋아요</td>
				<td>대댓글</td>
				<td>날짜</td>
			</tr>
			<c:forEach var="m" items="${list}">
				<tr>
					<td>${m.uuid}</td>
					<td>${m.msg}</td>
					<td>${m.favcount}</td>
					<td>${m.replycount}</td>
					<td>${m.udate}</td>
				</tr>
			</c:forEach>
		</table>


		<br> <br> <br> <br>
		<div class="toolbar-bottom">
			<div class="toolbar mt-lg">
				<div class="sorter">
					<a href="javascript:PageMove(${paging.firstPageNo})">맨앞으로</a> <a
						href="javascript:PageMove(${paging.prevPageNo})">앞으로</a>

					<c:forEach var="i" begin="${paging.startPageNo}"
						end="${paging.endPageNo}" step="1">
						<c:choose>
							<c:when test="${i eq paging.pageNo}">
								<a href="javascript:PageMove(${i})">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="javascript:PageMove(${i})">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<a href="javascript:PageMove(${paging.nextPageNo})">뒤로</a> <a
						href="javascript:PageMove(${paging.finalPageNo})">맨뒤로</a>

				</div>
			</div>
		</div>

	</div>
	<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->




	<footer>
		<address>Copyright © 2021 koreaIT_All rights reserved
			Contact me</address>
	</footer>


</body>
</html>