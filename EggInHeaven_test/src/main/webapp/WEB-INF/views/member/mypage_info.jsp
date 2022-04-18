<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>마이페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/join.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">



<style>
      /*수정 폼*/

      .modify {
        background-color: #fefefe;
        margin: 5% auto 15% auto;
        /* 5% from the top, 15% from the bottom and centered */
        width: 700px; /* Could be more or less, depending on screen size */
        padding: 16px;
      }

      form {
        display: flex;
      }

      .col-md-4 {
        margin-top: 20px;
        margin-bottom: 40px;
      }

      .col-md-4:nth-child(1) {
        margin-top: 50px;
      }

      .form-control {
        display: inline-block;
        width: 80%;
        height: 50px;
        text-align: center;
      }

      .mr-2 {
        width: 7%;
      }

      .g_box {
        display: inline-block;
        width: 80%;
        height: 50px;
        text-align: center;
        justify-content: center;
      }

      input[type="radio"] {
        width: 5%;
        display: inline-block;
        border: none;
      }

      b {
        margin-right: 50px;
      }

      span {
        float: left;
        margin-left: 100px;
      }

      .profile {
        margin: 5% 0 5% 10%;
      }
      
      #profile_img{
      	border-radius: 50%;
      	width:225px; 
      	height:225px;
      }
</style>

</head>
<body>

				<h1>회원 정보 변경</h1>
				<form action="updateProcess" name="modifyform" method="post"
					enctype="multipart/form-data">
					
					<div class="modify">
					
					<div class="profile">
						<label for="profile"> 

						<c:if test='${empty memberInfo.profile_img}'>
							<c:set var='src' value='${pageContext.request.contextPath}/resources/image/profile.jpg' />
						</c:if>
						<c:if test='${!empty memberInfo.profile_img}'>
							<c:set var='src' value='${pageContext.request.contextPath}/profile${memberInfo.profile_img}' />
						</c:if>
						<img id="profile_img"
							src="${src}" 
							alt="profile" /> 
						
						<input type="file"
							style="display: none" id="profile" name="upload"
							accept="image/*" />
						<span id="filevalue" style="display: none">${memberInfo.profile_img}</span>
						</label>
					</div>
					
						<div class="col-md-4">
							<button class="btn btn-primary mr-2" type="button">ID</button>
							<input class="form-control" type="text" name="id" maxlength="15"
								placeholder="아이디를 입력하세요." value="${Id}" readOnly /><br /> <span
								id="message_id"></span>
						</div>

						<div class="col-md-4">
							<button class="btn btn-primary mr-2" type="button">PW</button>
							<input class="form-control" type="password" name="password"
								placeholder="비밀번호를 입력하세요." value="${memberInfo.password}" required /><br />
						</div>

						<div class="col-md-4">
							<button class="btn btn-primary mr-2" type="button">PW</button>
							<input class="form-control" type="password" id="check"
								placeholder="비밀번호를 한번 더 입력하세요." value="${memberInfo.password}" required /><br />
							<span id="message_pw"></span>
						</div>

						<div class="col-md-4">
							<button class="btn btn-primary mr-2" type="button">M</button>
							<input class="form-control" type="text" name="email"
								placeholder="이메일을 입력하세요." value="${memberInfo.email}" readOnly/><br /> <span
								id="message_email"></span>
						</div>

						<div class="col-md-4">
							<button class="btn btn-primary mr-2" type="button">N</button>
							<input class="form-control" type="text" name="name"
								maxlength="15" placeholder="이름을 입력하세요." 
								value="${memberInfo.name}" required />
						</div>

						<div class="col-md-4">
							<button class="btn btn-primary mr-2" type="button">G</button>
							<div class="g_box">
								<input type="radio" name="gender" value="남" checked /><b>남자</b>
								<input type="radio" name="gender" value="여" /><b>여자</b>
							</div>
						</div>
						
						<div class="col-md-4">
							<button style="font-size: 20px" type="submit"
							class="btn btn-primary form-control">
							정보 수정</button>
						</div>
						
					</div>
					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
			
			
	<script>
	var check = 0;
	//성별 체크
		$("input[value='${memberInfo.gender}']").prop('checked',true);
	
		$('input[type=file]').change(function(event){
			var inputfile = $(this).val().split('\\');
			var filename=inputfile[inputfile.length -1];
			var pattern = /(gif|jpg|jpeg|png)$/i;
			check++;
			
			if (pattern.test(filename)){
				var reader = new FileReader();
				reader.readAsDataURL(event.target.files[0]);
				

				reader.onload = function(event){
					$('#profile_img').prop('src',event.target.result);
				}
					

			}else{
				alert('확장자는 gif, jpg, jpeg, png가 가능합니다.');
				$(this).val("");
			}
		
		})
		

		
		$("form[name=modifyform]").submit(function() {
			if (check == 0) {
				value = $('#filevalue').text();
				html = "<input type='hide' value='" + value + "' name='check'>";
				$(this).append(html);
			}
		})
	</script>
</body>

</html>