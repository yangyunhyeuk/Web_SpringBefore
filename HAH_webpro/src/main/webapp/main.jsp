<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function PageMove(page) {
		location.href = "main.do?page=" + page;
	}
</script>
</head>
<body>

	<br>
	<br>
	<div class="content" align="center">

		<h6>페이지네이션</h6>
		<br> <br>
		<table border="1px">
			<tr>
				<td>pnum</td>
				<td>ptitle</td>
				<td>pcontent</td>
				<td>pdate</td>
				<td>mname</td>
				<td>mid</td>
				<td>cnt</td>
				<td>category</td>
			</tr>
			<c:forEach var="m" items="${list}">
				<tr>
					<td>${m.pnum}</td>
					<td>${m.ptitle}</td>
					<td>${m.pcontent}</td>
					<td>${m.pdate}</td>
					<td>${m.mname}</td>
					<td>${m.mid}</td>
					<td>${m.cnt}</td>
					<td>${m.category}</td>
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


</body>
</html>