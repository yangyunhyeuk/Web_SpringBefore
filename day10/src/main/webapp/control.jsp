<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,model.member.*, model.message.*"%>
<%
request.setCharacterEncoding("UTF-8");
String condition = request.getParameter("condition");
String content = request.getParameter("content");
System.out.println("조건, 컨텐츠 : " + condition + " " + content);
%>
<jsp:useBean id="msgDAO" class="model.message.MessageDAO" />
<jsp:useBean id="memDAO" class="model.member.MemberDAO" />
<jsp:useBean id="memVO" class="model.member.MemberVO" scope="session" />
<jsp:setProperty property="*" name="memVO" />
<%
String action = request.getParameter("action");

if (action.equals("main")) {
	ArrayList<MessageVO> datas = msgDAO.getDBList();
	request.setAttribute("datas", datas);
	pageContext.forward("main.jsp");
} 

else if (action.equals("login")) {
	MemberVO mem = memDAO.getDBData(memVO);
	if (mem != null) {
		session.setAttribute("mem", mem);
		response.sendRedirect("control.jsp?action=main");
	} else {
		out.println("<script>alert('로그인 실패!');history.go(-1)</script>");
	}
} 

else if (action.equals("logout")) {
	session.invalidate();
	response.sendRedirect("control.jsp?action=main");
}

else if (action.equals("MyPage")) {
	System.out.println(memVO.toString());
	MemberVO data = memDAO.getDBData(memVO); // 해당 조건 데이터
	request.setAttribute("data", data);
	pageContext.forward("mypage.jsp");
}
//============================================================================
else if (action.equals("update")) {
	System.out.println("업데이트 작업 직전 memVO 데이터" + memVO.toString());
	if (memDAO.updateMem(memVO)) {
		response.sendRedirect("control.jsp?action=main");
	} else {
		throw new Exception("DB 변경 오류 발생!");
	}
} else if (action.equals("delete")) {
	if (memDAO.deleteMem(memVO)) {
		session.invalidate();
		response.sendRedirect("control.jsp?action=main");
	} else {
		throw new Exception("DB 변경 삭제 발생!");
	}
} else if (action.equals("search")) {
	ArrayList<MessageVO> list = msgDAO.searchDBList(condition, content);
	request.setAttribute("list", list);
	ArrayList<MessageVO> datas = msgDAO.getDBList();
	request.setAttribute("datas", datas);
	pageContext.forward("main.jsp");

} else if (action.equals("mShow")) {
	
	ArrayList<MemberVO> mdatas = memDAO.getDBDatas();
	request.setAttribute("mdatas", mdatas);
	pageContext.forward("mshow.jsp");
}
%>