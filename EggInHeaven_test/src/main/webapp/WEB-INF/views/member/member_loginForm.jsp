<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>member_loginForm.jsp</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
		rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		
	<style>
    	.container {
    		width: 500px;
    		margin: 3em auto;
    		border: 1px solid lightgray;
    	}
    </style>
	
</head>

<body>

	<div class="container">
		<form action="${pageContext.request.contextPath }/member/loginProcess" method="post" class="border-light p-5">
			<p class="h4 mb-4 text-center">Login</p>
			
			<div class="form-group">
				<label for="id">ID</label>
				<input type="text" class="form-control" placeholder="type your ID..." name="member_id" id="member_id" required />
			</div>
			
			<div class="form-group" style="margin-top: 10px;">
				<label for="password">Password</label>
				<input type="password" class="form-control" placeholder="type your Password..." name="password" id="password" required />
			</div>
			
			<div class="form-check" style="overflow: hidden; margin-top: 10px;">
    			<input type="checkbox" class="form-check-input" name="remember-me" id="remember-me" />
    			<label class="form-check-label" for="remember-me">Remember Me!</label>
 			</div>
 			
 			<br />
 			
 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 			
 			<button type="submit" class="btn btn-success">login</button>
 			<button type="button" class="btn btn-light" id="registerbtn">register</button>
		</form>
	</div>
	
	<script>
	
		$(document).ready(function () {
			var result = "${result }";
			console.log("typeof result: " + typeof result);
			
			if (result == "joinSuccess") {
				alert("회원 가입이 완료되었습니다. 이메일을 확인해 보세요.");	
			} else if (result == "0") {
				alert("비밀번호가 일치하지 않습니다.");	
			} else if (result == "-1") {
				alert("입력한 아이디는 존재하지 않습니다.");		
			} else if ("${loginfail }" == "loginFailMsg") {
				alert("아이디 혹은 비밀번호 오류입니다.");
			}
			
			$("button#registerbtn").click(function () {
				location.href = "${pageContext.request.contextPath }/member/join";
			});
		});
	</script>
	
</body>

</html>