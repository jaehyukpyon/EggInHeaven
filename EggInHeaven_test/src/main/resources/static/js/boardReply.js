/**
 * 
 */

console.log("boardReply.js file loaded...");

const token = $("meta[name='_csrf']").attr("content");
const header = $("meta[name='_csrf_header']").attr("content");

const boardReply = (function () {
	
	function getList (param, callback, error) {
		let recipe_num = param.recipe_num;
		let page = param.page || 1;
		
		$.getJSON("/myhome4/boardReplies/pages/" + recipe_num + "/" + page,
				
					function (data) {
						console.log("boardReply.js의 getList() 호출 후 리턴 값...");
						console.log(data);
						
						if (callback) {
							callback(data);
						}
					}).fail(function (xhr, status, err) {
						if (error) {
							error();
						}
					});
	}
	
	function add (reply, callback, error) {
		console.log("add reply.....");
		
		$.ajax({
			type : "post",
			url : "/myhome4/boardReplies/new",
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			beforeSend : function (xhr) {   
				// 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
	        	xhr.setRequestHeader(header, token);			
	        },
			success : function (result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function (xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function update (reply, callback, error) {
		console.log("reply_num: " + reply.reply_num);
		
		$.ajax({
			type : "put",
			url : "/myhome4/boardReplies/" + reply.reply_num,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			beforeSend : function (xhr) {   
				// 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
	        	xhr.setRequestHeader(header, token);			
	        },
			success : function (result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function (xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}
	
	function remove (reply_num, callback, error) {
		$.ajax({
			type : "delete",
			url : "/myhome4/boardReplies/" + reply_num,
			contentType : "application/json; charset=utf-8", // 얘 없으면 에러난다...
			beforeSend : function (xhr) {   
				// 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
	        	xhr.setRequestHeader(header, token);			
	        },
			success : function (result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function (xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}
	
	function getFullYmdStr (timeStamp) { 
	    // 년 월 일 시 분 초 문자열 생성
	    var d = new Date(timeStamp);
	    // return d.getFullYear() + "년 " + (d.getMonth()+1) + "월 " + d.getDate() + "일 " + d.getHours() + "시 " + d.getMinutes() + "분 " + d.getSeconds() + "초 " +  '일월화수목금토'.charAt(d.getUTCDay())+'요일';
	    return d.getFullYear() + "년 " + (d.getMonth()+1) + "월 " + d.getDate() + "일 " + d.getHours() + "시 " + d.getMinutes() + "분 ";
	}
	
	return {
		getList,
		add,
		update,
		remove,
		getFullYmdStr
	}
	
})();