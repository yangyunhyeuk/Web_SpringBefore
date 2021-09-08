<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*, javax.sql.*, javax.naming.*"%>
<!-- javax.sql.* 데이터 소스 임포트 -->
<!--  javax.naming.* initContext 임포트 -->
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//request.getAttribute(name);
//request.setAttribute(name, o);
//request.getParameter(name);
%>

	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		Context initContext = new InitialContext(); // 를 사용하기 위해 javax.sql.*를 임포트해야한다.
		Context envContext = (Context) initContext.lookup("java:/comp/env"); // 실무에선 21,22번째줄에 나눠쓰는 이유는 결합도를 생각한다는 의미  
		DataSource ds = (DataSource) envContext.lookup("jdbc/orcl");
		//내가 설정한 그 이름을 데이터 소스로 받아온다. initContext.lookup()는 반환이 오브젝트타입이라 위에서 캐스팅해야한다. 
		// 프로그래머가 지향하는 낮은 결합도 ★		

		conn = ds.getConnection();
		String sql = "insert into test values(?,?)";
		if (request.getParameter("name") != null) {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("name"));
			pstmt.setString(2, request.getParameter("email"));
			pstmt.executeUpdate();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>


	<form method="post">
		<input type="text" name="name"> <input type="text"
			name="email"> <input type="submit" value="추가">
	</form>

	<hr>

	<%
	try {
		String sql = "select * from test";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			out.println(rs.getString("name") + "님 이메일주소는 " + rs.getString("email") + " <br>");
		}
		rs.close();
		pstmt.close();
		conn.close();
		// close의 경우 커넥션 풀이 해제해주지만 여기서 56,57,58에서 close 작업을 해주는 게 좋다!
	} catch (Exception e) {
		System.out.println(e);
	}
	%>
	<!-- DB 연결이 해제되면 커넥션 객체를 직접 소멸X, 커넥션 풀이 자원을 반납해주는 형태 -->

</body>
</html>