<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
	function wclose() {
		close();
	}
</script> -->
</head>
<body>
	<%
	// 여기서 Info.jsp에서 받아온 유저 아이디와 이메일 정보가 전달됐는지 확인하고 이메일은 인자로 넘겨준다. 
	String uid = request.getParameter("uid");
	String mymail = request.getParameter("mymail");


	out.println("유저 아이디 : " + uid);
	out.println("보낼 이메일 : " + mymail);

	/* 
	MailSend ms = new MailSend();
	ms.MailSend(email);
	out.println("<script>alert('메일 전송 완료');</script>"); */
	//out.println("메일 전송 완료");
	%>
	<!-- <button type="button" class="" onclick="wclose()">닫기</button>
 -->

</body>
</html>