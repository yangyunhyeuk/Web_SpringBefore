<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>yh_게시판</title>

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
				<form method="post" action="minsert.do">
					<input type="hidden" name="uuid" value="${seUser}">
					<mytag:insertmsg type="msg" />
					<input type="hidden" name="mcnt" value="${mcnt}"> <input
						type="hidden" name="selUser" value="${selUser}">
				</form>
				<br>
				<a href="main.do?selUser=${seUser}">${seUser}님, 환영합니다. <br>내
					글 목록보기<br>
				</a>
				<br>
				<mytag:logout />
			</c:otherwise>
		</c:choose>
		<a class="head" href="#" id="signup">회원가입</a> <br> <br> <br>
		<br>


		<table style="text-align: center;" align="left" border="1"
			cellspacing="0" cellpadding="0" bordercolor="#BA0A0A"
			text-align="center">
			<th colspan="2">신규회원 목록</th>
			<tr>
				<td style="font-size: 1px">☞회원 클릭 시 해당 회원의 게시글이 나옵니다</td>
			</tr>

			<c:forEach var="v" items="${newUsers}">
				<tr>
					<td><a href="main.do?selUser=${v.uuid}">${v.uuid}</a></td>
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
<a>mcnt 값 : ${mcnt}</a>
<a>viewcnt 값 : ${viewcnt}</a>
		<c:if test="${mcnt < viewcnt}">
			<a href="main.do?mcnt=${mcnt+1}&selUser=${selUser}">더보기&gt;&gt;</a>
			<br>
		</c:if>
		<h2>전체목록</h2>

		<ul>
			<li><c:set var="doneLoop" value="false" /> 
			<c:forEach var="v" items="${datas}">
					<c:if test="${not doneLoop}">
						<c:set var="m" value="${v.m}" />
						<a href="#"> 
						<c:choose>
								<c:when test="${viewcnt == 0}">
									<h3>1차 : 작성된 게시글이 없습니다.</h3>
									<c:set var="doneLoop" value="true" />
								</c:when>
								<c:when test="${viewcnt eq ''}">
									<h3>2차 : 작성된 게시글이 없습니다.</h3>
									<c:set var="doneLoop" value="true" />
								</c:when>
								<c:when test="${empty viewcnt}">
									<h3>3차 : 작성된 게시글이 없습니다.</h3>
									<c:set var="doneLoop" value="true" />
								</c:when>
								
								<c:otherwise>
									<h3>
										[작성자 : ${m.uuid}] [댓글 내용 : ${m.msg}] &gt;&gt; [좋아요 :
										${m.favcount} | 대댓글 ${m.replycount} | ${m.udate}]
										<!-- seUser와 m.uuid가 일치하는 경우의 조건에서 삭제버튼 뜨기 -->
										<button style="font-size: 1px;"
											onclick="location.href='haction.do?mid=${m.mid}&mcnt=${mcnt}&selUser=${selUser}'">&#x1f497</button>

										<mytag:mdelete mid="${m.mid}" uuid="${m.uuid}" />

									</h3>
								</c:otherwise>


							</c:choose>
						</a>
						<c:choose>
							<c:when test="${empty v.rlist}">
								<ol>

									<h4>작성된 대댓글이 없습니다.</h4>
									<form action="rinsert.do" method="post" name="form1">
										<input type="hidden" name="mcnt" value="${mcnt}"> <input
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
									<form action="rinsert.do" method="post" name="form1">
										<input type="hidden" name="mcnt" value="${mcnt}"> <input
											type="hidden" name="mid" value="${m.mid}">
										<mytag:insertmsg type="rmsg" />
										<input type="hidden" name="uuid" value="${seUser}"> <input
											type="hidden" name="selUser" value="${selUser}">
									</form>

								</ol>
							</c:when>
						</c:choose>
					</c:if>
				</c:forEach></li>
		</ul>

		<h3>페이징 목록</h3>




		<table border="1px">
			<tr>
				<td>작성자</td>
				<td>댓글내용</td>
				<td>좋아요</td>
				<td>대댓글</td>
				<td>날짜</td>
			</tr>
			<c:forEach var="v" items="${paging}">
				<c:set var="m" value="${v.m}" />
				<tr>
					<td>${m.uuid}</td>
					<td>${m.msg}</td>
					<td>${m.favcount}</td>
					<td>${m.replycount}</td>
					<td>${m.udate}</td>
				</tr>
			</c:forEach>
		</table>



		<!-- viewcnt : 게시글 갯수, pages : 한 페이지 내에서 보여줄 게시글 수 -->
		<!-- viewcnt % pages : 만약 게시글 수가 5로 나누고 나머지가 발생할 경우 1을 더해주어 페이지를 설정 -->
		<c:set var="pages" value="5" />
		<c:set var="p" value="${viewcnt / pages + (viewcnt % pages != 0 ? 1 : 0)}" />
		<!-- 상단에서 설계한 페이지 세팅을 통해 해당 페이지의 게시글을 가져온다. -->


		<!-- page : 현재 페이지 데이터 -->
		<a href="main.do?page=${page eq 1?1:page-1}&selUser=${selUser}">이전</a>
		<!--  end="${p<cntEnd ? p:cntEnd}" -->
		<c:forEach var="i" begin="${cntStart}" end="${p<cntEnd ? p:cntEnd}">
			<c:choose>
				<c:when test="${page eq p}">
					<a href="main.do?page=${i}&selUser=${selUser}"
						style="text-decoration: underline;"><c:out value="${i}" /></a>
				</c:when>
				<c:otherwise>
					<a href="main.do?page=${i}&selUser=${selUser}"><c:out
							value="${i}" /></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<a href="main.do?page=${page eq Math.floor(p)?page:page+1}&selUser=${selUser}">다음</a>






		<br>
		<a>cntStart : ${cntStart}</a> 
		<a>cntEnd : ${cntEnd}</a> 
		<a>viewcnt : ${viewcnt}</a> 
		<a>pages : ${pages}</a> 
		<a>p : ${p}</a>
		<a>p : ${Math.floor(p)}</a>
		<a>page : ${page}</a>

	</div>
	<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->




	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	<div class="ad">
		<!-- ////////////////광고글//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<ol>
			<li><a
				href="https://www.dabangapp.com/?gclid=Cj0KCQjws4aKBhDPARIsAIWH0JVWaGnuXLgfGuGKgnfXm8CarBIpHGbkUAd6z88CfdOrjtW9cIv8dhcaAv4-EALw_wcB">
					<img src="assets/css/img/ad1.png"
					style="width: 200px; height: 100px; border: 1px solid red;"
					alt="광고_다방" />
			</a></li>
			<li><a href="https://www.cgv.co.kr/"> <img
					src="assets/css/img/ad2.png"
					style="width: 200px; height: 100px; border: 1px solid red;"
					alt="광고_이터널즈" />
			</a></li>
			<li><a href="https://www.burgerking.co.kr/#/home"> <img
					src="assets/css/img/ad3.png"
					style="width: 200px; height: 100px; border: 1px solid red;"
					alt="광고_킹거킹" />
			</a></li>
		</ol>

		<input type="button" value="버튼" onclick="changeAd()" />
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

	<script>


		var adProperties = [
			{
				href: "https://www.dabangapp.com/?gclid=Cj0KCQjws4aKBhDPARIsAIWH0JVWaGnuXLgfGuGKgnfXm8CarBIpHGbkUAd6z88CfdOrjtW9cIv8dhcaAv4-EALw_wcB",
				src: "assets/css/img/ad1.png",
				alt: "광고_다방"
			},
			{
				href: "https://www.cgv.co.kr/",
				src: "assets/css/img/ad2.png",
				alt: "광고_이터널즈"
			},
			{
				href: "https://www.burgerking.co.kr/#/home",
				src: "assets/css/img/ad3.png",
				alt: "광고_킹거킹"
			}
		];
		
		function shuffle(_arr) {
			const arr = _arr.concat();
			arr.sort(() => Math.random() - 0.5);
			return arr;
		}
	
		function changeAd() {
			let ol = document.querySelector(".ad ol");
			const arr = shuffle(adProperties);
			console.log(arr);
			
			for (let i = 0; i < 3; ++i) {
				const a = document.querySelector(".ad ol li:nth-child(" + (i + 1) + ") a");
				const img = document.querySelector(".ad ol li:nth-child(" + (i + 1) + ") img");
				console.log(a.href);
				a.href = arr[i].href;
				img.src = arr[i].src;
				img.alt = arr[i].alt;
			}
		}
		
		// setInterval 줘서 시간차에 따라 광고바뀌게 작업해보기
		changeAd();
	</script>
</body>
</html>