//검색바
$(".default_option").click(function(){
  $(".dropdown ul").addClass("active");
});

$(".dropdown ul li").click(function(){
  var text = $(this).text();
  $(".default_option").text(text);
  $(".dropdown ul").removeClass("active");
});

function go(page){
	var limit = $('#viewcount').val();
	var data = "limit=" + limit + "&state=ajax&page=" + page;
	ajax(data);
}

//총 2페이지 페이징처리된 경우
//이전 1 2 다음
//현재 페이지가 1페이지인 경우 아래와 같은 페이징 코드가 필요
//<li class="page-item"><a class="page-link gray">이전&nbsp;</a></li>
//<li class="page-item active"><a class="page-link">1</a></li>
//<li class="page-item"><a class="page-link" href="javascript:go(2)">2</a></li>
//<li class="page-item"><a class="page-link" href="javascript:go(2)">&nbsp;다음&nbsp;</a></li>

//현재 페이지가 2페이지인 경우 아래와 같은 페이징 코드가 필요
//<li class="page-item"><a class="page-link" href="javascript:go(1)">이전&nbsp;</a></li>
//<li class="page-item"><a class="page-link" href="javascript:go(1)">1</a></li>
//<li class="page-item active"><a class="page-link">2</a></li>
//<li class="page-item"><a class="page-link gray">&nbsp;다음&nbsp;</a></li>
function setPaging(href, digit){
	active="";
	gray="";
	if(href==""){ //href가 빈문자열인 경우
		if(isNaN(digit)){//이전&nbsp; 또는 다음&nbsp;
		    gray=" gray";	//빈칸 중요
		}else{
			active=" active";
		}
		}
	var output = "<li class='page-item" + active + "'>";
	anchor = "<a class='page-link" +gray + "'" +href + ">" +digit + "</a></li>";
	output += anchor;
	return output;
	}

	


function ajax(data){
	console.log(data)
	output = "";
	$.ajax({
		type : "POST", 
		data : data,
		url : "list_ajax",
		dataType : "json",
		cache : false,
		success : function(data){
			$("#viewcount").val(data.limit);
			$("table").find("font").text("글 개수 : " +data.listcount);

		 if(data.listcount > 0){ //총 갯수가 0보다 큰 경우
			 $("tbody").remove();
			 var num = data.listcount - (data.page -1)*data.limit;
			 console.log(num)
			 var output = "<tbody>";
			 $(data.boardlist).each(
					 function(index, item){
						 output += '<tr><td>' + (num--) + '</td>'
						 blank_count = item.board_re_lev * 2 + 1;
						 blank ='&nbsp;';
						 for(var i=0; i<blank_count; i++){
							 blank+='&nbsp;&nbsp;';
						 }
						 img="";
						 if(item.board_re_lev > 0){
							 img="<img src='../resources/image/AnswerLine.gif'>";
						 }
						 
						 var subject=item.board_subject.replace(/</g,'&lt;')
						 subject=subject.replace(/>/g,'&gt;')
						 
						 output += "<td><div>" + blank + img
						 output += ' <a href="detail?num='+ item.board_num+'">'
						 output += subject + '<span class="gray small">[' + item.cnt + ']</span></a></div></td>'
						 output += '<td><div>' + item.board_name+'</div></td>'
						 output += '<td><div>' + item.board_date+'</div></td>'
						 output += '<td><div>' + item.board_readcount
						         + '</div></td></tr>'
						 
					 })
					 output += "</tbody>"
						 $('table').append(output)//table완성
		
						 $(".pagination").empty(); //페이징 처리 영역 내용 제거
			             output ="";
			             
			             digit = '이전&nbsp;'
			             href="";
			             if(data.page > 1){
			            	 href = 'href=javascript:go(' + (data.page - 1) + ')';
			             }
			             output += setPaging(href, digit);
			             
			             for(var i= data.startpage; i <= data.endpage; i++){
			            	 digit = i;
			            	 href="";
			            	 if(i != data.page){
			            		 href = 'href=javascript:go(' + i + ')';
			            	 }
			            	 output += setPaging(href, digit);
			             }
			             digit = '&nbsp;다음&nbsp;';
			             href="";
			             if(data.page < data.maxpage){
			            	 href ='href=javascript:go(' + (data.page + 1) + ')';
			             }
			             output += setPaging(href, digit);
			             
			 $('.pagination').append(output)
		 }//if(data.listcount)>0 end
	
		}, //success end
		error : function(){
			console.log('에러')
		}
	})
}

$(function(){
	$("button").click(function(){
		location.href="write";
	})
	
	$("#viewcount").change(function(){
		go(1); //보여줄 페이지를 1페이지로 설정합니다. boardList.jsp id="viewcount"
	}); //change end
})