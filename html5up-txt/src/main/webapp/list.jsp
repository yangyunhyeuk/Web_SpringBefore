<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.message.*,java.util.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 입력 화면</title>
<script type="text/javascript">
	function check(mnum){
		writer=prompt("글 정보 변경을 위해 작성자명을 입력하시오.");
		document.location.href="control.jsp?action=edit&mnum="+mnum+"&writer="+writer;
	}
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

							<!-- Content -->

							<h2>게시글 목록</h2>
							<hr>
							<a href="form.jsp">글 등록</a>
							<hr>
							<table border="1">
								<tr>
									<td>글 번호</td>
									<td>제목</td>
									<td>작성자</td>
									<td>작성일</td>
								</tr>
								<%
								for (MessageVO vo : (ArrayList<MessageVO>) datas) {
								%>
								<tr>
									<!-- "control.jsp?action=edit&mnum=vo.getMnum()" -->
									<td><a href="javascript:check(<%=vo.getMnum()%>)"><%=vo.getMnum()%></a></td>
									<!-- 글 변경을 위한 비밀번호 등의 인증작업처리 필요! -->
									<td><%=vo.getTitle()%></td>
									<td><%=vo.getWriter()%></td>
									<td><%=vo.getWdate()%></td>
								</tr>
								<%
								}
								%>
							</table>


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