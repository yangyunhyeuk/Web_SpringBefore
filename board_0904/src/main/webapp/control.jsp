<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, model.member.*,model.protein.*"%>
<%
request.setCharacterEncoding("UTF-8");
String condition=request.getParameter("condition");
String content=request.getParameter("content");
System.out.println("조건, 컨텐츠 : "+condition+" "+content);
%>

<jsp:useBean id="msgDAO" class="model.protein.MessageDAO"></jsp:useBean><!-- useBean : 객체 생성 액션 태그 -->
<jsp:useBean id="msgVO" class="model.protein.MessageVO"></jsp:useBean><!-- useBean : 객체 생성 액션 태그 -->
<jsp:setProperty property="*" name="msgVO" /><!-- form을 통해 전송한 값을 세팅해준다. -->

<jsp:useBean id="memberDAO" class="model.member.MemberDAO"
	scope="session"></jsp:useBean><!-- useBean : 객체 생성 액션 태그 -->
<jsp:useBean id="memberVO" class="model.member.MemberVO" scope="session"></jsp:useBean><!-- useBean : 객체 생성 액션 태그 -->
<jsp:setProperty property="*" name="memberVO" /><!-- form을 통해 전송한 값을 세팅해준다. -->
<%
String action = request.getParameter("action");
System.out.println(action + "현재 실행 중인 액션"); // 현재 실행 중인 액션

//==========================================================================================
if (action.equals("list")) {
	ArrayList<MessageVO> datas = msgDAO.getDBList();
	request.setAttribute("datas", datas);
	String mem = request.getParameter("mid");
	request.setAttribute("mem", mem);
	pageContext.forward("list.jsp");
}
//==========================================================================================
else if (action.equals("login")) {
	System.out.println("로그인 액션 접속");
	System.out.println("memberVO 값" + memberVO.toString());
	MemberVO mem = memberDAO.getDBData(memberVO);
	if (mem != null) {
		session.setAttribute("mem", mem); // 세션 단위로 mem 값 세팅!
		System.out.println("로그인 성공!");
		response.sendRedirect("control.jsp?action=list");
	} else {
		out.println("<script>alert('로그인 실패!');history.go(-1)</script>");
	}

}
//==========================================================================================
else if (action.equals("logout")) {
	session.invalidate();
	pageContext.forward("index.jsp");
}
//==========================================================================================
else if (action.equals("update")) {
	if (msgDAO.updateDB(msgVO)) {
		response.sendRedirect("control.jsp?action=list");
	} else {
		throw new Exception("DB 변경 오류 발생!");
	}

}
//==========================================================================================
else if (action.equals("delete")) {
	if (msgDAO.deleteDB(msgVO)) {
		response.sendRedirect("control.jsp?action=list");
	} else {
		throw new Exception("DB 변경 삭제 발생!");
	}
}
//==========================================================================================
else if (action.equals("my")) {
	ArrayList<MessageVO> datas = msgDAO.getDBList();
	request.setAttribute("datas", datas);
	pageContext.forward("my.jsp");

}
//==========================================================================================
else if (action.equals("search")) {
	ArrayList<MessageVO> list = msgDAO.searchDBList(condition, content);
	request.setAttribute("list", list);
	pageContext.forward("list.jsp");

}
//==========================================================================================
else if (action.equals("reg")) {
	System.out.println("회원가입 액션 접속");
	System.out.println(memberVO.toString());
	if (memberDAO.insertDB(memberVO)) {
		pageContext.forward("index.jsp");
	} else {
		throw new Exception("회원가입 액션 애러!");
	}

}
//==========================================================================================
else if (action.equals("insert")) {
	System.out.println("insert하기 전 memberVO 데이터" + memberVO.toString());
	System.out.println(session.getAttribute(memberVO.getMid()));
	if (msgDAO.insertDB(msgVO, memberVO)) {
		response.sendRedirect("control.jsp?action=list");
	} else {
		throw new Exception("DB 추가 에러 발생!");
	}
} else if (action.equals("edit")) {

	System.out.println("방금 입력한 값 메시지작성자 : " + msgVO.getMid());
	MessageVO data = msgDAO.getDBData(msgVO);

	if (request.getParameter("mid").equals((String) data.getMid())) {
		System.out.println("저장되있던 data 메시지작성자 : " + data.getMid());

		request.setAttribute("data", data);
		pageContext.forward("edit.jsp");
		// 사용자가 잘못된 mnum를 건네는 경우는 없다!
		// -> 오류페이지로 처리!
	} else {
		out.println("<script>alert('관리자가 아닙니다!');history.go(-1)</script>");
	}

}
%>



























































<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>