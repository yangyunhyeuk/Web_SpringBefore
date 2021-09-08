<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
스크립틀릿으로 작성한 자바코드는 jstl로! 
해결안되는건 커스텀태그 (기능 별 분류 : login, logout)
 -->
	선택한 데이터는 ${param.data}입니다.
	<br>
	<!-- 전 페이지에서 select으로 정한 값을 받아볼 수 있다. -->
	${dataBean.data1}
	<br>
	<!-- 해당 메서드를 뽑아볼 수도 있다. -->
	${dataBean.data2}
	<br> ${dataBean.data1 + dataBean.data2}
	<br> ${dataBean.data1 gt dataBean.data2}
	<br> ${dataBean.data1 > dataBean.data2}
	<br>
	<!-- 태그와 헷갈리기에 gt로 기입하는게 보통이다. -->



</body>
</html>