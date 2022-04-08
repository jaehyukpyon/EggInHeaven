
var page = 1; // 더 보기에서 보여줄 페이지를 기억할 변수

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");


$(document).ready(function () {
	
	// 글을 삭제하려고 했으나, 글 비밀번호의 불일치.
	if ("${result }" == "passFail") {
		alert("비밀번호가 일치하지 않습니다.");
	}
	
	// 댓글 textarea keyup 이벤트
	let warn_count = 0;	
	$("#content").keyup(function (event) {
		let content = $(this).val();
		
		if (content.length == 0 || content == "") {
			$("#cmt-length").removeClass("btn-warning");
			$("#cmt-length").removeClass("btn-secondary");
			
			$("#cmt-length").addClass("btn-light");
			$("#cmt-length").text("총 50자까지 댓글 작성");
		} else {
			$("#cmt-length").removeClass("btn-warning");
			$("#cmt-length").removeClass("btn-light");	
			
			$("#cmt-length").addClass("btn-secondary");
			$("#cmt-length").text(content.length + " / 50자");
		}
		
		if (content.length > 50) {
			console.log("above 50")
			warn_count++;
			
			if (warn_count == 5) {		
				warn_count = 0;
				// resetCommentTextArea();
				alert("최대 글자 수 50자를 초과했습니다.");
			}
			
			$(this).val($(this).val().substring(0, 50));
			$("#cmt-length").removeClass("btn-light");
			$("#cmt-length").removeClass("btn-secondary");
			
			$("#cmt-length").addClass("btn-warning");
			$("#cmt-length").text("최대 글자 수 50자를 초과했습니다.");
		}
	});
	
	
	// 페이지 맨 처음 로딩 시 실행
	$("#comment table").hide();
	
	
	var count = parseInt($("#count").text());
	
	if (count != 0) {
		getList(1);
	} else {
		$("#message").text("등록된 댓글이 없습니다.");
		
		$("#message").attr("disabled", true);
		$("#message").css("color", "black");
	}
	
	
	// 더 보기를 클릭 시 page 내용이 추가로 보인다.
	$("#message").click(function () {
		getList(++page);
	})
	
});

function resetCommentTextArea() {
	console.log("check");
	
	document.getElementById("content").value = "";

	$("#cmt-length").removeClass("btn-warning");
	$("#cmt-length").removeClass("btn-secondary");
	
	$("#cmt-length").addClass("btn-light");
	$("#cmt-length").text("총 50자까지 댓글 작성");
}


function getList(currentPage) {
	$.ajax({
		type: "post",
		url: "../comment/list",
		data: {
			"board_num": $("#board_num").val(),
			"page": currentPage
		},
		dataType: "json",
		cache : false,
		beforeSend : function(xhr)
        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
        	xhr.setRequestHeader(header, token);			
        },

		success: function (rdata) {
			console.log("success!");
			$("#count").text(rdata.listcount);
			
			if (rdata.listcount > 0) {
				$("#comment table").show();
				$("#comment tbody").empty();
				
				$(rdata.list).each(function () {
					var output = "";
					var img = "";
					
					// num은 그 댓글의 고유 번호
					// id는 그 댓글을 작성한 사람 member_spring1 맴버 아이디.
					
					if ($("span#loginid").text() == this.id) {
						img = "<img src='../resources/image/editing.png' width='17px' class='update' style='margin:0 15px 0 20px' />" + 
						      "<img src='../resources/image/delete-button.png' width='17px' class='remove' />" +
						      "<input type='hidden' value='" + this.num + "' />";
					}
					output += "<tr>";
					output += "<td>" + this.id + "</td>";
					
					// XSS(cross-site scripting): 권한이 없는 사용자가 웹 사이트에 스크립트를 삽입하는 공격 기법
					// 이것을 방지하기 위한 방법으로 2번처럼 <td></td> 영역을 만든 뒤 3번에서 text() 안에 
					// this.content를 넣어 스크립트를 문자열로 만듭니다.
					
					output += "<td></td>"; // 2번
					 // 2번과 3번을 이용하지 않고, 4번을 이용하면 내용에 스크립트가 있는 경우 스크립트가 실행됩니다.
					// output += "<td>" + this.content + "</td>"; 4번
					
					output += "<td>" + this.reg_date + img + "</td>";
					$("#comment tbody").append(output);
					
					// append한 마지막 tr의 두 번째 자식 td를 찾아 text() 메서드로 content를 넣습니다.
					$("#comment tbody tr:last").find("td:nth-child(2)").text(this.content); // 3번
				}); // rdata.list each function ends
				
				if (rdata.listcount > rdata.list.length) { // 전체 댓글 개수 > 현재까지 보여준 댓글 개수
					$("#message").text("댓글 더 보기");
					$("#message").attr("disabled", false);
				} else {
					$("#message").text("end");
					$("#message").attr("disabled", true);
				}
				
				// if rdata.listcount > 0 ends
			}  else { 
				$("#message").text("등록된 댓글이 없습니다.");
				$("#comment tbody").empty();
				$("#comment table").hide();
			}
		} // success function ends
	}); // $.ajax ends
	
} // getList function ends


$("#write").click(function () {
	var buttonText = $(this).text(); // 버튼의 라벨로 add할지, update할지 결정
	var url = "";
	var data = "";
	
	$("#cmt-length").removeClass("btn-warning");
	$("#cmt-length").removeClass("btn-secondary");
	
	$("#cmt-length").addClass("btn-light");
	$("#cmt-length").text("총 50자까지 댓글 작성");
	
	if (buttonText == "등록") {
		url = "../comment/add";
		data = {
			"content": $("textarea#content").val(),
			"id": $("span#loginid").text(),
			"board_num": $("#board_num").val()
		};
	} else { // 댓글 수정의 경우
		url = "../comment/update";
		data = {
			"num": num,
			"content": $("#content").val()
		};
		$("#write").text("등록");
		$("#write").prev().remove(); // 취소 버튼 삭제
		$("#content").trigger("keyup"); // keyup 이벤트 발생
	}
	
	$.ajax({
		type: "post",
		url: url,
		data: data,
		cache : false,
		beforeSend : function(xhr)
        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
        	xhr.setRequestHeader(header, token);			
        },

		success: function (result) {
			$("#content").val("");
			if (result == 1) {
				// page = 1
				$("#comment tbody").empty();
				getList(page); // 등록, 수정완료 후 해당 페이지를 보여줍니다. (수정 완료되도 더보기 초기화 안됨)
			}
		}
	});
});

// 댓글 수정하는 그림 클릭 시 이벤트
$(document).on("click", ".update", function () {
	var originalText = $(this).parent().parent().children("td:eq(1)").text();
	console.log("original text: " + originalText);
	$("textarea#content").val(originalText);
	
	// 혹시 있을 cancel btn 삭제
	// $("button").remove(".cancel");	
	// 취소 버튼 추가
	// $("button#write").before("<button class='btn btn-danger float-right cancel' style='margin-left: 5px;'>취소</button>");
	
	if (!$("#write").prev().is(".cancel")) {
		$("button#write").before("<button class='btn btn-danger float-right cancel' style='margin-left: 5px; background: rgb(255, 60, 60);'>취소</button>");
	}	
	
	// 원래 등록 버튼의 텍스트를 수정 완료로 변경하기
	$("button#write").html("수정 완료"); // 버튼 text 변경 시 html or text
	
	// 선택된 행 빼고 나머지는 흰색, 선택된 행만 그레이
	$("#comment table tr").css("background", "white");
	$(this).parent().parent().css("background", "rgb(224,224,224)");
	
	// $("#comment .update").parent().parent().not(this).css("background", "white");	
	
	// 댓글 작성 textarea keyup 이벤트 강제 발생시키기
	$("#content").trigger("keyup");
	
	// 수정될 댓글의 PK num
	num = $(this).next().next().val(); // 전역으로 선언
	console.log("comment num: " + num + "\n\n");
});

// 댓글 수정하기 클릭하고 취소 버튼을 클릭 시
$(document).on("click", ".cancel", function () {
	$("#comment table tr").css("background", "white");
	
	$("button#write").html("등록");
	$("textarea#content").val("");
	
	$("#content").trigger("keyup");
	
	$("button").remove(".cancel");
});


// 삭제 이미지 클릭시
$(document).on("click", ".remove", function () {
	if (!confirm("해당 댓글을 삭제하시겠습니까?")) {
		return;
	}
	$.ajax({
		type: "post", 
		url: "../comment/delete",
		dataType: "json",
		data: {
			"num": $(this).next().val()
		},
		cache : false,
		beforeSend : function(xhr)
        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
        	xhr.setRequestHeader(header, token);			
        },

		success: function (rdata) {
			if (rdata == 1) {
				alert("댓글이 삭제되었습니다.");
				getList(page);
			}
		}
	});
});



