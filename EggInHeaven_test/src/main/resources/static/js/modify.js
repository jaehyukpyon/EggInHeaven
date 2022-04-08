
$(document).ready(function () {
	var check = 0;
	
	$("form[name='modifyform']").submit(function (e) {
		
		if ($.trim($("#board_subject").val()) == "") {
			alert("제목을 입력하세요.");
			$("#board_subject").focus();
			return false;
		}
		
		if ($.trim($("#board_content").val()) == "") {
			alert("내용을 입력하세요.");
			$("#board_content").focus();
			return false;
		}
		
		if ($.trim($("#board_pass").val()) == "") {
			alert("비밀번호를 입력하세요.");
			$("#board_pass").focus();
			return false;
		}
		
		// 한 번도 변경하지 않으면 $("#filevalue").text()의 파일명을 전송한다.
		if (check == 0) {
			value = $("span#filevalue").text();
			html = "<input type='hidden' value='" + value + "' name='check' />";
			console.log(html);
			$(this).append(html);
		}
	});
	
	function show() {
		// 파일 이름이 있는 경우, remove 이미지를 보이게 하고,
		// 파일 이름이 없는 경우, remove 이미지를 보이지 않게 한다.
		if ($("span#filevalue").text() == "") {
			$("img.remove").css("display", "none");
		} else {
			$("img.remove").css({
				"display": "inline-block",
				"position": "relative",
				"top": "0px"
			});
		}
	} // show function ends
	
	show();
	
	$("input#upfile").change(function () {
		check++;
		var inputfile = $(this).val().split("\\"); // C:\fakepath\filename.png
		$("span#filevalue").text(inputfile[inputfile.length - 1]);
		show();
		console.log(check);
	});
	
	
	$("img.remove").click(function () {
		$("span#filevalue").text("");
		$(this).css("display", "none");
	});			
}); // document.ready ends