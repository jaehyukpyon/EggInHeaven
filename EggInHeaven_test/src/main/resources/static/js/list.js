
$(document).ready(function () {	

	$("button").click(function () {
		location.href = "/myhome4/board/write";
	});
	
	$("#viewcount").change(function () {
		go(1); // 보여줄 페이지를 1 페이지로 설정한다.
	});
	
	window.addEventListener("offline", () => {
		alert("인터넷 연결이 끊겼습니다.");
		/* 연결 -> 끊김으로 변경될 때 호출 */
	});
});


function go(page) {
	var limit = $("#viewcount").val();
	var data = "limit=" + limit + "&page=" + page;
	ajax(data);
}

function setPaging(href, digit) {
	var active = "";
	var gray = "";
	
	if (href == "") {
		if (isNaN(digit)) {// 이전&nbsp; OR 다음&nbsp;
			gray = " gray";
		} else {
			active = " active";
		}
	}
	
	var output = "<li class='page-item" + active + "'>";
	var anchor = "<a class='page-link" + gray + "'" + href + ">" + digit + "</a></li>";
	output += anchor;
	return output;
}

function ajax(sdata) {
	console.log(sdata);
	var output = "";
	
	$.ajax({
		type: "GET",
		data: sdata,
		url: "../board/list_ajax",
		dataType: "json",
		cache: false,		
		success: function (data) {
			$("#viewcount").val(data.limit);
			$("table").find("font").text("글 개수: " + data.listcount);
			
			if (data.listcount > 0) {
				console.log("data.listcount: " + data.listcount);
				
				$("tbody").remove();
				var num = data.listcount - (data.page - 1) * data.limit;
				console.log(num);
				
				var output = "<tbody>";
				
				$(data.boardlist).each(function (index, item) {
					output += "<tr><td>" + (num--) + "</td>";
					var blank_count = item.board_RE_LEV * 2 + 1;
					var blank = "";
					
					for (var i = 0; i < blank_count; i++) {
						blank += "&nbsp;&nbsp;";
					}
					var img = "";
					if (item.board_re_lev > 0) {
						img = "<img src='../resources/image/reply.png' />&nbsp;";
					}
					
					output += ("<td><div>" + blank + img);
					output += "<a href='detail?num=" + item.board_NUM + "'>";
					output += item.board_SUBJECT.replace(/</g, "&lt;").replace(/>/g, "&gt;") + "</a><span class='gray small'>&nbsp;댓글: [" + item.commentsCount + "]</span></div></td>";
					output += "<td><div>" + item.board_NAME + "</div></td>";
					output += "<td><div>" + item.board_DATE + "</div></td>";
					output += "<td><div>" + item.board_READCOUNT + "</div></td>";
					output += "</tr>";
				});
				output += "</tbody>";
				$("table").append(output);
				
				
				// 아래 페이징 처리부분
				$(".pagination").empty();
				output = "";
				var digit = "이전&nbsp;";
				var href = "";
				
				if (data.page > 1) {
					href = "href=javascript:go(" + (data.page - 1) + ")";
				}
				output += setPaging(href, digit);
				
				for (var i = data.startpage; i <= data.endpage; i++) {
					digit = i;
					href = "";
					if (i != data.page) {
						href = "href=javascript:go(" + i + ")";
					}
					output += setPaging(href, digit);
				}
				
				digit = "&nbsp;다음&nbsp;";
				href = "";
				if (data.page < data.maxpage) {
					href = "href=javascript:go(" + (data.page + 1) + ")";
				}
				output += setPaging(href, digit);
				
				$(".pagination").append(output);				
			}
		},
		error: function () {
			console.log("에러.");
		}
	});
} // function ajax ends
