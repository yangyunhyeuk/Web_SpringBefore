<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="model.message.MessageVO" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 입력 화면</title>
<script type="text/javascript">

	
	function del(){ // del 확인 작업
		result=confirm("정말로 삭제하시겠습니까?");
		if(result==true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else{
			return;
		}
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
						<a href="index.html" id="logo">TXT</a>
					</h1>
					<p>A responsive site template by HTML5 UP</p>
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
							<!-- ================================================================================================ -->

							<!-- Content -->

							<a href="control.jsp?action=list">메인으로 돌아가기</a>
							<hr>
							<form action="control.jsp" method="post" name="form1">
								<input type="hidden" name="action" value="update"> <input
									type="hidden" name="mnum" value="<%=data.getMnum()%>">
								<table border="1">
									<tr>
										<td>작성자</td>
										<td><input type="text" name="writer"
											value="<%=data.getWriter()%>"></td>
									</tr>
									<tr>
										<td>제목</td>
										<td><input type="text" name="title"
											value="<%=data.getTitle()%>"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><input type="text" name="content"
											value="<%=data.getContent()%>"></td>
									</tr>
									<tr>
										<td>작성일</td>
										<td><input type="date" name="date"
											value="<%=data.getWdate()%>"></td>
									</tr>
									<tr>
										<td colspan='2'><input type="submit" value="내용 변경하기">
											<input type="button" value="글 삭제하기" onClick="del()"></td>
										<!-- 클릭 이벤트 -->
									</tr>
								</table>
							</form>
							<!-- ================================================================================================ -->
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