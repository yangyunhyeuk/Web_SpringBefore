<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="commdatas" class="java.util.ArrayList" scope="request" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/login.css">
<script src="assets/js/jquery-3.6.0.min.js"></script>
<!-- 제이쿼리 사용을 위해 임포트 -->

<script type="text/javascript">
	//회원 mid 클릭 시 액션값 부여///////////////////////////////////////////////////////////////////////////////////
	function check(mid) {
		document.location.href = "control.jsp?action=edit&mid=" + mid;

	}
	/////////////////////////////////////////////////////////////////////////////////////

	//댓글 cnum 클릭 시 액션값 부여///////////////////////////////////////////////////////////////////////////////////
	function commcheck(cnum) {
		document.location.href = "control.jsp?action=commedit&cnum=" + cnum;

	}
	/////////////////////////////////////////////////////////////////////////////////////
</script>
</head>
<body>
	<!--======================================================================================================================================================== -->
	<br>
	<br>
	<br>
	<br>
	<hr>

	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>
				<button type="button" class="togglebtn" id="on" onclick="login()">로그인</button>
				<!--  스크롤 조절을 위한 id 값 on -->
				<button type="button" class="togglebtn" id="off"
					onclick="register()">회원가입</button>
				<!--  스크롤 조절을 위한 id 값 off -->
			</div>

			<!-- 전체적인 폼 내에서 유효성 검사를 거치기 위해 id값 설정 -->

			<form id="login" action="" class="input-group">
				<input type="text" class="input-field" id="idCheck"
					placeholder="아이디">
				<!-- 다양한 활용을 위해 required와 자바스크립트를 통해 공백 유효성검사를 해주었다.  -->
				<input type="password" class="input-field" id="pwCheck"
					placeholder="비밀번호" required> <input type="checkbox"
					class="checkbox"> <span>로그인 상태 유지</span>
				<button class="submit" id="logCheck">로그인</button>
			</form>
			<form id="register" action="" class="input-group">
				<input type="text" class="input-field" name="uid" id="uid"
					placeholder="아이디"> <br>

				<button type="button" id="btTest">중복확인</button>
				<br> <br> <input type="password"
					class="input-field password" name="pwd" id="pwd"
					placeholder="비밀번호&emsp;&emsp;&emsp;&emsp;영문자+숫자+특수문자 조합"><br>
				<input type="password" class="input-field password" name="repwd"
					id="repwd" placeholder="비밀번호 확인"><br> <br> <a>통신사
				</a> &#10;&#10;&#10;&#10; <label><input id="tel1" class="tel"
					type="radio" name="tel" value="LG" />LG</label> <label><input
					id="tel2" class="tel" type="radio" name="tel" value="SKT" />SKT</label> <label><input
					id="tel3" class="tel" type="radio" name="tel" value="KT" />KT</label><br>

				<input type="tel" class="input-field" name="mobile" id="mobile"
					placeholder="전화번호&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;010-0000-0000">
				<br> <br> <br> <a>이메일</a> <br> <input
					type="text" name="str_email01" id="str_email01" style="width: 80px">
				@ <input type="text" name="str_email02" id="str_email02"
					style="width: 90px;" disabled value="naver.com"> <select
					style="width: 55px; margin-right: 10px" name="selectEmail"
					id="selectEmail">
					<option value="1">직접</option>
					<option value="naver.com" selected>naver.com</option>
					<option value="daum.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="yahoo.co.kr">yahoo.co.kr</option>
					<option value="gmail.com">gmail.com</option>

				</select><br> <br> <br>







				<li class="checkBox">
					<ul class="clearfix">
					</ul> <textarea name="" id="" readonly>&#10;개인정보보호법에 따라 해당 사이트에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.&#10;&#10;
1. 수집하는 개인정보&#10;이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 해당 사이트 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 해당 사이트는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
					
					</textarea>


				</li>

				<div id="service">
					<input type='checkbox' value='Y' class='checkbox' name='agree'
						id='agree'> <span>약관 동의 (필수)</span>
				</div>
				<button class="submit" id="confirm">회원가입</button>
			</form>
		</div>
	</div>

	<!-- 위에서 순차적으로 코드를 읽어내려가는 웹 브라우저 특성상 정상작동을 하기 위해 코드를 먼저 작성한 뒤 작성한다. -->
	<script src="assets/script/login_register.js"></script>
	<script src="assets/script/login.js"></script>
	<!-- js 파일 임포트 -->















































	<hr>
	<br>
	<br>
	<br>
	<br>
	<!--======================================================================================================================================================== -->
	<h2>댓글 작성하기</h2>
	<br>

	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="comminsert">
		<table border="1">


			<tr>
				<td>댓글 내용</td>
				<td><input type="text" name="comm"></td>
			</tr>

			<tr>
				<td>게시글 번호</td>
				<td><input type="text" name="pnum"></td>
			</tr>
			<tr>
				<td>회원 닉네임</td>
				<td><input type="text" name="mname"></td>
			</tr>
			<tr>
				<td>회원 아이디</td>
				<td><input type="text" name="mid"></td>
			</tr>

			<tr>
				<td colspan='2'><input type="submit" value="댓글 작성하기"></td>
			</tr>
		</table>
	</form>
	<!-- ======================================================================================================================================================= -->






	<!-- ======================================================================================================================================================= -->
	<br>
	<br>
	<hr>
	<h2>자유게시판 댓글 모음</h2>
	<hr>
	<br>
	<table border="1">
		<tr>
			<td>댓글 고유 번호</td>
			<td>댓글 내용</td>
			<td>댓글 작성 일자</td>
			<td>게시글 번호</td>
			<td>회원 닉네임</td>
			<td>회원 아이디</td>
		</tr>

		<c:forEach var="cvo" items="${commdatas}">
			<tr>
				<td><a href="javascript:commcheck('${cvo.cnum}')">${cvo.cnum}</a></td>
				<td>${cvo.comm}</td>
				<td>${cvo.cdate}</td>
				<td>${cvo.pnum}</td>
				<td>${cvo.mname}</td>
				<td>${cvo.mid}</td>
			</tr>
		</c:forEach>

	</table>
	<br>
	<br>
	<br>
	<!-- ======================================================================================================================================================= -->







	<!-- ======================================================================================================================================================= -->
	<hr>
	<h2>회원 목록</h2>
	<hr>
	<br>
	<table border="1">
		<tr>
			<td>회원 아이디</td>
			<td>회원 비밀번호</td>
			<td>회원 닉네임</td>
			<td>회원 이메일</td>
			<td>사용자/관리자</td>
		</tr>

		<c:forEach var="vo" items="${datas}">
			<tr>
				<td><a href="javascript:check('${vo.mid}')">${vo.mid}</a></td>
				<td>${vo.mpw}</td>
				<td>${vo.mname}</td>
				<td>${vo.memail}</td>
				<td>${vo.role}</td>
			</tr>
		</c:forEach>

	</table>
	<hr>
	<hr>
	<br>
	<!-- ======================================================================================================================================================= -->





	<!-- ======================================================================================================================================================= -->
	<br>
	<h2>회원 추가하기</h2>
	<br>
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="insert">
		<table border="1">
			<tr>
				<td>회원 아이디</td>
				<td><input type="text" name="mid"></td>
			</tr>
			<tr>
				<td>회원 비밀번호</td>
				<td><input type="text" name="mpw"></td>
			</tr>
			<tr>
				<td>회원 닉네임</td>
				<td><input type="text" name="mname"></td>
			</tr>
			<tr>
				<td>회원 이메일</td>
				<td><input type="text" name="memail"></td>
			</tr>
			<tr>
				<td>사용자/관리자</td>
				<td><input type="text" name="role"></td>
			</tr>

			<tr>
				<td colspan='2'><input type="submit" value="회원 추가하기"></td>
			</tr>
		</table>
	</form>
	<!-- ======================================================================================================================================================= -->
</body>
</html>