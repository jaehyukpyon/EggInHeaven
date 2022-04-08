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
	  margin-left: 90px;
	  table-layout:fixed;
	  word-break:break-all
	}

	#customers td, #customers th {
	  /* border: 1px solid #ddd; */
	  padding: 8px;
	  text-align: center;
	  
	}
	
	#customers td{height:66px}

	#customers tr:nth-child(even){background-color: #f2f2f2;}

	#customers tr:hover {background-color: #ddd;}

	#customers th {
	  padding-top: 12px;
	  padding-bottom: 12px;
	  text-align: center;
	  background-color: #528078;
	  color: white;
	}
	
	img{width:50px; border:solid 1px #ced4da}
	
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
	var selectedValue = '${search_field}'
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



<h1>커뮤니티</h1> 
<div class="container">
<form action="list" method="get">

 <div class="wrapper">
    <div class="search_box">
        <div class="dropdown" >
        
            <div class="default_option">ALL</div>  
	  
            <ul id="viewcount" >
              <li data-value="WSC">ALL</li>
              <li data-value="W">작성자</li>
              <li data-value="C">내용</li>
              <li data-value="S">제목</li>
              <li data-value="SC">글제목+글내용</li>
            </ul>
        </div>
        <div class="search_field">
          <input name="search_word" type="text" class="input" 
          placeholder="Search" value="${search_word}">
          <i class="fas fa-search"></i>
          <input type="hidden" name="search_field" value="WSC" id="c">
      </div>
    </div>
 </div> 
</form>
<%-- 게시글이 있는 경우 --%>
 <c:if test="${listcount > 0 }"> 
 
<p>총 게시글 수 : ${listcount} </p>


<table id="customers">
<thead>
  <tr>
   <th width="10%">번호</th>
    <th  width="10%"></th>
    <th  width="40%">제목</th>
    
    <th  width="10%">작성자</th>
    <th width="10%">날짜</th>
    <th  width="10%">조회수</th>
  </tr>
  </thead>
  <tbody>
  <c:set var="num" value="${listcount-(page-1)*limit}"/>
	 	<c:forEach var="c" items="${commulist}">
  <tr>
    <td  width="10%"><%--번호 --%>
	 			<c:out value="${num}"/><%-- num 출력 --%>
	 			<c:set var="num" value="${num-1}"/> <%-- num=num-1; 의미 --%></td>
	 
	 <c:if test="${!empty c.commu_img}">
	 		<%-- 사진첨부한 경우 --%>			
    <td  style="width:20%; float:right"><img src="../upload${c.commu_img}" alt="파일첨부"></td>
    </c:if>
    <c:if test="${empty c.commu_img}">
						<%-- 파일첨부 하지 않은 경우 --%>
						<td></td>
					</c:if>	
					
    <td  width="40%"><%--제목 --%>
    <a href="detail?num=${c.commu_num}">
	 					<c:out value="${c.commu_subject}"  />
	 					
	 				</a>	
	 				</td>
   
 
    <td  width="10%">${c.member_id}</td>
    <td  width="10%">${c.commu_date}</td>
    <td  width="10%">${c.commu_readcount}</td>
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
  <a href="list?page=${page-1}&search_field=${search_field}&search_word=${search_word}" class="page-link">&laquo;</a>
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
								<c:param name="search_field" value="${search_field}"/>
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
							<c:param name="search_field" value="${search_field}" />
							<c:param name="search_word"  value="${search_word}" />
							<c:param name="page"         value="${page+1}" />
						</c:url>
					<li class="page-item">
						<a href="${next}" class="page-link">&raquo;</a>
 </li>
 </c:if>	
</ul>

 <button id="write" type="button" class="btn btn-primary align-bottom mr-1 float-right write">글 쓰 기</button>
	
	<a href="mylist">
	<button type="button" class="btn btn-outline-primary float-right">내가 쓴 글 보기</button>
	 </a>
</div>
		
	</c:if><%-- <c:if test="${listcount > 0 }"> end --%>
	
</div>
	<%-- 게시글이 없는 경우 --%>
	 <c:if test="${listcount == 0 && empty search_word}">
		<p >등록된 게시글이 없습니다.</p>
		<button id="write" type="button" style="margin-top:300px" class="btn btn-primary align-bottom mr-1 float-right write">글 쓰 기</button>
		
	</c:if> 
	
	<c:if test="${listcount == 0 && !empty search_word}">
		<p>검색 결과가 없습니다.</p>
		<button id="write" type="button" style="margin-top:300px" class="btn btn-primary align-bottom mr-1 float-right write">글 쓰 기</button>
		<button type="button" style="margin-top:300px" class="btn btn-outline-primary float-right" onClick="history.go(-1)">돌아가기</button>
	</c:if>

	

</body>
</html>