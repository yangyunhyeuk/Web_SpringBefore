<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, model.comment.*, model.member.*"%>
<jsp:useBean id="MemDAO" class="model.member.MemDAO"></jsp:useBean>
<jsp:useBean id="MemVO" class="model.member.MemVO"></jsp:useBean>
<jsp:setProperty property="*" name="MemVO" />

<jsp:useBean id="FreeCoDAO" class="model.comment.FreeCoDAO"></jsp:useBean>
<jsp:useBean id="FreeCoVO" class="model.comment.FreeCoVO"></jsp:useBean>
<jsp:setProperty property="*" name="FreeCoVO" />

<%
String action = request.getParameter("action");

if (action.equals("main")) {
	//회원 데이터 전달
	ArrayList<MemVO> datas = MemDAO.SelectAll();
	request.setAttribute("datas", datas);

	//게시판 댓글 데이터 전달
	ArrayList<FreeCoVO> commdatas = FreeCoDAO.SelectAll();
	request.setAttribute("commdatas", commdatas);
	pageContext.forward("main.jsp");

} else if (action.equals("insert")) {
	if (MemDAO.InsertDB(MemVO)) {
		response.sendRedirect("control.jsp?action=main");
	} else {
		throw new Exception("DB 추가 에러 발생!");
	}
} else if (action.equals("edit")) {
	System.out.println("edit 진입 : " + MemVO.toString());
	MemVO data = MemDAO.SelectOne(MemVO);
	request.setAttribute("data", data);
	pageContext.forward("edit.jsp");
	// 사용자가 잘못된 mnum를 건네는 경우는 없다!
	// -> 오류페이지로 처리!
} else if (action.equals("update")) {
	System.out.println("update 작업 전, SingerVO data : " + MemVO.toString());
	if (MemDAO.UpdateDB(MemVO)) {
		response.sendRedirect("control.jsp?action=main"); // 작업 후 바로가 아닌 한번 거쳐가는 경우 센드 리 다이렉트!
	} else {
		throw new Exception("DB 변경 오류 발생!");
	}
} else if (action.equals("delete")) {
	if (MemDAO.DeleteDB(MemVO)) {
		response.sendRedirect("control.jsp?action=main");
	} else {
		throw new Exception("DB 변경 삭제 발생!");
	}
}
//===============================================================================================================
else if (action.equals("commedit")) {
	FreeCoVO commdata = FreeCoDAO.SelectOne(FreeCoVO);
	request.setAttribute("commdata", commdata);
	pageContext.forward("commedit.jsp");
	// 사용자가 잘못된 mnum를 건네는 경우는 없다!
	// -> 오류페이지로 처리!
}

else if (action.equals("comminsert")) {
	if (FreeCoDAO.InsertDB(FreeCoVO)) {
		response.sendRedirect("control.jsp?action=main");
	} else {
		throw new Exception("DB 추가 에러 발생!");
	}
} else if (action.equals("commupdate")) {
	System.out.println("commupdate 액션 진입 : " + FreeCoVO.toString());

	if (FreeCoDAO.UpdateDB(FreeCoVO)) {
		response.sendRedirect("control.jsp?action=main"); // 작업 후 바로가 아닌 한번 거쳐가는 경우 센드 리 다이렉트!
	} else {
		throw new Exception("DB 변경 오류 발생!");
	}
} else if (action.equals("commdelete")) {
	if (FreeCoDAO.DeleteDB(FreeCoVO)) {
		response.sendRedirect("control.jsp?action=main");
	} else {
		throw new Exception("DB 변경 삭제 발생!");
	}
}
%>