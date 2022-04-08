<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>메일 인증</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
</head>
<body>

	<div class="jumbotron w-100 py-5 mx-auto">
		<b>${memberId}님 가입을 축하 드립니다.</b>
		<h1>${memberEmail}</h1>
		으로 메일을 보냈습니다.
		<h3>메일확인 후 인증버튼을 눌러주세요!</h3>
	</div>


</body>
</html>