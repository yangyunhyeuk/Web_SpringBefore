<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품을 구매예정목록에 추가하는 페이지</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	String protein = request.getParameter("protein");
	String cnt = request.getParameter("cnt");


	

	// 세션에게 배열을 설정
	// -> 배열 => 배열리스트(컬렉션)
	ArrayList<String> list = (ArrayList)session.getAttribute("list");
	if (list == null) {
		list = new ArrayList<String>();
		session.setAttribute("list", list);
	}
	list.add(protein);

	ArrayList<String> cntlist = (ArrayList)session.getAttribute("cntlist");
	if (cntlist == null) {
		cntlist = new ArrayList<String>();
		session.setAttribute("cntlist", cntlist);
	}
	cntlist.add(cnt);
	%>

	<script type="text/javascript">
	alert("<%=protein%>(이)가 <%=cnt%>개 추가되었습니다!");
		history.go(-1);
	</script>



</body>
</html>