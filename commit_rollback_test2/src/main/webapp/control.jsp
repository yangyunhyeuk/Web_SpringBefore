<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="model.bank.BankVO,model.bank.BankDAO, java.util.ArrayList"%>

<jsp:useBean id="bDAO" class="model.bank.BankDAO"></jsp:useBean>
<jsp:useBean id="bVO" class="model.bank.BankVO"></jsp:useBean>
<jsp:setProperty property="*" name="bVO" />
<%
String action = request.getParameter("action");

if (action.equals("main")) {
	ArrayList<BankVO> datas = bDAO.getDBDatas();
	System.out.println("datas.toString() : " + datas.toString());
	request.setAttribute("datas", datas);

	pageContext.forward("main.jsp");
} else if (action.equals("my")) {
	BankVO data = bDAO.getDBData(bVO);

	request.setAttribute("data", data);
	pageContext.forward("my.jsp");

} else if (action.equals("update")) {
	System.out.println("업데이트 액션 진입" + bVO.toString());
	if (bDAO.update(bVO)) {
		response.sendRedirect("control.jsp?action=main");
	} else {
		out.println("<script>alert('잔고가 부족합니다.');history.go(-1);</script>");
		//response.sendRedirect("control.jsp?action=main");
	}
	// 보낼 금액 차감 작업(dao)
}
%>