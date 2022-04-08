<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>member_joinForm.jsp</title>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/signup.css" />

</head>
<body>
    <form name="joinform" action="joinProcess" method="post">
		<h1>Register</h1>
		<hr />
		<b>ID</b>
		<input type="text" name="member_id" placeholder="enter ID..." maxLength="12" required />
		<span id="message"></span>
		
		<b>Password</b>
		<input type="password" name="password" placeholder="enter Password..." required />
		
		<b>Name</b>
		<input type="text" name="name" placeholder="enter Name..." maxLength="5" required />
		
		<b>Age</b>
		<input type="text" name="age" placeholder="enter Age..." maxLength="3" required />
		
		<b>Gender</b>
		<div>
			<input type="radio" name="gender" value="남" checked /><span>male</span>
			<input type="radio" name="gender" value="여" /><span>female</span>
		</div>
		
		<b>Email address</b>
		<input type="text" name="email" placeholder="enter Email address..." maxLength="30" required />
		<span id="email_message"></span>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
		<div class="clearfix">
			<button type="submit" class="submitbtn">register</button>
			<button type="reset" class="cancelbtn">clear all</button>
		</div>
	</form>
	
	
	<script>
		$(document).ready(function () {
			var checkid = false;
			var checkemail = true;
			
			// id 부분
			$("input:eq(0)").on("keyup", function () {
				$("#message").empty(); // 처음에 pattern에 적합하지 않은 경우 메시지 출력 후 적합한 데이터를 입력해도 계속 같은 데이터
				$("#message").html("");				
				
				// [A-Za-z0-9_]는 \w와 동일.
				var pattern = /^\w{5,12}$/; // {5,12} 붙여써야 한다. {5, 12}와 같이 작성 시 작동 안됨.
				var id = $("input:eq(0)").val();
				if (!pattern.test(id)) {
					$("#message").css("color", "red").css("background", "rgb(255, 255, 255)").html("알파벳 대소문자, 숫자, '_'를 포함하여 5~12 글자로 입력해주세요.");
					if ($("input:eq(0)").val() == "") {
						$("#message").empty();
					}
					checkid = false;
					return;
				}
				
				$.ajax({
					url: "idcheck",
					data: { "member_id": id }, // id=eggjam82
					success: function (resp) {
						console.log(resp);
						console.log(typeof resp);
						// 만약 eggja 치면 (db에 eggja가 없음) -1, string
						// 만약 eggjam82치면 (db에 eggjam82가 존재) 1, string
						if (resp == -1) {
							$("#message").css("color", "green").css("background", "rgb(255, 255, 255)").html("사용 가능한 아이디입니다.");
							checkid = true;
						} else if (resp == 1) {
							$("#message").css("color", "rgb(255, 75, 0)").css("background", "rgb(255, 255, 207)").html("사용 중인 아이디입니다.");
							checkid = false;
						}
					}
				}); // $.ajax ends
			}); // input-id keyup event ends
			
			
			// email 부분
			/* $("input:eq(6)").on("keyup", function () {
				$("#email_message").empty();
				
				// +는 1회 이상 반복을 의미 {1,}와 동일
				var pattern = /^\w+@\w+[.]\w{3}$/;
				var email = $("input:eq(6)").val();
				
				if (!pattern.test(email)) {
					$("#email_message").css("color", "red").html("이메일 형식에 맞지 않습니다.");
					checkmail = false;
				} else {
					$("#email_message").css("color", "green").html("사용 가능한 이메일입니다.");
					checkemail = true;
				}
			}); */ // input-email keyup event ends
			
			
			$("form").submit(function () {
				if (!checkid) {
					alert("사용 가능한 아이디로 다시 입력하세요.");
					$("input:eq(0)").val("").focus();
					return false;
				}
				
				if (!$.isNumeric($("input[name='age']").val())) {
					alert("나이는 숫자만 입력할 수 있습니다.");
					$("input[name='age']").val("").focus();
					return false;
				}
				
				/* if (!checkemail) {
					alert("이메일 형식이 올바르지 않습니다..");
					$("input:eq(6)").val("").focus();
					return false;
				} */
			}); // form.submit event ends
			
		}); // document.ready ends
	</script>
	
</body>
</html>