<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>404.jsp</title>
	
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

	<img src="${pageContext.request.contextPath }/resources/image/forbidden.png" width="100px" /><br />
	<div>
		403 Error<br />
		죄송합니다.<br />
		${key }<br />
	</div>
	
</body>
</html>