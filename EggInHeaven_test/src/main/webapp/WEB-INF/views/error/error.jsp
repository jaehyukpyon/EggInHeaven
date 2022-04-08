<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오류처리 페이지</title>
	<style>
		b{color:orange}
		body{text-align:center}
	</style>
</head>
<body>
	죄송합니다.<br>
	<img src="${pageContext.request.contextPath}/resources/image/delete.png" width="100px"><br>
	요청하신 <b>${url}</b>처리에 오류가 발생했습니다.
	<hr>
	${message}
</body>
</html>