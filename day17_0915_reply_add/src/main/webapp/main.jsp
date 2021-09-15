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


	<div id="wrapper">

		<c:forEach var="v" items="${newUsers}">
			<a href="control.jsp?action=main&selUser=${v.uuid}">[가입 회원
				:${v.uuid}]</a>
			<br>
		</c:forEach>


		<aside id="asideRight" class="asideRight">
			<div id="chaseRight">

				<div class="sidebar-1">
					<a
						href="https://www.dabangapp.com/?gclid=Cj0KCQjws4aKBhDPARIsAIWH0JVWaGnuXLgfGuGKgnfXm8CarBIpHGbkUAd6z88CfdOrjtW9cIv8dhcaAv4-EALw_wcB"><img
						src="assets/css/img/ad1.png" border="1px" width="250px"
						height="150px" alt="다방"></a>
				</div>

				<div class="sidebar-2">
					<a href="https://www.cgv.co.kr/"><img
						src="assets/css/img/ad2.png" border="1px" width="250px"
						height="150px" alt="마동석"></a>
				</div>

				<div class="sidebar-3">
					<a href="https://www.burgerking.co.kr/#/home"><img
						src="assets/css/img/ad3.png" border="1px" width="250px"
						height="150px" alt="김두한"></a>
				</div>

			</div>
		</aside>



		<div id="container">

			<mytag:logo />

			<a href="control.jsp?action=main&mcnt=${mcnt+1}&selUser=${selUser}">더보기&gt;&gt;</a>
			<br>

			<h2>전체목록</h2>
			<div align="center">
				<ul>
					<li><c:forEach var="v" items="${datas}">
							<c:set var="m" value="${v.m}" />
							<a href="#">
								<h3>
									[작성자 : ${m.uuid}] [댓글 내용 : ${m.msg}] &gt;&gt; [좋아요 :
									${m.favcount} | 대댓글 ${m.replycount} | ${m.udate}]
									<!-- seUser와 m.uuid가 일치하는 경우의 조건에서 삭제버튼 뜨기 -->
									<button style="font-size: 1px;"
										onclick="location.href='control.jsp?action=haction&mid=${m.mid}&mcnt=${mcnt}&selUser=${seUser}'">&#x1f497</button>
									<c:if test="${seUser eq m.uuid}">
										<button style="font-size: 1px;"
											onclick="location.href='control.jsp?action=mdelete&mid=${m.mid}&mcnt=${mcnt}&selUser=${seUser}'">삭제</button>
									</c:if>

								</h3>
							</a>
							<div>
								<c:choose>
									<c:when test="${empty v.rlist}">
										<h4>작성된 대댓글이 없습니다.</h4>


									</c:when>

									<c:when test="${not empty v.rlist}">
										<ol>
											<c:forEach var="r" items="${v.rlist}">
												<li>${r.uuid}>>${r.rmsg}[${r.udate}]</li>
												<c:if test="${seUser eq r.uuid}">
													<button style="font-size: 1px;"
														onclick="location.href='control.jsp?action=rdelete&rid=${r.rid}&mcnt=${mcnt}&selUser=${seUser}'">삭제</button>
												</c:if>
											</c:forEach>
										</ol>
									</c:when>
								</c:choose>




								<c:if test="${seUser != null}">
									<h2>대댓글 작성하기</h2>
									<form action="control.jsp" method="post" name="form1">
										<input type="hidden" name="action" value="rinsert"> <input
											type="hidden" name="mcnt" value="${mcnt}"> <input
											type="hidden" name="mid" value="${m.mid}"> <input
											type="hidden" name="uuid" value="${seUser}"> <input
											type="hidden" name="selUser" value="${seUser}">
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
								</c:if>


							</div>
						</c:forEach></li>
					<br>
				</ul>

				<a class="head" href="#" id="signup">회원가입</a> <br> <br>
				<c:choose>
					<c:when test="${empty seUser}">
						<form action="control.jsp" method="post">
							<h4>로그인 후 댓글, 대댓글 작성이 가능합니다.</h4>

							<input type="hidden" name="mcnt" value="${mcnt}"> <input
								type="hidden" name="action" value="login"> <input
								type="text" name="uuid"> <input type="password"
								name="passwd"> <input type="submit" value="로그인">
						</form>
					</c:when>


					<c:otherwise>
						<form action="control.jsp" method="post" name="form2">
							<input type="hidden" name="action" value="minsert"> <input
								type="hidden" name="uuid" value="${seUser}"> <input
								type="hidden" name="selUser" value="${seUser}"> <input
								type="hidden" name="mcnt" value="${mcnt}">
							<table border="1">
								<tr>
									<td><input type="text" name="msg" placeholder="댓글 입력"></td>

								</tr>
								<tr>
									<td><input type="submit" value="댓글 작성하기"></td>
								</tr>
							</table>
						</form>
			
			
     			 ${seUser}님, 환영합니다!	
			<form action="control.jsp" method="post" name="form3">
							<input type="hidden" name="action" value="logout"> <input
								type="submit" value="로그아웃"> <br> <br> <a
								href="control.jsp?action=main&selUser=${seUser}">내 글 목록보기</a>
							<!-- 58번째줄과 데이터는 똑같으나 띄어쓰기나 특수기호를 허용하지 않는다. -->

						</form>
					</c:otherwise>
				</c:choose>
			</div>


		</div>
	</div>
	<script src="assets/script/main.js"></script>
	<script src="assets/script/newWindow.js"></script>

</body>
</html>