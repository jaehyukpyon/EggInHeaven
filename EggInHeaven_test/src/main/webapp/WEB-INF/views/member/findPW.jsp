<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>비밀번호 찾기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>	
</head>

<style>
	#box{
		width:700px;
		position: absolute;
		left: 50%;
		top: 45%;
		transform: translate(-50%, -50%);
	}
	
	.col-md-4{	
		text-align: center;
		margin-top: 30px;
	}

	.form-control{
		display: inline-block;
		width:80%;
		height:50px;
	
	}
	
	#box2{
		padding:30px;
		color:white;
	}
	.btn-col{

		text-align: center;
		margin-top: 50px;

		
	}
	
	a{
		color : white;
		font-size : 20px;
	}
	
	span{
		float : left;
		margin-left : 100px;
	}
</style>


<script>

$(function() {
	var checkid = false;
	
	$("input:eq(0)").on('keyup',
		function() {	
			$("#message_id").empty();
			//[A-Za-z0-9_]의 의미가 \w
			var pattern = /^\w{5,12}$/;
			var id = $("input:eq(0)").val();
			if (!pattern.test(id)) {
				$("#message_id").css('color', 'white')
							 .html("아이디 형식은 영문자 숫자 _로 5~12자 입니다.");
				checkid = false;
				return;
			}else{
				checkid = true;
				return;
			}
							
		}
	)
	
	
	$("form").submit(function() {
			
			if(!checkid){
				alert("유효한 id로 입력하세요.");
				$("input:eq(0)").val('').focus();
				return false;
			}
			
			
		});//submit
		

});

	if("${result}" == 'findIdFail'){
		alert("존재하지 않거나 메일인증이 되지 않은 회원입니다.")
	}else if("${result}" == 'newPWFail'){
		alert("사이트 내부 문제로 인해 새 비밀번호 발급에 실패하였습니다.")
	}


</script>
<body>

<div class="bg-primary" id="box">
	<div id="box2">
		<h1>비밀번호 찾기</h1>
		<h4>새로운 비밀번호를 발급 받을 아이디를 입력하세요.</h4>
		<form action="newPW" method="post">
	
			<div class="col-md-4">
				<input class="form-control" name="id" type="text" maxlength="15"
				required placeholder="ID를 입력해 주세요."><br>
				<span id="message_id"></span>
			</div>
			
			<div class="btn-col">
				<button style="font-size : 20px; font-weight: bold; color:white;"  
					class="btn btn-info form-control">비밀번호 찾기</button>
			</div>
			
			<div class="col-md-4">
				<a href="login">
					로그인 페이지로
				</a>
			</div>
			
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>
</div>


</body>
</html>