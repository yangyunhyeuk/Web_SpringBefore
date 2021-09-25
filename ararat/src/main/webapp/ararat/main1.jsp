<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<html class="no-js" lang="kor">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Ararat</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
    <header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area white-bg">
                <div class="container-fluid p-0">
                    <div class="row align-items-center justify-content-between no-gutters">
                        <div class="col-xl-2 col-lg-2">
                            <div class="logo-img">
                                <a href="main.jsp">
                                    <img src="img/logo.jpg" style="width:100px; height:70px" alt="">
                                    
    
                                    
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-7 col-lg-7">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a class="active" href="index.html">home</a></li>
                                        <li><a href="about.html">About</a></li>
                                      
                                        
                                        <li><a href="board.jsp">게시판</a></li>
                                        
                                        <li><a href="service.html">Services</a></li>

                                        <li><a href="#">blog <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="blog.html">blog</a></li>
                                                <li><a href="single-blog.html">single-blog</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">pages <i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="project-details.html">project-details</a></li>
                                                <li><a href="elements.html">elements</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="https://blog.naver.com/azz4622">블로그</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 d-none d-lg-block" id="signin">
                            <div class="get_in_tauch" id="signin">
                                <a href="" id="signin" class="boxed-btn">로그인</a>
                                <a href="" id="signin" class="boxed-btn">회원가입</a>
                            </div>
                      
                        </div>
                      
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header-end -->


    <!-- about_area_start -->
    <div class="about_area">
        <div class="container">
            <div class="row align-items-center">
              
                <div class="col-xl-5 offset-xl-1 col-md-6">
                    <div class="about_info">
                        <div class="section_title">
                            <span class="sub_heading">About Us</span>
                            <h3>Architechtural plan <br>
                                design and build</h3>
                            <div class="seperator"></div>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo
                            viverra maecenas accumsan lacus vel facilisis. </p>
                       			<!-- 전체 게시글 목록===================================================================== -->
                     <h2>게시판 전체 목록</h2>
							<ul>
								<li><c:set var="doneLoop" value="false" /> <c:forEach
										var="v" items="${datas}">
										<c:if test="${not doneLoop}">
											<c:set var="m" value="${v.m}" />
											<a href="#"> <c:choose>
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
														<p>
															[작성자 : ${m.uuid}] [댓글 내용 : ${m.msg}] &gt;&gt; [좋아요 :
															${m.favcount} | 대댓글 ${m.replycount} | ${m.udate}]
															<!-- seUser와 m.uuid가 일치하는 경우의 조건에서 삭제버튼 뜨기 -->
															<button style="font-size: 1px;"
																onclick="location.href='haction.do?mid=${m.mid}&mcnt=${mcnt}&selUser=${selUser}'">&#x1f497</button>

															<mytag:mdelete mid="${m.mid}" uuid="${m.uuid}" />

														</p>
													</c:otherwise>


												</c:choose>
											</a>
											<c:choose>
												<c:when test="${empty v.rlist}">
													<ol>

														<h4>작성된 대댓글이 없습니다.</h4>
														<form action="rinsert.do" method="post" name="form1">
															<input type="hidden" name="mcnt" value="${mcnt}">
															<input type="hidden" name="mid" value="${m.mid}">
															<mytag:insertmsg type="rmsg" />
															<input type="hidden" name="uuid" value="${seUser}">
															<input type="hidden" name="selUser" value="${selUser}">
														</form>
														<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

													</ol>
												</c:when>

												<c:when test="${not empty v.rlist}">
													<ol>

														<c:forEach var="r" items="${v.rlist}">
															<li>${r.uuid}>>${r.rmsg}[${r.udate}]</li>


															<mytag:rdelete mid="${m.mid}" uuid="${r.uuid}"
																rid="${r.rid}" />

														</c:forEach>
														<form action="rinsert.do" method="post" name="form1">
															<input type="hidden" name="mcnt" value="${mcnt}">
															<input type="hidden" name="mid" value="${m.mid}">
															<mytag:insertmsg type="rmsg" />
															<input type="hidden" name="uuid" value="${seUser}">
															<input type="hidden" name="selUser" value="${selUser}">
														</form>

													</ol>
												</c:when>
											</c:choose>
										</c:if>
									</c:forEach></li>

							</ul>


							<!-- 전체 게시글 목록===================================================================== --> 
                        <a href="#" class="boxed-btn">ABOUT US</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- about_area_end -->

    <!-- dream_service_start -->
    <div class="dream_service">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title text-center mb-95">
                        <span class="sub_heading">About Us</span>
                        <h3>Make your Dream with US</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-md-4">
                    <div class="single_dream text-center">
                        <div class="thumb">
                            <img src="img/dream/1.png" alt="">
                        </div>
                        <h3>Interior</h3>
                        <p>Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                            aliqua quis ipsum suspendisse.</p>
                    </div>
                </div>
                <div class="col-xl-4 col-md-4">
                    <div class="single_dream text-center">
                        <div class="thumb">
                            <img src="img/dream/2.png" alt="">
                        </div>
                        <h3>Exterior</h3>
                        <p>Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                            aliqua quis ipsum suspendisse.</p>
                    </div>
                </div>
                <div class="col-xl-4 col-md-4">
                    <div class="single_dream text-center">
                        <div class="thumb">
                            <img src="img/dream/3.png" alt="">
                        </div>
                        <h3>Bridge</h3>
                        <p>Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                            aliqua quis ipsum suspendisse.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- dream_service_end -->

    <!-- lastest_project_strat -->
    <div class="lastest_project">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title mb-60">
                        <span class="sub_heading">Project view</span>
                        <h3>Our Latest Projects</h3>
                        <div class="seperator"></div>
                    </div>
                </div>
            </div>
            <div class="row align-items-center mb-80">
                <div class="col-xl-6 col-md-6">
                    <div class="single_project_thumb">
                        <img src="img/project/1.png" alt="">
                    </div>
                </div>
                <div class="col-xl-5 offset-xl-1 col-md-6">
                    <div class="section_title">
                        <span class="sub_heading2">Dubai, UAE</span>
                        <h4>Abahoni Building</h4>
                        <p>Consectetur adipiscing elit, sed do eiusmod tempor labore et dolore magna aliqua
                            quis ipsum suspendisse.</p>
                        <a href="#" class="boxed-btn">View More</a>
                    </div>
                </div>
            </div>
            <div class="row align-items-center mb-80">
                <div class="col-xl-6 col-md-6">
                    <div class="section_title">
                        <span class="sub_heading2">Dhaka, Bangladesh</span>
                        <h4>MR Kholifa Tower</h4>
                        <p>Consectetur adipiscing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua
                            quis ipsum suspendisse.</p>
                        <a href="#" class="boxed-btn">View More</a>
                    </div>
                </div>
                <div class="col-xl-5 offset-xl-1 col-md-6">
                    <div class="single_project_thumb">
                        <img src="img/project/2.png" alt="">
                    </div>
                </div>
            </div>
            <div class="row align-items-center mb-80">
                <div class="col-xl-6 col-md-6">
                    <div class="single_project_thumb">
                        <img src="img/project/3.png" alt="">
                    </div>
                </div>
                <div class="col-xl-5 offset-xl-1 col-md-6">
                    <div class="section_title">
                        <span class="sub_heading2">Dubai, UAE</span>
                        <h4>Galoni Plan & Design</h4>
                        <p>Consectetur adipiscing elit, sed do eiusmod tempor labore et dolore magna aliqua
                            quis ipsum suspendisse.</p>
                        <a href="#" class="boxed-btn">View More</a>
                    </div>
                </div>
            </div>
            <div class="row align-items-center mb-80">
                <div class="col-xl-6 col-md-6">
                    <div class="section_title">
                        <span class="sub_heading2">Dhaka, Bangladesh</span>
                        <h4>Hiclick Mirror design</h4>
                        <p>Consectetur adipiscing elit, sed do eiusmod tempor incididunt labore et dolore magna aliqua
                            quis ipsum suspendisse.</p>
                        <a href="#" class="boxed-btn">View More</a>
                    </div>
                </div>
                <div class="col-xl-5 offset-xl-1 col-md-6">
                    <div class="single_project_thumb">
                        <img src="img/project/4.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- lastest_project_end -->

    <!-- testmonial_area_start -->
    <div class="testmonial_area testimonial_bg overlay2">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12">
                    <div class="testmonial_active owl-carousel">
                        <div class="single_testmonial">
                            <div class="testmonial_info text-center">
                                <div class="author">
                                    <img src="img/testmonial/author.png" alt="">
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                    tempor
                                    incididunt ut
                                    <br> labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.
                                    Risus
                                    commodo
                                    viverra <br> maecenas accumsan lacus vel facilisis. </p>
                                <div class="author_name">
                                    <h4>-MITHILA</h4>
                                    <span> Designer at Colorlib</span>
                                </div>
                            </div>
                        </div>
                        <div class="single_testmonial">
                            <div class="testmonial_info text-center">
                                <div class="author">
                                    <img src="img/testmonial/author.png" alt="">
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                    tempor
                                    incididunt ut
                                    <br> labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.
                                    Risus
                                    commodo
                                    viverra <br> maecenas accumsan lacus vel facilisis. </p>
                                <div class="author_name">
                                    <h4>-MITHILA</h4>
                                    <span> Designer at Colorlib</span>
                                </div>
                            </div>
                        </div>
                        <div class="single_testmonial">
                            <div class="testmonial_info text-center">
                                <div class="author">
                                    <img src="img/testmonial/author.png" alt="">
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                                    tempor
                                    incididunt ut
                                    <br> labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.
                                    Risus
                                    commodo
                                    viverra <br> maecenas accumsan lacus vel facilisis. </p>
                                <div class="author_name">
                                    <h4>-MITHILA</h4>
                                    <span> Designer at Colorlib</span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- testmonial_area_end -->

    <!-- messege_area_start -->
    <div class="messege_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-6 col-md-6">
                    <div class="messege_thumb">
                        <img src="img/testmonial/mesege.png" alt="">
                    </div>
                </div>
                <div class="col-xl-5 offset-xl-1 col-md-6">
                    <div class="section_title mb-20">
                        <span class="sub_heading">Contact Us</span>
                        <h3>Send your message</h3>
                        <div class="seperator"></div>
                    </div>
                    <form action="#" class="messege">
                        <input type="email" placeholder="Your Email">
                        <input type="text" placeholder="Subject">
                        <textarea placeholder="Messege"></textarea>
                        <button class="boxed-btn">SEND US</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- messege_area_end -->

    <!-- footer_start -->
    <footer class="footer footer_bg">
        <div class="footer_top">
            <div class="container-fluid p-0">
                <div class="row no-gutters ">
                    <div class="col-xl-3 col-12 col-md-4">
                        <div class="footer_widget">
                            <div class="footer_logo">
                                <a href="index.html">
                                    <img src="img/footer-logo.png" alt="">
                                </a>
                            </div>
                            <ul class="social_links">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-9 col-12 col-md-8">
                        <div class="footer_header d-flex justify-content-between">
                            <div class="footer_header_left">
                                <h3>Do youn have any project or Query ?</h3>
                                <p>Consectetur adipiscing elit, sed do eiusmod tempor incididunt. </p>
                            </div>
                            <div class="footer_btn">
                                <a href="#" class="boxed-btn2">Contact Us</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-8 col-12 col-md-12">
                                <div class="row">
                                    <div class="col-xl-4 col-12 col-md-4">
                                        <div class="footer_widget">
                                            <h3 class="footer_heading">
                                                Navigation
                                            </h3>
                                            <ul class="quick_links">
                                                <li><a href="#">Home</a></li>
                                                <li><a href="#"> About</a></li>
                                                <li><a href="#"> Project</a></li>
                                                <li><a href="#">Services</a></li>
                                                <li><a href="#">Blog</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-12 col-md-4">
                                        <div class="footer_widget">
                                            <h3 class="footer_heading">
                                                Services
                                            </h3>
                                            <ul class="quick_links">
                                                <li><a href="#">Interior</a></li>
                                                <li><a href="#"> Exterior</a></li>
                                                <li><a href="#"> Bridge</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-12 col-md-4 ">
                                        <div class="footer_widget">
                                            <h3 class="footer_heading">
                                                Speak Now
                                            </h3>
                                            <ul class="quick_links">
                                                <li><a href="#">+10 267 3567 267</a></li>
                                                <li><a href="#"> contact@ararat.com</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer_copy_right">
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
        </div>
    </footer>
    <!-- footer_end -->


    <!-- JS here -->
	
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/ajax-form.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/scrollIt.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/nice-select.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/plugins.js"></script>

    <!--contact js-->
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <script src="js/main.js"></script>

</body>

</html>