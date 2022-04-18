	$(function() {
		var checkid = true;
		var checkemail = true;
		var checkpass = true;

		
		$("input[name=id]").on('keyup',
			function() {	
				$("#message_id").empty();
				//[A-Za-z0-9_]의 의미가 \w
				var pattern = /^\w{5,12}$/;
				var id = $("input[name=id]").val();
				if (!pattern.test(id)) {
					$("#message_id").css('color', 'red')
								 .html("영문자 숫자 _로 5~12자 가능합니다.");
					checkid = false;
					console.log(checkid);
					return;
				}
				
				$.ajax({
					url : "idcheck",
					data : {"id" : id},
					success : function(resp) {
						if(resp == -1) {//db에 해당 id가 없는 경우
							$("#message_id").css('color','green').html("사용 가능한 아이디 입니다.");
							checkid=true;
						}else{//db에 해당 id가 있는 경우(0)
							$("#message_id").css('color','red').html("사용중인 아이디 입니다.");
							checkid=false;
						}
					}
				})
								
			}
		)
		
		
		$("input[name=password]").on('keyup',
			function() {
			var pw = $("input[name=password]").val();
			var pw2 = $("#check").val();
			$("#message_pw").empty();
			
			if(pw != pw2){
				$("#message_pw").css('color', 'red')
				 .html("비밀번호가 일치하지 않습니다.");
			}else{
				$("#message_pw").css('color', 'green')
				 .html("비밀번호가 일치합니다.");
			}
		})
		
		$("#check").on('keyup',
			function(){
			var pw = $("input[name=password]").val();
			var pw2 = $("#check").val();
			$("#message_pw").empty();
			if(pw != pw2){
				$("#message_pw").css('color', 'red')
				 .html("비밀번호가 일치하지 않습니다.");
				checkpass = false;
			}else{
				$("#message_pw").css('color', 'green')
				 .html("비밀번호가 일치합니다.");
				checkpass = true;
			}
		})
		
		
		$("input[name=email]").on('keyup',
				function(){
					$("#message_email").empty();
					//[A-Za-z0-9_]와 동일한 것이 \w입니다.
					//+는 1회 이상 반복을 의미하고 {1,}와 동일합니다.
					//\w+는 [A-Za-z0-9_]를 한개 이상 사용하라는 의미입니다.
					var pattern = /^\w+@\w+[.]\w{3}$/;
					var email = $("input[name=email]").val();
					if (!pattern.test(email)) {
						$("#message_email").css('color', 'red')
										   .html("이메일 형식이 맞지 않습니다.");
						checkemail=false;
					}else{
						$("#message_email").css('color', 'green')
						   					.html("이메일 형식에 맞습니다.");
						checkemail=true;
					}
		});
		
		
		$("form").submit(function() {
			
			if(!checkid){
				alert("사용가능한 id로 입력하세요.");
				$("input[name=id]").val('').focus();
				return false;
			}
			
			if(!checkemail){
				alert("유효한 이메일주소를 입력하세요.");
				$("input[name=email]").val('').focus();
				return false;
			}
			
			if(!checkpass){
				alert("비밀번호가 일치하지 않습니다.");
				$("input[name=password]").val('').focus();
				return false;
			}
			
			
		});//submit
		
		
		
	})
