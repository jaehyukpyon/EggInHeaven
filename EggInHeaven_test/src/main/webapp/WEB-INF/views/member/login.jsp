<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">


<style>
#box {
	height: 100vh;
}

.box2 {
	position: absolute;
	left: 50%;
	top: 45%;
	transform: translate(-50%, -50%);
	
}

.col-md-4{	
	text-align: center;
	margin-top: 20px;
}

.form-control{
	display: inline-block;
	width:80%;
	height:50px;
	text-align: center;
	
}


a{
	color : white;
	font-size : 20px;
}

#pw_link{
	margin-left: 120px;
	
}



</style>

<script>
if("${result}" == 'joinSuccess'){
	   alert("회원가입을 축하합니다.")
}else  if("${loginfail}" == 'loginFailMsg') {
 	   alert("아이디나 비밀번호 오류 입니다.");
}else if("${disabled}" == "disabled"){
		alert("메일 인증 후 로그인 할 수 있습니다.")
}else if("${result}" == 'newPWSuccess'){
	alert('새 비밀번호를 "${email}"로 보냈습니다. 이메일을 확인해 주세요.')
}
	
</script>


</head>
<body>

	<div class="bg-primary container " id="box">
		<div class="text-center text-light box2">

			<h1 class="display-4">Egg in heaven</h1>
			
				<form action="${pageContext.request.contextPath}/member/loginProcess"
					method="post">
					<div class="col-md-4">
						<input class="form-control" name="id" type="text" 
						required placeholder="ID">
					</div>
					
					<div class="col-md-4">
						<input class="form-control" name="password" type="password" 
						required placeholder="Password">
					</div>
					
					<div class="col-md-4">
           		<input type="checkbox" id="remember" 
           			name="remember-me">
           		<label for="remember">로그인 유지</label>
       		</div>
       		
       		
					
					<div class="col-md-4">
						<a href="join">
							회원가입
						</a>
						<a href="findPW" id="pw_link">
							비밀번호 찾기
						</a>
					</div>
		
					<div class="col-md-4">
						<button style="font-size : 20px"  class="btn btn-outline-secondary form-control">로 그 인</button>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
			</div>				
	</div>


</body>

</html>