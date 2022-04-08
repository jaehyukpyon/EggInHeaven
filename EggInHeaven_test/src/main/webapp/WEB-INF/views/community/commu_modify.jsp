<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<%-- <jsp:include page="header.jsp"/> --%>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
	<script src="../resources/js/modifyform.js"></script>
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/form.css"> --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
	<link class="cssdeck" rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
	<style>
		h1{font-size:2.5rem; text-align:center; font-weight:bold}
		.container{width:60%}
		label{font-weight:bold}
		#upfile{display:none}
		img{width:100px;}
		button{float:right; margin-left:10px}
		h5{font-weight:bold}
	</style>
	<script>
	if('${result}' == 'passFail') {
		alert("비밀번호가 다릅니다.")
	}

	</script>
</head>
<body>
	<div class="container">
	 <form action="modifyAction" method="post" enctype="multipart/form-data" name="modifyform">
	 	
	 	<input type="hidden" name="commu_num" value="${commudata.commu_num}">
	 	
	 	<h1>수정 페이지</h1>
	 	<div class="form-group">
	 		<label for="member_id">작성자</label><%-- value="${commudata.member_id}" --%>
	 		<input name="member_id" id="member_id" readOnly value="admin"
	 			   type="text"	     class="form-control" placeholder="id">
	 	</div>
	 	<div class="form-group">
	 		<label for="commu_pass">비밀번호</label>
	 		<input name="commu_pass" id="commu_pass" type="password" maxlength="30"
	 			   class="form-control" placeholder="글 비밀번호를 입력해주세요">
	 	</div>
	
	 	<div class="form-group">
	 		<label for="commu_subject">제목</label>
	 		<textarea name="commu_subject" id="commu_subject" rows="1" maxlength="100"
	 			   class="form-control" placeholder="제목을 입력해주세요">${commudata.commu_subject}</textarea>
	 	</div>
	
	 	<div class="form-group">
	 		<label for="commu_content">내용</label>
	 		<textarea name ="commu_content" id="commu_content" rows="15" class="form-control">${commudata.commu_content}</textarea>
	 	</div>
	 	<div class="form-group">
	 	
	 		<label for="upfile">
	 		<h5>사진등록</h5>
	 		<h5 class="before_upfile"></h5>
	 		<br>
	 		<div class="file-grid-container">	
	 			
	 		
	 		
	 		<input type="file" id="upfile" name="uploadfile">
	 		<b>사진은 한 장만 등록 가능 >>&nbsp;&nbsp;&nbsp;</b>
	 		
	 		<c:if test="${!empty commudata.commu_img}">
	 		<%-- 사진첨부한 경우 --%>
	 		<img src="../upload${commudata.commu_img}" alt="파일첨부">
	 		</c:if>
	 			
	 			<c:if test="${empty commudata.commu_img}">
						<%-- 파일첨부 하지 않은 경우 --%>
						<img src="../resources/image/사진등록.png" alt="파일첨부">
					</c:if>		
	 	     
	 		</div>
	 		
	 		</label>
	 	
	 		
	 	</div>
	 	<div class="form-group">
	 	<button type="submit" class="btn btn-primary">수정</button>
	 		<button type="reset" class="btn btn-danger" onClick="history.go(-1)">취소</button>
	 	</div>
	 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"><!-- POST 방식은 폼안에다가 다 넣어주면된다 -->
	 </form>
	</div>
	
	 <script defer>
     	const uploadfile = document.querySelector('input[type="file"]');
     	window.onload = function(){
     		const el = document.querySelector('.before_upfile');
     		el.style.display = "block";
     	}
     	uploadfile.onchange= function(e){
     		var img = document.querySelectorAll('img');
     		img.forEach(item => item.remove());
     		const fileList = e.target.files;
     		for(let i = 0; i < fileList.length; i++){
     			loadFile(fileList[i]);
     		}
     		
     	}
     	function loadFile(fileNode){
     		var file = fileNode;
     		var pattern = /\.(gif|jpe?g|tiff?|png|webp|bmp)$/i;
     		if(pattern.test(file.name)){
     			var fileReader = new FileReader();
         		fileReader.readAsDataURL(file);
         		fileReader.onload = function(e){
         			var newImg = document.createElement("img");
             		newImg.src = e.target.result;
             		const div = document.querySelector('.file-grid-container');
             		console.log(div);
             		const el = document.querySelector('.before_upfile');
             		div.style.opacity ="1.0";
              		el.style.display = 'none';
             		div.appendChild(newImg);	
     		}
     		}else{
     			alert('확장자는 gif,jpeg, png가 가능합니다');
     			file.value = "";
     		}
     	}
     	
     </script>
	
</body>
</html>