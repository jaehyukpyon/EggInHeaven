<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<%-- <jsp:include page="header.jsp" />
<script src="../resources/js/list.js"></script> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commu_list.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css"> 
<!-- <link class="cssdeck" rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet"> -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<script src="../resources/js/search.js"></script>

<style>

body>h1{font-family: 'Poor Story', cursive;
        font-weight:bold;
        text-align:center;
        font-size:3.5rem}
.container p{ margin-left:80%;
         margin-top:1.5rem;
         font-weight:bold;
         font-size:1.2rem
         }

#customers {
	  font-family: Arial, Helvetica, sans-serif;
	  border-collapse: collapse;
	  width: 90%;
	 /*  margin-top: 100px; */
	  margin-left: 90px
	}

	#customers td, #customers th {
	  /* border: 1px solid #ddd; */
	  padding: 8px;
	  text-align: center;
	}

	#customers tr:nth-child(even){background-color: #f2f2f2;}

	#customers tr:hover {background-color: #ddd;}

	#customers th {
	  padding-top: 12px;
	  padding-bottom: 12px;
	  text-align: center;
	  background-color: #528078;
	  color: white;
	}
	
	img{width:50px}
	
	p{margin-left:810px;
	  font-size:30;
	  margin-top:200px
	  }
</style>

<title>commu_list</title>
<script>
$(function(){
	$("#write").click(function(){
		location.href="write";
	});
	//검색 클릭 후 응답화면에는 검색시 선택한 필드가 선택되도록 합니다.
	var selectedValue = '${dropdown}'
	if (selectedValue != '-1')
		$("#viewcount").val(selectedValue);
	
	//검색 버트을 클릭한 경우
	$("i").click(function() {
		//검색어 공백 유효성 검사
		if($("input").val() == '') {
			alert("검색어를 입력하세요");
			$("input").focus();
			return false;
		}
	});
});
</script>
	

</head>
<body>



<h1>커뮤니티 (내가 쓴 글)</h1> 
<div class="container">
<%-- <form action="mylist" method="post">

 <div class="wrapper">
    <div class="search_box">
        <div class="dropdown" >
            <div class="default_option" name="dropdown">All</div>  
            <ul>
              <li>ALL</li>
              <li>작성자</li>
              <li>글제목+글내용</li>
            </ul>
        </div>
        <div class="search_field">
          <input name="search_word" type="text" class="input" 
          placeholder="Search" value="${search_word}">
          <i class="fas fa-search"></i>
      </div>
    </div>
 </div> 
</form> --%>
<%-- 게시글이 있는 경우 --%>
 <c:if test="${listcount > 0 }"> 
 
<p>총 게시글 수 : ${listcount} </p>


<table id="customers">
<thead>
  <tr>
    <th>번호</th>
    <th></th>
    <th colspan="3">제목</th>
    <th></th>
    <th >작성자</th>
    <th>날짜</th>
    <th>조회수</th>
  </tr>
  </thead>
  <tbody>
  <c:set var="num" value="${listcount-(page-1)*limit}"/>
	 	<c:forEach var="c" items="${commulist}">
  <tr>
    <td><%--번호 --%>
	 			<c:out value="${num}"/><%-- num 출력 --%>
	 			<c:set var="num" value="${num-1}"/> <%-- num=num-1; 의미 --%></td>
    <td><img src="../upload${commudata.commu_img}" alt="파일첨부"></td>
    
    <td colspan="3"><%--제목 --%>
    <a href="detail?num=${c.commu_num}">
	 					<c:out value="${c.commu_subject}"  />
	 				</a>	
	 				</td>
     <td></td>
 
    <td>${c.member_id}</td>
    <td>${c.commu_date}</td>
    <td>${c.commu_readcount}</td>
  </tr>
 
  
</c:forEach>
</tbody>
</table>

	
	<div class="center-block">
		  <ul class="pagination justify-content-center">	
		  <c:if test="${page <= 1}">
  <li class="page-item">
  <a class="page-link gray">&laquo;</a>
  </li>
  </c:if>
  <c:if test="${page > 1 }">
  <li class="page-item">
  <a href="list?page=${page-1}"&dropdown=${dropdown}&search_word=${search_word}" class="page-link">&laquo;</a>
  </li>
  </c:if>
  
  <c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == page}">
						<li class="page-item active">
							<a class="page-link">${a}</a>
						</li>
					</c:if>
					<c:if test="${a != page}">
					<c:url var="go" value="list">
								<c:param name="dropdown" value="${dropdown}"/>
								<c:param name="search_word"  value="${search_word}"/>
								<c:param name="page" 	     value="${a}"/>
							</c:url>
						<li class="page-item">
							<a href="${go}" class="page-link">${a}</a>
						</li>		
					</c:if>		
				</c:forEach>

<c:if test="${page >= maxpage}">
  <li class="page-item">
  <a class="page-link gray">&raquo;</a>
  </li>
  </c:if>
  <c:if test="${page < maxpage }">
  <c:url var="next" value="list">
							<c:param name="dropdown" value="${dropdown}" />
							<c:param name="search_word"  value="${search_word}" />
							<c:param name="page"         value="${page+1}" />
						</c:url>
					<li class="page-item">
						<a href="${next}" class="page-link">&raquo;</a>
 </li>
 </c:if>	
</ul>

 <button id="write" type="button" class="btn btn-primary align-bottom mr-1 float-right write">글 쓰 기</button>
	
	<a href="list">
	<button type="button" class="btn btn-outline-primary float-right">돌아가기</button>
	 </a>
</div>
		
	</c:if><%-- <c:if test="${listcount > 0 }"> end --%>
	
</div>
	<%-- 게시글이 없는 경우 --%>
	 <c:if test="${listcount == 0}">
		<p >등록된 게시글이 없습니다.</p>
		
		 <button id="write" style="font-family: 'Poor Story', cursive" type="button" class="btn btn-primary align-bottom mr-1 float-right write">글 쓰 기</button>
	
	<a href="list">
	<button type="button" class="btn btn-outline-primary float-right">돌아가기</button>
	 </a>
	</c:if> 

	

</body>
</html>