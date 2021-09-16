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






	<!-- ///////////////가입회원 명시/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<c:forEach var="v" items="${newUsers}">
		<a href="control.jsp?action=main&selUser=${v.uuid}">[가입 회원
			:${v.uuid}]</a>
		<br>
	</c:forEach>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->






	<div>

		<div class="content" align="center">

			<!-- ////////////메인 로고///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<br>
			<mytag:logo />
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

								<mytag:mdelete mid="${m.mid}" uuid="${m.uuid}"></mytag:mdelete>


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
										<mytag:insertmsg type="rmsg"/>
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


										<mytag:rdelete mid="${m.mid}" uuid="${r.uuid}" rid="${r.rid}"></mytag:rdelete>

									</c:forEach>
									<form action="control.jsp" method="post" name="form1">
										<input type="hidden" name="action" value="rinsert"> <input
											type="hidden" name="mcnt" value="${mcnt}"> <input
											type="hidden" name="mid" value="${m.mid}">
										<mytag:insertmsg type="rmsg"></mytag:insertmsg>
										<input type="hidden" name="uuid" value="${seUser}"> <input
											type="hidden" name="selUser" value="${selUser}">
									</form>
								</ol>
							</c:when>
						</c:choose>
					</c:forEach></li>
			</ul>

			<!-- /////////////회원가입 진행//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<a class="head" href="#" id="signup">회원가입</a>
			<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<c:choose>
				<c:when test="${empty seUser}">
					<h4>로그인 후 댓글, 대댓글 작성이 가능합니다.</h4>
					<mytag:login mcnt="${mcnt}" />
				</c:when>
				<c:otherwise>
					<form method="post" action="control.jsp">
						<input type="hidden" name="action" value="minsert"> <input
							type="hidden" name="uuid" value="${seUser}">
						<mytag:insertmsg type="msg"></mytag:insertmsg>
						<input type="hidden" name="mcnt" value="${mcnt}"> <input
							type="hidden" name="selUser" value="${selUser}">
					</form>
			 ${seUser}님, 환영합니다!	
				<mytag:logout />
					<a href="control.jsp?action=main&selUser=${seUser}">내 글 목록보기</a>
				</c:otherwise>
			</c:choose>
			<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
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
	</div>
	<script src="assets/script/main.js"></script>
	<script src="assets/script/newWindow.js"></script>

</body>
</html>