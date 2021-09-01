<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="model.message.*,java.util.*,  model.member.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<%
MemberVO vos = (MemberVO) session.getAttribute("mem");//네임을 인자로!
//vos.getMid();
//vos.getMpw();
%>
<jsp:useBean id="list" class="java.util.ArrayList" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 입력 화면</title>
<script type="text/javascript">
	/* 로그인 후 본인이 작성한 게시글이 보이기 때문에 따로 보안절차 X
	 */
	function check(mnum) {
		writer = prompt("글 정보 변경을 위해 작성자를 입력하시오.");
		document.location.href = "control.jsp?action=edit&mnum=" + mnum
				+ "&writer=" + writer;
	} //if (vos.getMid().equals(vo.getWriter()))
</script>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<div class="logo container">
				<div>
					<h1>
						<a href="index.jsp">메인으로 이동하기</a>
					</h1>
				</div>

			</div>
		</header>

		<!-- Nav -->
		<nav id="nav">
			<ul>
				<li><a href="index.html">Home</a></li>
				<li><a href="#">Dropdown</a>
					<ul>
						<li><a href="#">Lorem ipsum dolor</a></li>
						<li><a href="#">Magna phasellus</a></li>
						<li><a href="#">Phasellus consequat</a>
							<ul>
								<li><a href="#">Lorem ipsum dolor</a></li>
								<li><a href="#">Phasellus consequat</a></li>
								<li><a href="#">Magna phasellus</a></li>
								<li><a href="#">Etiam dolore nisl</a></li>
							</ul></li>
						<li><a href="#">Veroeros feugiat</a></li>
					</ul></li>
				<li><a href="left-sidebar.html">Left Sidebar</a></li>
				<li><a href="right-sidebar.html">Right Sidebar</a></li>
				<li class="current"><a href="no-sidebar.html">No Sidebar</a></li>
			</ul>
		</nav>


		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="content">

							<form action="control.jsp" method="post">
								<input type="hidden" name="action" value="search"> <select
									name="condition">
									<option selected value="title">제목</option>
									<option value="writer">작성자</option>
								</select> <br> <input type="text" name="content"> <br>
								<input type="submit" value="검색하기">
							</form>
							<br> <br> <br> <br> <br>






							<h2>검색 게시글 목록</h2>
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




							<br> <br> <br> <br> <br> <br>




							<!-- Content -->




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

							<hr>
							<hr>
							<br> <br> <br> <br> <br> <br>
							<%
							if (session.getAttribute("mem") == null) {
							%>
							<form action="control.jsp" method="post" name="form1">
								<input type="hidden" name="action" value="login">
								<table border="1">
									<tr>
										<td>아이디</td>
										<td><input type="text" name="mid"></td>
									</tr>
									<tr>
										<td>패스워드</td>
										<td><input type="password" name="mpw"></td>
									</tr>
									<tr>
										<td colspan='2'><input type="submit" value="로그인"></td>
									</tr>

								</table>
							</form>
							<a href="mem_reg.jsp">회원가입</a>
							<%
							} else {
							%>
							<form action="control.jsp" method="post" name="form1">
								<input type="hidden" name="action" value="logout"> <input
									type="submit" value="로그아웃">
							</form>
							<%
							}
							%>
						</div>
					</div>



					<br> <br> <br>




					<div class="col-12">
						<div class="content">

							<%
							if (session.getAttribute("mem") != null) {
								//messageDAO.getDBList();
							%>
							<a href="form.jsp">글 등록</a> <br> <br>
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
									if (vos.getMid().equals(vo.getWriter())) {
								%>


								<tr>
									<td><a href="javascript:check(<%=vo.getMnum()%>)"><%=vo.getMnum()%></a></td>
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

						</div>
					</div>






					<div class="col-12">

						<!-- Features -->
						<section class="box features">
							<h2 class="major">
								<span>A Major Heading</span>
							</h2>
							<div>
								<div class="row">
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">

											<a href="#" class="image featured"><img
												src="images/pic01.jpg" alt="" /></a>
											<h3>
												<a href="#">A Subheading</a>
											</h3>
											<p>Phasellus quam turpis, feugiat sit amet ornare in, a
												hendrerit in lectus dolore. Praesent semper mod quis eget
												sed etiam eu ante risus.</p>
										</section>

									</div>
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="#" class="image featured"><img
												src="images/pic02.jpg" alt="" /></a>
											<h3>
												<a href="#">Another Subheading</a>
											</h3>
											<p>Phasellus quam turpis, feugiat sit amet ornare in, a
												hendrerit in lectus dolore. Praesent semper mod quis eget
												sed etiam eu ante risus.</p>
										</section>

									</div>
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="#" class="image featured"><img
												src="images/pic03.jpg" alt="" /></a>
											<h3>
												<a href="#">And Another</a>
											</h3>
											<p>Phasellus quam turpis, feugiat sit amet ornare in, a
												hendrerit in lectus dolore. Praesent semper mod quis eget
												sed etiam eu ante risus.</p>
										</section>

									</div>
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="#" class="image featured"><img
												src="images/pic04.jpg" alt="" /></a>
											<h3>
												<a href="#">And One More</a>
											</h3>
											<p>Phasellus quam turpis, feugiat sit amet ornare in, a
												hendrerit in lectus dolore. Praesent semper mod quis eget
												sed etiam eu ante risus.</p>
										</section>

									</div>
									<div class="col-12">
										<ul class="actions">
											<li><a href="#" class="button large">Do Something</a></li>
											<li><a href="#" class="button alt large">Think About
													It</a></li>
										</ul>
									</div>
								</div>
							</div>
						</section>

					</div>
				</div>
			</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-12">

						<!-- About -->
						<section>
							<h2 class="major">
								<span>What's this about?</span>
							</h2>
							<p>
								This is <strong>TXT</strong>, yet another free responsive site
								template designed by <a href="http://twitter.com/ajlkn">AJ</a>
								for <a href="http://html5up.net">HTML5 UP</a>. It's released
								under the <a href="http://html5up.net/license/">Creative
									Commons Attribution</a> license so feel free to use it for whatever
								you're working on (personal or commercial), just be sure to give
								us credit for the design. That's basically it :)
							</p>
						</section>

					</div>
					<div class="col-12">

						<!-- Contact -->
						<section>
							<h2 class="major">
								<span>Get in touch</span>
							</h2>
							<ul class="contact">
								<li><a class="icon brands fa-facebook-f" href="#"><span
										class="label">Facebook</span></a></li>
								<li><a class="icon brands fa-twitter" href="#"><span
										class="label">Twitter</span></a></li>
								<li><a class="icon brands fa-instagram" href="#"><span
										class="label">Instagram</span></a></li>
								<li><a class="icon brands fa-dribbble" href="#"><span
										class="label">Dribbble</span></a></li>
								<li><a class="icon brands fa-linkedin-in" href="#"><span
										class="label">LinkedIn</span></a></li>
							</ul>
						</section>

					</div>
				</div>

				<!-- Copyright -->
				<div id="copyright">
					<ul class="menu">
						<li>&copy; Untitled. All rights reserved</li>
						<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>

			</div>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>