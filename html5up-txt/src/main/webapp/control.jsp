<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.message.*" errorPage="error.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="messageDAO" class="model.message.MessageDAO" />
<jsp:useBean id="messageVO" class="model.message.MessageVO" />
<jsp:setProperty property="*" name="messageVO"/>
<!-- => 세터로 자동으로 값을 세팅해주어, 입력 시 값만 잘 주면 된다! -->

<%
	// 컨트롤러를 호출했을때의 요청 파라미터를 분석
	String action=request.getParameter("action");
	System.out.println(action);

	//======================================================================
	if(action.equals("list")){
		ArrayList<MessageVO> datas=messageDAO.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("list.jsp");
	}
	//======================================================================
	else if(action.equals("insert")){
		if(messageDAO.insertDB(messageVO)){
			response.sendRedirect("control.jsp?action=list");
		}
		else{
			throw new Exception("DB 추가 에러 발생!");
		}
	}
	//======================================================================
	else if(action.equals("delete")){
		if(messageDAO.deleteDB(messageVO)){
			response.sendRedirect("control.jsp?action=list");
		}
		else{
			throw new Exception("DB 변경 삭제 발생!");
		}
	}
	//======================================================================
	else if(action.equals("update")){
		if(messageDAO.updateDB(messageVO)){
			response.sendRedirect("control.jsp?action=list");
		}
		else{
			throw new Exception("DB 변경 오류 발생!");
		}
	}
	//======================================================================
	else if(action.equals("edit")){
		if(request.getParameter("writer").equals("root")){
			MessageVO data=messageDAO.getDBData(messageVO);
			request.setAttribute("data", data);
			pageContext.forward("edit.jsp");
			// 사용자가 잘못된 mnum를 건네는 경우는 없다!
			// -> 오류페이지로 처리!
		}		
		else{
			out.println("<script>alert('관리자가 아닙니다!');history.go(-1)</script>");
		}
	}
	//======================================================================
	else{
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