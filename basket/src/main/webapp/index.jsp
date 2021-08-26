<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<style>
h,form,input,div{
	margin : 5px;
	padding : 5px;
}

#wrapper {
	background-color: lightblue;
	text-align : center;
}
</style>
</head>
<body>

	<%
	session.invalidate();// 세션 정보 해제, 데이터 초기화
	if(application.getAttribute("buyCnt")==null){
		application.setAttribute("buyCnt", 0);
	}
	%>
	<div id="wrapper">

		<h2>몬스터 마트</h2>
		<form action="bridge.jsp" method="post" name="form1">
			<input type="text" name="username" placeholder="아이디 입력" required> <input
				type="submit" value="로그인하기">
		</form>

	</div>


</body>
</html>