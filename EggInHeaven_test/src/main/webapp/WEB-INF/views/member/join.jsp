<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>회원가입</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>	
<script src="${pageContext.request.contextPath}/resources/js/join.js"></script>	

	



<style>
.box2 {
	position: absolute;
	left: 50%;
	top: 45%;
	transform: translate(-50%, -50%);
}

h1{
	margin-top : 120px;
}

.col-md-4 {
	margin-top: 20px;
	margin-bottom: 40px;
}

.col-md-4:nth-child(1){
	margin-top: 50px;
}

.form-control {
	display: inline-block;
	width: 80%;
	height: 50px;
	text-align: center;
}

form {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid lightgray;
	width: 700px; /* Could be more or less, depending on screen size */
	padding: 16px;
}

.mr-2 {
	width: 7%;

}

.g_box{
	display: inline-block;
	width: 80%;
	height: 50px;
	text-align: center;
	justify-contents:center;
}

input[type=radio] {
	width: 5%;
	display: inline-block;
	border: none;
	
}

b{
	margin-right : 50px;
}

span{
	float : left;
	margin-left : 100px;
}

</style>



</head>
<body>

	<div class="text-center box2">
		<h1 class="display-5">Egg in heaven</h1>
		<form name="joinform" action="joinProcess" method="post">

			<div class="col-md-4">
				<button class="btn btn-primary mr-2" type="button">ID</button>
				<input class="form-control" type="text" name="id" maxlength="15"
				placeholder="아이디를 입력하세요." required><br>
				<span id="message_id"></span>
			</div>
			
			<div class="col-md-4">
				<button class="btn btn-primary mr-2" type="button">PW</button>
				<input class="form-control" type="text" name="password" 
				placeholder="비밀번호를 입력하세요." required><br>

			</div>
			
			<div class="col-md-4">
				<button class="btn btn-primary mr-2" type="button">PW</button>
				<input class="form-control" type="text"
				placeholder="비밀번호를 한번 더 입력하세요." required><br>
				<span id="message_pw"></span>
			</div>
			
			<div class="col-md-4">
				<button class="btn btn-primary mr-2" type="button">M</button>
				<input class="form-control" type="text" name="email" 
				placeholder="이메일을 입력하세요." required><br>
				<span id="message_email"></span>
			</div>
			
			<div class="col-md-4">
				<button class="btn btn-primary mr-2" type="button">N</button>
				<input class="form-control" type="text" name="name" maxlength="15"
				placeholder="이름을 입력하세요." required>
			</div>
			
			<div class="col-md-4">
				<button class="btn btn-primary mr-2" type="button">G</button>
				<div class="g_box">
				<input type="radio" name="gender" value="남" checked><b>남자</b>
				<input type="radio" name="gender" value="여"><b>여자</b>
				</div>
			</div>
			

			<div class="col-md-4">
				<button style="font-size: 20px" type="submit"
					class="btn btn-primary form-control">회원가입</button>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
	</div>




</body>

</html>