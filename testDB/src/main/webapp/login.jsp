<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.member.*"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="model.member.MemberDAO" scope="application"/>
<jsp:useBean id="vo" class="model.member.MemberVO" />
<jsp:setProperty property="*" name="vo"/>
<%
   MemberVO res=dao.login(vo);
   if(res!=null){ // 세션 scope로 로그인 인증정보를 저장!
      out.println("로그인 성공!<br>");
   }
   else{
      out.println("로그인 실패!<br>");
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<hr>
<a href="main.jsp">처음으로</a>

</body>
</html>