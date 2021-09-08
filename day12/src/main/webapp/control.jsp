<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, model.singer.SingerVO"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="singVO" class="model.singer.SingerVO"></jsp:useBean>
<jsp:useBean id="singDAO" class="model.singer.SingerDAO"></jsp:useBean>
<jsp:setProperty property="*" name="singVO" />



<%
String action = request.getParameter("action");

if (action.equals("main")) {
	ArrayList<SingerVO> datas = singDAO.getDBDatas();
	System.out.println("datas.toString() : " + datas.toString());
	request.setAttribute("datas", datas);
	pageContext.forward("main.jsp");
} else if (action.equals("insert")) {
	System.out.println("추가하려는 가수 정보 : " + singVO.toString());
	if (singDAO.insertDB(singVO)) {
		response.sendRedirect("control.jsp?action=main");
	} else {
		throw new Exception("DB 추가 에러 발생!");
	}
} else if (action.equals("edit")) {
	System.out.println("edit 작업 입장,singVO.toString() : "+singVO.toString());
	SingerVO data = singDAO.getDBData(singVO);
	System.out.println("dao 작업 후, SingerVO data : "+data.toString());
	
	request.setAttribute("data", data);
	pageContext.forward("edit.jsp");
	// 사용자가 잘못된 mnum를 건네는 경우는 없다!
	// -> 오류페이지로 처리!
}else if(action.equals("delete")){
	if (singDAO.deleteDB(singVO)) {
		session.invalidate();
		response.sendRedirect("control.jsp?action=main");
	} else {
		throw new Exception("DB 변경 삭제 발생!");
	}
}else if(action.equals("update")){
	System.out.println("update 작업 전, SingerVO data : "+singVO.toString());
	if (singDAO.updateDB(singVO)) {
		response.sendRedirect("control.jsp?action=main"); // 작업 후 바로가 아닌 한번 거쳐가는 경우 센드 리 다이렉트!
	} else {
		throw new Exception("DB 변경 오류 발생!");
	}
}
%>
























