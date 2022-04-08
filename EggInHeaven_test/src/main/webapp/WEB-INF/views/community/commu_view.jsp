<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>

<title>상세페이지</title>
<%-- <jsp:include page = "header.jsp" /> --%>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	<link class="cssdeck" rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
 <script src="../resources/js/view.js" charset="UTF-8"></script>  
<style>
h1{font-size:2.5rem; text-align:center; height:100px}
.container{width:80%}
.form-group img{width:500px; height:300px; margin-left:27%;}
b{margin-left:43%;}
textarea {resize:none}
#myModal {
	display:none;
}
#message{text-align:center;
         margin-top:80px}
</style>
<script>

	var result="${result}";
	if(result == 'passFail') {
		alert("비밀번호가 일치하지 않습니다.");
	}
	
	
	$(function() {
		$("form[action=delete]").submit(function() {
			if ($("#commu_pass").val() == '') {
				alert("비밀번호를 입력하세요");
				$("#commu_pass").focus();
				return false;
			}
		})
	})

</script>
</head>
<body>
	<%-- <input type="hidden" id="loginid" value="${id}" name="loginid"> --%>
	<div class="container">
		
			
				<h1><c:out value="${commudata.commu_subject}"/></h1>
				
			
			
				
				<div >
				<p>[ 작성자 ]<span id="member_id">${commudata.member_id}</span> </p>
				<b style="float:right;color:#007bff;">(${count})</b>
				<p>[ 작성일 ] ${commudata.commu_date}</p>
				
				</div>
			
			<hr>
			
			<div class="form-group">
	 	
	 		
	 		<c:if test="${!empty commudata.commu_img}">
	 		<%-- 사진첨부한 경우 --%>
	 			<img src="../upload${commudata.commu_img}" alt="파일첨부">
	 			</c:if>
	 			
	 			<c:if test="${empty commudata.commu_img}">
						<%-- 파일첨부 하지 않은 경우 --%>
						<td></td>
					</c:if>		
	 		
	 		
	 		
	 		
	 		
	 		
	 	</div>
			
			
				<div style="padding-right: 0px">
				<textarea class="form-control"
						rows="5" readOnly>${commudata.commu_content}</textarea>
				</div>
				<hr>
<!-- 	<div id="comment">
	 		<label for="commu_comment"></label>
	 		<textarea rows=3 name="COMMU_COMMENT" id="commu_comment" maxlength="100"
	 			   class="form-control" placeholder="댓글을 입력해주세요"></textarea>
	 			   <table class="table table-striped">
				<thead>
					<tr><td>아이디</td><td>내용</td><td>날짜</td></tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>	
		
		<div id="message"></div>
		
	 	</div>			
		<button id="write" type="submit" class="btn btn-outline-primary float-right">등록</button>
				<br><br><br> -->
				
				 <b>
				 <a href="list">
			<button type="submit" class="btn btn-secondary">목록</button>
			</a>
			
							<a href="modifyView?num=${commudata.commu_num}">
			<button type="button" class="btn btn-warning">수정</button>
			</a>
			<%-- href의 주소를 #으로 설정합니다. --%>
							<a href="#">
								<button class="btn btn-danger" data-toggle="modal"
									data-target="#myModal">삭제</button>
									</a>
					
</b>
					
	 	<%-- 게시판 view end --%>
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal body -->
					<div class="modal-body">
						<form name="deleteForm" action="delete" method="post">
							<%-- http://localhost:8088/myhome4/detail?num=22 
								주소를 보면 num을 파라미터로 넘기고 있습니다.
								이 값을 가져와서 ${.num}를 사용 
								또는 ${boarddata.BOARD_NUM} --%>
							
							<input type="hidden" name="num" value="${param.num}" id="commu_num">
							<div class="form-group">
								<label for="pwd">비밀번호</label>
								<input type="password"
										class="form-control" placeholder="Enter password"
										name="commu_pass" id="commu_pass">
							</div>
							<button type="submit" class="btn btn-primary">전송</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">  
						</form>
					</div>
				</div>
			</div>
		</div>
		<br><br>
		<div id="comment">
			
			<textarea rows=3 class="form-control"
					  id="content" maxLength="100" placeholder="댓글을 입력해주세요"></textarea>
			<table class="table table-striped">
			<button class="btn btn-outline-primary float-left" >총 100자까지 가능합니다.</button>
			<button id="write" class="btn btn-outline-primary float-right">등록</button>
				<thead>
					<tr><td>아이디</td><td>내용</td><td>날짜</td></tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>	
		
		<div id="message"></div>
		
	</div> 
</div>
</body>
</html>