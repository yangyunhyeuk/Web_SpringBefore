<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,model.message.*,model.member.*"
	errorPage="error.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
String condition = request.getParameter("condition");
String content = request.getParameter("content");
System.out.println("조건, 컨텐츠 : " + condition + " " + content);
%>
<jsp:useBean id="messageDAO" class="model.message.MessageDAO" />
<jsp:useBean id="messageVO" class="model.message.MessageVO" />
<jsp:setProperty property="*" name="messageVO" />
<jsp:useBean id="memDAO" class="model.member.MemberDAO" />
<jsp:useBean id="memVO" class="model.member.MemberVO" />
<jsp:setProperty property="*" name="memVO" />

<!-- => 세터로 자동으로 값을 세팅해주어, 입력 시 값만 잘 주면 된다! -->

<%
// 컨트롤러를 호출했을때의 요청 파라미터를 분석
String action = request.getParameter("action");
System.out.println(action);

//======================================================================
if (action.equals("list")) {
	ArrayList<MessageVO> datas = messageDAO.getDBList();
	request.setAttribute("datas", datas);
	pageContext.forward("list.jsp");
}
//======================================================================
else if (action.equals("login")) {
	//System.out.println("로그인 액션 접속");
	MemberVO mem = memDAO.getDBData(memVO);
	if (mem != null) {
		session.setAttribute("mem", mem);
		response.sendRedirect("control.jsp?action=list");
	} else {
		out.println("<script>alert('로그인 실패!');history.go(-1)</script>");
	}
}
//======================================================================
else if (action.equals("logout")) {
	session.invalidate();
	response.sendRedirect("control.jsp?action=list");
}
//======================================================================
else if (action.equals("mem_reg")) {
	System.out.println("값" + memVO.toString());
	if (memDAO.insertDB(memVO)) {
		response.sendRedirect("control.jsp?action=list");
	} else {
		throw new Exception("DB 추가 에러 발생!");
	}
}
//======================================================================
else if (action.equals("insert")) {
	if (messageDAO.insertDB(messageVO)) {
		response.sendRedirect("control.jsp?action=list");
	} else {
		throw new Exception("DB 추가 에러 발생!");
	}
}
//======================================================================
else if (action.equals("delete")) {
	if (messageDAO.deleteDB(messageVO)) {
		response.sendRedirect("control.jsp?action=list");
	} else {
		throw new Exception("DB 변경 삭제 발생!");
	}
}
//======================================================================
else if (action.equals("update")) {
	if (messageDAO.updateDB(messageVO)) {
		response.sendRedirect("control.jsp?action=list");
	} else {
		throw new Exception("DB 변경 오류 발생!");
	}
}

//======================================================================
else if (action.equals("search")) {

	ArrayList<MessageVO> list = messageDAO.searchDBList(condition, content);
	request.setAttribute("list", list);
	pageContext.forward("list.jsp");
}
//======================================================================
/*
else if(action.equals("main")){
	ArrayList<MessageVO> list=messageDAO.searchDBList("title", "");
	request.setAttribute("list", list);
	pageContext.forward("list.jsp");
}
*/
//======================================================================
else if (action.equals("edit")) {

	//내가 전송한 값 -> 메시지작성자 : root
	//저장되있던 회원 아이디 -> data 메시지작성자 : kim

	System.out.println("방금 입력한 값 메시지작성자 : " + messageVO.getWriter());
	MessageVO data = messageDAO.getDBData(messageVO);
	if (request.getParameter("writer").equals(data.getWriter())) {
		System.out.println("저장되있던 data 메시지작성자 : " + data.getWriter());

		request.setAttribute("data", data);
		pageContext.forward("edit.jsp");
		// 사용자가 잘못된 mnum를 건네는 경우는 없다!
		// -> 오류페이지로 처리!
	} else {
		out.println("<script>alert('관리자가 아닙니다!');history.go(-1)</script>");
	}

	/* 로그인 구현 시 진행
	if(session.getAttribute("writer")==null){
	     out.println("<script>alert('로그인하세요!');history.go(-1)</script>");
	  }
	  else{
	MessageVO data=messageDAO.getDBData(messageVO);
	request.setAttribute("data", data);
	pageContext.forward("edit.jsp");
	     }
	*/
}
//======================================================================
else {
	out.println("<script>alert('파라미터 확인!');history.go(-1)</script>");
	//throw new Exception("파라미터 확인!");
}
//======================================================================
%>













<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨트롤러</title>
</head>
<body>

</body>
</html>