<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="menu">
		<br>
		<c:choose>
			<c:when test="${empty seUser}">
				<mytag:login mcnt="${mcnt}" />
			</c:when>
			<c:otherwise>
				<form method="post" action="control.jsp">
					<input type="hidden" name="action" value="minsert"> <input
						type="hidden" name="uuid" value="${seUser}">
					<mytag:insertmsg type="msg" />
					<input type="hidden" name="mcnt" value="${mcnt}"> <input
						type="hidden" name="selUser" value="${selUser}">
				</form>
				<br>
				<a href="control.jsp?action=main&selUser=${seUser}">${seUser}님,
					환영합니다. <br>내 글 목록보기<br>
				</a>
				<br>
				<mytag:logout />
			</c:otherwise>
		</c:choose>
		<a class="head" href="#" id="signup"
			style="background-color: beige; border: 1px solid coral">회원가입</a> <br>
		<br> <br> <br>


		<table style="text-align: center;" align="left" border="1"
			cellspacing="0" cellpadding="0" bordercolor="#BA0A0A"
			text-align="center">
			<th colspan="2">신규회원 목록</th>
			<c:forEach var="v" items="${newUsers}">
				<tr>
					<td><a href="control.jsp?action=main&selUser=${v.uuid}">${v.uuid}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->







	<div class="content" align="center">

		<!-- ////////////메인 로고///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<br>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->




		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<a href="control.jsp?action=main&mcnt=${mcnt+1}&selUser=${selUser}">더보기&gt;&gt;</a>
		<br>

		<h2>전체목록</h2>

		<ul>
			<li><c:forEach var="v" items="${datas}">
					<c:set var="m" value="${v.m}" />
					<a href="#">
						<h3>
							[작성자 : ${m.uuid}] [댓글 내용 : ${m.msg}] &gt;&gt; [좋아요 :
							${m.favcount} | 대댓글 ${m.replycount} | ${m.udate}]
							<!-- seUser와 m.uuid가 일치하는 경우의 조건에서 삭제버튼 뜨기 -->
							<button style="font-size: 1px;"
								onclick="location.href='control.jsp?action=haction&mid=${m.mid}&mcnt=${mcnt}&selUser=${selUser}'">&#x1f497</button>

							<mytag:mdelete mid="${m.mid}" uuid="${m.uuid}" />

						</h3>
					</a>
					<c:choose>
						<c:when test="${empty v.rlist}">
							<ol>

								<h4>작성된 대댓글이 없습니다.</h4>
								<form action="control.jsp" method="post" name="form1">
									<input type="hidden" name="action" value="rinsert"> <input
										type="hidden" name="mcnt" value="${mcnt}"> <input
										type="hidden" name="mid" value="${m.mid}">
									<mytag:insertmsg type="rmsg" />
									<input type="hidden" name="uuid" value="${seUser}"> <input
										type="hidden" name="selUser" value="${selUser}">
								</form>
								<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

							</ol>
						</c:when>

						<c:when test="${not empty v.rlist}">
							<ol>

								<c:forEach var="r" items="${v.rlist}">
									<li>${r.uuid}>>${r.rmsg}[${r.udate}]</li>


									<mytag:rdelete mid="${m.mid}" uuid="${r.uuid}" rid="${r.rid}" />

								</c:forEach>
								<form action="control.jsp" method="post" name="form1">
									<input type="hidden" name="action" value="rinsert"> <input
										type="hidden" name="mcnt" value="${mcnt}"> <input
										type="hidden" name="mid" value="${m.mid}">
									<mytag:insertmsg type="rmsg" />
									<input type="hidden" name="uuid" value="${seUser}"> <input
										type="hidden" name="selUser" value="${selUser}">
								</form>

							</ol>
						</c:when>
					</c:choose>
				</c:forEach></li>
		</ul>

	</div>


	<div class="ad">
		<!-- ////////////////광고글//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<ol>
			<li><a
				href="https://www.dabangapp.com/?gclid=Cj0KCQjws4aKBhDPARIsAIWH0JVWaGnuXLgfGuGKgnfXm8CarBIpHGbkUAd6z88CfdOrjtW9cIv8dhcaAv4-EALw_wcB"><img
					src="assets/css/img/ad1.png" border="1px" width="250px"
					height="150px" alt="광고_다방"></a></li>
			<li><a href="https://www.cgv.co.kr/"><img
					src="assets/css/img/ad2.png" border="1px" width="250px"
					height="150px" alt="광고_이터널즈"></a></li>
			<li><a href="https://www.burgerking.co.kr/#/home"><img
					src="assets/css/img/ad3.png" border="1px" width="250px"
					height="150px" alt="광고_킹거킹"></a></li>
		</ol>
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<footer>
		<address>Copyright © 2021 koreaIT_All rights reserved
			Contact me</address>
	</footer>
	<script src="assets/script/main.js"></script>
	<script src="assets/script/newWindow.js"></script>

</body>
</html>