<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>common.jsp</title>
	
	<style>
		body {
			width: 500px;
			margin: 3em auto;
		}
		div {
			color: red;
			font-size: 30px
		}
		span {
			font-size: 1.5em;
			color: orange;
		}
	</style>
</head>
<body>
	<img src="${pageContext.request.contextPath }/resources/image/error-computer.png" width="100px" /><br />
	<div>
		죄송합니다.<br />
		${url } 처리에 오류가 발생했습니다. <br />
		오류 내용: ${exception }
	</div>
	<span>서비스 이용에 불편을 드려 죄송합니다.</span>
</body>
</html>