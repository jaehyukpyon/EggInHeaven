
$(document).ready(function () {
	
	/*
	 * 헤더의 <span id="loginid">${pinfo.username }</span> 값을 가져오자
	 */
	$("#board_name").val($("span#loginid").text());
	
	
	$("form[action='add']").submit(function () {
		
		if ($.trim($("input").eq(1).val()) == "") {
			alert("비밀번호를 입력하세요.");
			$("input:eq(1)").focus();
			return false;
		}
		
		if ($.trim($("input").eq(2).val()) == "") {
			alert("제목을 작성하세요.");
			$("input:eq(2)").focus();
			return false;
		}
		
		if ($.trim($("textarea").val()) == "") {
			alert("내용을 작성하세요.");
			$("textarea").focus();
			return false;
		}
	}); // form-submit event ends
	
	
	
	/*
	 * <input type="file" id="upfile" name="board_file" />
	 * <span id="filevalue"></span>
	 */
	$("#upfile").change(function () {
		console.log($(this).val()); // 만약 파일명이 melon.png일 경우, C:\fakepath\melon.png
		var inputfile = $(this).val().split("\\"); 
		/*
		 * Array(3)
		 * 0: "C:"
		 * 1: "fakepath"
		 * 2: "melon.png"
		 */ 
		console.log(inputfile);
		$("#filevalue").text(inputfile[inputfile.length - 1]);
	}); // input[type="file"]-change event ends
	
}); // document.ready ends