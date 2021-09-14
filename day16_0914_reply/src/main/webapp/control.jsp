<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,model.msg.*,model.user.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




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
//===========★★★★★★이전 페이지에서 넘긴 값을 보관하는 역할을 한다★★★★=====================================================
String action = request.getParameter("action"); // 액션 받을 변수 생성
String url = "control.jsp?action=main";
String mcntt = request.getParameter("mcnt"); // 메인 페이지에서 더 보기를 누르면 다음과 같이 mcnt의 값이 증가된 상태를 받아온다. 
// <a href="control.jsp?action=main&mcnt=${mcnt+1}&selUser=${selUser}">[더보시려면 클릭]&gt;&gt;</a>
int mcnt = 0;
if (mcntt != null) { // 더보기를 클릭하지 않은 경우 2개 값만 볼 수 있게 mcnt 초기값을 2로 설정
	mcnt = Integer.parseInt(mcntt); // getParam으로 받아온 String 값을 정수형으로 형변환해준 뒤 값을 저장한다.
}

url = url + "&mcnt=" + mcnt; // url에 증가값을 표시한 뒤 url 변수 공간에 저장한다. 
String selUser = request.getParameter("selUser");
if (selUser != null) { // selUser != null의 의미는 회원이 존재하는 상태이다. 
	url = url + "&selUser=" + selUser;
}

//selUser의 첫번째 역할 : 내 글을 볼 수 있게 하는 역할
//selUser의 두번째 역할  : 다른 사람의 글을 검색하여 볼 수 있게 하는 역할
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
	if (uDAO.login(uVO)) {
		System.out.println("if문 진입");
		session.setAttribute("seUser", uVO.getUuid());
		response.sendRedirect(url);
	} else {
		System.out.println("else문 진입");
		out.println("<script>alert('로그인 실패!');history.go(-1)</script>");
	}
} else if (action.equals("logout")) {
	session.invalidate();
	response.sendRedirect("control.jsp?action=main");
}
// 회원가입_insert
else if (action.equals("insert")) {
	if (uDAO.insert(uVO)) {
		pageContext.forward("control.jsp?action=main");
	} else {
		out.println("<script>alert('회원가입 실패!');history.go(-1)</script>");
	}
} else if (action.equals("reg_page")) {
	System.out.println("reg_page 진입 완료");
	pageContext.forward("insertUser.jsp");

} else if (action.equals("minsert")) {
	System.out.println("minsert 액션 진입 : " + mVO);
	if (mDAO.insert(mVO)) {
		pageContext.forward("control.jsp?action=main");
	} else {
		out.println("<script>alert('댓글작성 실패!');history.go(-1)</script>");
	}
} else if (action.equals("rinsert")) {
	System.out.println("minsert 액션 진입 : " + rVO);
	if (rDAO.insert(rVO)) {
		response.sendRedirect(url);
		//pageContext.forward("control.jsp?action=main");
	} else {
		out.println("<script>alert('대댓글작성 실패!');history.go(-1)</script>");
	}
} else if (action.equals("mdelete")) {
	if (mDAO.delete(mVO)) {
		response.sendRedirect(url);
	} else {
		out.println("<script>alert('댓글 삭제 실패!');history.go(-1)</script>");
	}
}

//==================================================================================
%>