<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,model.msg.*,model.user.*"%>



<jsp:useBean id="mDAO" class="model.msg.MessageDAO" />
<jsp:useBean id="mVO" class="model.msg.MessageVO" />
<jsp:setProperty property="*" name="mVO" />

<jsp:useBean id="rDAO" class="model.msg.ReplyDAO" />
<jsp:useBean id="rVO" class="model.msg.ReplyVO" />
<jsp:setProperty property="*" name="rVO" />

<jsp:useBean id="uDAO" class="model.user.UserDAO" />
<jsp:useBean id="uVO" class="model.user.UserVO" />
<jsp:setProperty property="*" name="uVO" />


<%
//==================================================================================
String action = request.getParameter("action"); // 액션 받을 변수 생성
String url = "control.jsp?action=main";
String mcntt = request.getParameter("mcnt"); // 메인 페이지에서 더 보기를 누르면 다음과 같이 mcnt의 값이 증가된 상태를 받아온다. 
// <a href="control.jsp?action=main&mcnt=${mcnt+1}&selUser=${selUser}">[더보시려면 클릭]&gt;&gt;</a>
int mcnt = 2;
if (mcntt != null) { // 더보기를 클릭하지 않은 경우 2개 값만 볼 수 있게 mcnt 초기값을 2로 설정
	mcnt = Integer.parseInt(mcntt); // getParam으로 받아온 String 값을 정수형으로 형변환해준 뒤 값을 저장한다.
}

url = url + "&mcnt=" + mcnt; // url에 증가값을 표시한 뒤 url 변수 공간에 저장한다. 
String selUser = request.getParameter("selUser"); // 
System.out.println(selUser);
if (selUser != null) { // selUser != null의 의미는 회원이 존재하는 상태이다. 
	url = url + "&selUser=" + selUser;
}

//==================================================================================
if (action.equals("main")) {

	ArrayList<MsgSet> datas = mDAO.selectAll(selUser, mcnt);
	ArrayList<UserVO> newUsers = uDAO.selectAll();

	request.setAttribute("datas", datas);
	request.setAttribute("newUsers", newUsers);
	request.setAttribute("selUser", selUser);
	request.setAttribute("mcnt", mcnt);

	pageContext.forward("main.jsp");
}

else if (action.equals("login")) {
	// System.out.println("로그인 액션 진입");
	// System.out.println(uVO.toString());
	if (uDAO.login(uVO)) {
		System.out.println("if문 진입");
		request.setAttribute("selUser", uVO);
		pageContext.forward("main.jsp");
	} else {
		System.out.println("else문 진입");
		out.println("<script>alert('로그인 실패!');history.go(-1)</script>");
	}
} else if (action.equals("logout")) {
	session.invalidate();
	pageContext.forward("control.jsp?action=main");
} else if (action.equals("insert")) {
	if (uDAO.insert(uVO)) {
		pageContext.forward("control.jsp?action=main");
	} else {
		out.println("<script>alert('회원가입 실패!');history.go(-1)</script>");
	}
} else if (action.equals("reg_page")) {
	System.out.println("reg_page 진입 완료");
	pageContext.forward("insertUser.jsp");

}
//==================================================================================
%>