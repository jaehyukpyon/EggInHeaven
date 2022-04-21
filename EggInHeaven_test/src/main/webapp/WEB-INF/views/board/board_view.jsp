<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>board_view.jsp</title>
	
	<meta name="_csrf" content="${_csrf.token }">
   	<meta name="_csrf_header" content="${_csrf.headerName }">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
		
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" 
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" 
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<link rel="stylesheet"
		href="${pageContext.request.contextPath }/resources/css/theme.css" />		
	
	<link rel="stylesheet"
		href="${pageContext.request.contextPath }/resources/css/slideshow.css" />
		
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
		
	<style>
		* {
			font-family: 'Poor Story', cursive !important;
		}
		
		div.container {
			overflow: hidden;
		}
		
		div.slideshow-container {
			margin-bottom: 20px;
		}	
		
		#wrap-float-left { 
			float: left; position: relative; left: 50% 
		}
		
	    #horizontal-center-align { 
	    	float: left; position: relative; left: -50%; 
	    }
	    
	    #horizontal-line {
	    	border: 1px solid #E2EBE5;
	    	border-radius: 5px;
	    }
	    
	    div.text {
			position: absolute;
			bottom: 5px;
			right: 0px;
			background-color: rgba(0,0,0,0.5);
			color: white;
			padding-left: 20px;
			padding-right: 20px;
			height: 25px;
			line-height: 100%;
			font-weight: bold;
	    }
	    
	    
	    table#step-table > thead > tr:nth-child(1) > th:nth-child(1) { width:  3%; }
	    table#step-table > thead > tr:nth-child(1) > th:nth-child(2) { width:  67%; }
	    table#step-table > thead > tr:nth-child(1) > th:nth-child(3) { width:  30%; }
	</style>
	
	
	<style>
		/* 아래 comment 부분 css */		
		.date {
            font-size: 14px;
            color: green;
        }

        .comment-text {
            font-size: 15px
        }

        .fs-12 {
            font-size: 14px
        }

        .shadow-none {
            box-shadow: none
        }

        .name {
            color: #007bff
        }

        .cursor:hover {
            color: blue
        }

        .cursor {
            cursor: pointer
        }

        .textarea {
            resize: none
        }
        
        /* #comments-container {
        	border: 1px solid olive;
            border-radius: 10px;
        } */
	</style>

</head>
<body>

	<jsp:include page="../mk/header.jsp" />

	<div class="container">
	
		<%--요리 완성 이미지 슬라이드쇼 부분 --%>
		<div class="slideshow-container" style="position: relative;">
	        <%-- <div class="mySlides">
	            <div class="numbertext">1 / 4</div>
	            <img id="img-slide" src="${pageContext.request.contextPath }/resources/image/slide/pasta1.jpg" style="width:100%">
	            <div class="text">첫 번째 완성 이미지</div>
	        </div>	
	        <div class="mySlides">
	            <div class="numbertext">2 / 4</div>
	            <img id="img-slide" src="${pageContext.request.contextPath }/resources/image/slide/pasta2.jpg" style="width:100%">
	            <div class="text">두 번째 완성 이미지</div>
	        </div>	
	        <div class="mySlides">
	            <div class="numbertext">3 / 4</div>
	            <img id="img-slide" src="${pageContext.request.contextPath }/resources/image/slide/pasta3.jpg" style="width:100%">
	            <div class="text">세 번째 완성 이미지</div>
	        </div>	
	        <div class="mySlides">
	            <div class="numbertext">4 / 4</div>
	            <img id="img-slide" src="${pageContext.request.contextPath }/resources/image/slide/pasta4.jpg" style="width:100%">
	            <div class="text">네 번째 완성 이미지</div>
	        </div> --%>	
	        
	        <c:forEach var="cookImage" items="${cookImages }" varStatus="status">
	        	<div class="mySlides">
		            <div class="numbertext"><c:out value="${status.index + 1 }" /> / 4</div>
		            <img id="img-slide" src="/myhome4/jayCook${cookImage.cook_db }" style="width:100%">
		            <c:choose>
		            	<c:when test="${status.index eq 0 }"><div class="text">첫 번째 완성 이미지</div></c:when>
		            	<c:when test="${status.index eq 1 }"><div class="text">두 번째 완성 이미지</div></c:when>
		            	<c:when test="${status.index eq 2 }"><div class="text">세 번째 완성 이미지</div></c:when>
		            	<c:when test="${status.index eq 3 }"><div class="text">네 번째 완성 이미지</div></c:when>
		            </c:choose>
	        	</div>
	        </c:forEach>
	        
	        <c:if test="${fn:length(cookImages) > 1 }">
		        <a class="prev" onclick="plusSlides(-1)">❮</a>
		        <a class="next" onclick="plusSlides(1)">❯</a>
	        </c:if>	
	    </div>
	    <br />
	    
	    <div style="overflow: hidden">
		    <div style="margin-bottom: 50px; text-align: center; width: 80%; float: left;" class="card bg-primary text-white h-100">
		    	<h1 style="margin: 2% 0 0 0;"><c:out value="${recipe.recipe_title }" /></h1>
		    	<h5 style="margin: 2% 0; padding: 0px 20%;"><c:out value="${recipe.recipe_content }" /></h5>
		    </div>	  
		    
		    <div style="width: 20%; height: 118.5px; float: left; position: relative!important;">
		    	<img src="${pageContext.request.contextPath }/resources/image/stopwatch/stopwatch.png" style="width: 70px; position: absolute; left: 75px; top: 10px;" />
		    	<span style="font-size: 18px; position: absolute; left: 45px; top: 105px;">예상 조리시간: <b>${recipe.recipe_time }분</b></span>
		    </div>
	    </div>
	    
	    
	    <sec:authorize access="isAuthenticated()">  
	    	<sec:authentication property="principal" var="pinfo" />
	    	<input type="hidden" id="loginid-input" value="${pinfo.username }" />
	    	<input type="hidden" id="recipe-num" value='<c:out value="${recipe.recipe_num }" />' />
	    	
		    <div style="position: relative; height: 50px;">
		    	<div style="position: relative; height: 80px;">
		    		<img id="fav-img" src="${pageContext.request.contextPath }/resources/image/heart/blackheart.png" style="width: 50px; position: absolute; top: -25px; left: 40px;"
		    				onmouseover="this.src='${pageContext.request.contextPath }/resources/image/heart/pinkheart.png'" 
		    				onmouseout="this.src='${pageContext.request.contextPath }/resources/image/heart/blackheart.png'"/>
		    		<span id="fav-text" style="position: absolute; top: 22px;">관심 레시피로 <b>등록하기!</b></span>
		    	</div>
		    
			    <div style="position: relative; height: 50px; top: -80px; left: 225px;">
			    	<img id="best-img" src="${pageContext.request.contextPath }/resources/image/thumbs/blackthumbs.png" style="width: 50px; position: absolute; top: -25px;"
			    			onmouseover="this.src='${pageContext.request.contextPath }/resources/image/thumbs/colorthumbs.png'" 
			    			onmouseout="this.src='${pageContext.request.contextPath }/resources/image/thumbs/blackthumbs.png'"/>
			    	<span id="best-text" style="position: absolute; top: 22px;">이 레시피 <b>추천하기!</b> [현재 추천 수:  <b id="best-count"><c:out value="${recipe.recipe_best }" />개</b>]</span>
			    </div>
		    </div>	    
	    </sec:authorize>	    
	    
	    <hr id="horizontal-line" />
	    
	    <div style="overflow: hidden; background: #E2EBE5;">
		    <div id="wrap-float-left">	    	
		    	<div id="horizontal-center-align" style="overflow: hidden;">
		    	
			    	<c:if test="${!empty milkCategories }">
			    		<div style="float: left;">
				    		<ul>
				    			<li><b>유제품</b></li>
				    			<ol>
				    				<c:forEach var="milk" items="${milkCategories }">
					    				<li><c:out value="${milk.milk_name }" /></li>
			    					</c:forEach>
				    			</ol>
				    		</ul>
				    	</div>	
			    	</c:if>
			    	<c:if test="${!empty meatCategories }">
			    		<div style="float: left;">
				    		<ul>
				    			<li><b>육류</b></li>
				    			<ol>
				    				<c:forEach var="meat" items="${meatCategories }">
					    				<li><c:out value="${meat.meat_name }" /></li>
			    					</c:forEach>
				    			</ol>
				    		</ul>
				    	</div>	
			    	</c:if>
			    	<c:if test="${!empty cerealsCategories }">
			    		<div style="float: left;">
				    		<ul>
				    			<li><b>곡류</b></li>
				    			<ol>
				    				<c:forEach var="cereals" items="${cerealsCategories }">
					    				<li><c:out value="${cereals.cereals_name }" /></li>
			    					</c:forEach>
				    			</ol>
				    		</ul>
				    	</div>	
			    	</c:if>
			    	<c:if test="${!empty seafoodCategories }">
			    		<div style="float: left;">
				    		<ul>
				    			<li><b>해산물</b></li>
				    			<ol>
				    				<c:forEach var="seafood" items="${seafoodCategories }">
					    				<li><c:out value="${seafood.seafood_name }" /></li>
			    					</c:forEach>
				    			</ol>
				    		</ul>
				    	</div>	
			    	</c:if>
			    	<c:if test="${!empty vegetableCategories }">
			    		<div style="float: left;">
				    		<ul>
				    			<li><b>채소류</b></li>
				    			<ol>
				    				<c:forEach var="vegetable" items="${vegetableCategories }">
					    				<li><c:out value="${vegetable.vegetable_name }" /></li>
			    					</c:forEach>
				    			</ol>
				    		</ul>
				    	</div>	
			    	</c:if>
			    	 	
		    	</div>
		    </div>
	    </div>
	    
	    <br />
	    	    
	    <div style="overflow: hidden; background: #D4E1D3;">
		    <div id="wrap-float-left">
		    	<div id="horizontal-center-align">
		    		<h5><b>필요 재료 리스트</b></h5>
		    		<div>
		    			<c:forEach var="materialName" items="${materialNameSplits }" varStatus="status">
		    				<span style="margin-right: 70px;">
		    					<c:out value="${status.index + 1 }" />. <c:out value="${fn:trim(materialName) }" />
		    				</span>
		    				<span>
		    					<c:forEach var="materialAmount" items="${materialAmountSplits[status.index] }">
		    						<c:out value="${fn:trim(materialAmount) }" />
		    					</c:forEach>
		    				</span>
		    				<br />
		    			</c:forEach>
		    		</div>
		    	</div>
		    </div>
	    </div>
	    <div style="height: 20px; background: #D4E1D3"></div>	    
	    <div style="overflow: hidden; background: #D4E1D3;">
		    <div id="wrap-float-left">		    	
		    	<div id="horizontal-center-align">
		    		<h5><b>필요 양념 리스트</b></h5>		    		
		    		<div>
		    			<c:forEach var="sauceName" items="${sauceNameSplits }" varStatus="status">
		    				<span style="margin-right: 70px;">
		    					<c:out value="${status.index + 1 }" />. <c:out value="${fn:trim(sauceName) }" />
		    				</span>
		    				<span>
		    					<c:forEach var="sauceAmount" items="${sauceAmountSplits[status.index] }">
		    						<c:out value="${fn:trim(sauceAmount) }" />
		    					</c:forEach>
		    				</span>
		    				<br />
		    			</c:forEach>
		    		</div>
		    	</div>
		    </div>
	    </div>
	    
	    <br />
		
		<div class="table-responsive">
			<table id="step-table" class="table table-hover table-md">
				<thead>
					<tr class="table-primary" style="text-align: center;">
						<th><span class="badge badge-pill badge-primary" style="font-size: 1rem;">STEP</span></th>
						<th><span class="badge badge-primary" style="font-size: 1rem;">사진</span></th>
						<th><span class="badge badge-primary" style="font-size: 1rem;">설명</span></th>
					</tr>
				</thead>
				<tbody>					 
					 <c:forEach var="step" items="${recipeSteps }" varStatus="status">
					 	<tr>
					 		<td><span class="badge badge-pill badge-primary" style="font-size: 1rem;"><c:out value="${status.count }" /></span></td>
					 		<td><img src="${pageContext.request.contextPath }/jayStep${step.step_db }" width="100%"></td>
					 		<%-- <td><img src="${pageContext.request.contextPath }/jayStep/2022-4-15/step1.jpg" width="100%"></td> --%>
					 		<td><c:out value="${step.step_content }" /></td>
					 	</tr>
					 </c:forEach>
				</tbody>
			</table>
		</div>

	</div>	
	<%--div.container ends --%>
	
	<sec:authorize access="isAuthenticated()">	
		<sec:authentication property="principal" var="pinfo" />
		<c:if test="${pinfo.username == recipe.member_id }">			
			<div class="container" style="margin-bottom: 20px;">
				<div>
					<!-- <button class="btn btn-success float-right" style="margin-left: 10px;">삭제하기</button> -->
					<button class="btn btn-secondary float-right"><a href="/myhome4/recipe/modify_action?num=${recipe.recipe_num }">수정하기</a></button>
				</div>
			</div>			
		</c:if>			
	</sec:authorize>
	
	
	<div class="container" id="comments-container" style="margin-bottom: 100px;">
        <div class="d-flex justify-content-center row">
            <div class="col-md-8">
                <div class="d-flex flex-column comment-section">               
                	
                	<sec:authorize access="isAuthenticated()">	                    
	                    <button id="comment-btn" class="btn btn-primary btn-sm shadow-none" type="button">댓글 작성하기</button>	                    
                    </sec:authorize>
                    
                    <div id="recipe-reply" style="margin-top: 20px;"></div>
                    
				</div>
            </div>
        </div>
    </div>
	
	
	<!--댓글 등록 모달.  -->
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 id="modal-title">댓글 작성</h3>
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
						<label>아이디</label>
						<input id="modal-replyer" class="form-control" name='replyer' value='' readonly="true" />
					</div>
					
					<div class="form-group">
						<label>내용</label>
						<!-- <input id="modal-content" class="form-control" name='reply' value=''> -->
						<textarea id="modal-content" class="form-control"></textarea>
					</div>
                </div>
                <div class="modal-footer">
                	<button id="modal-submit" class="btn btn-primary">댓글 등록</button>
                	<button id="modal-update" class="btn btn-success">댓글 수정</button>
                    <button class="btn" data-dismiss="alert" aria-hidden="true">Close</button>
                </div>
            </div>
        </div>
    </div>
	
	
	
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/slideshow.js"></script>
	
	<script>
		let isAdded = false;
	
		$(document).ready(function () {
			if ($("#loginid-input").length == 1) {
				let loginid = $("#loginid-input").val();
				let recipe_num = $("#recipe-num").val(); // 게시글 번호 가져오기
				$.ajax({
					url : "/myhome4/board/isAddedToLikeListTable",
					type : "get",
					data : {
						member_id : loginid,
						recipe_num : recipe_num
					},
					async : false,
					success : function (result) {
						if (result == 1) {
							console.log("이미 관심 리스트에 추가 돼 있음.");
							added();
							isAdded = true;
							console.log("test");
						} else if (result == 0) {
							console.log("관심 리스트에 추가 돼 있지 않음.");
							notAdded();
							isAdded = false;
						}
					}
				});
			}
		});
		
		const added = function () {			
			$("#fav-text").html("관심 레시피에서 <b style='color: red;'>제거</b>하기");
			$("#fav-img").attr("src", "${pageContext.request.contextPath }/resources/image/heart/pinkheart.png");
			$("#fav-img").attr("onmouseover", "this.src='${pageContext.request.contextPath }/resources/image/heart/blackheart.png'");
			$("#fav-img").attr("onmouseout", "this.src='${pageContext.request.contextPath }/resources/image/heart/pinkheart.png'");
		}
		
		const notAdded = function () {
			$("#fav-text").html("관심 레시피로 <b style='color: green;'>등록</b>하기");
			$("#fav-img").attr("src", "${pageContext.request.contextPath }/resources/image/heart/blackheart.png");
			$("#fav-img").attr("onmouseover", "this.src='${pageContext.request.contextPath }/resources/image/heart/pinkheart.png'");
			$("#fav-img").attr("onmouseout", "this.src='${pageContext.request.contextPath }/resources/image/heart/blackheart.png'");
		}
		
		$("#fav-img").click(function () {
			addOrRemoveLike();
		});
		
		const addOrRemoveLike = function () {
			console.log(isAdded); // 변수 인식 잘 되네요...
			let loginid = $("#loginid-input").val();
			let recipe_num = $("#recipe-num").val(); // 게시글 번호 가져오기
			
			if (isAdded == true) { // 관심 테이블에 추가 되어 있으니 "삭제" 시켜야 한다.
				$.ajax({
					url : "/myhome4/board/removeFromLikeListTable",
					type : "get",
					data : {
						member_id : loginid,
						recipe_num : recipe_num
					},
					async : false,
					success : function (result) {
						if (result == 1) {
							console.log("성공적으로 관심 테이블에서 삭제 성공");
							notAdded();
							isAdded = false;
						}
					}
				});
			} else if (isAdded == false) { // 관심 테이블에 추가 되어 있지 않으니 "추가" 시켜줘야 됨ㅇㅇ
				$.ajax({
					url : "/myhome4/board/addToLikeListTable",
					type : "get",
					data : {
						member_id : loginid,
						recipe_num : recipe_num
					},
					async : false,
					success : function (result) {
						if (result == 1) {
							console.log("성공적으로 관심 테이블에 등록 성공.");
							added();
							isAdded = true;
						}
					}
				});
			} else {
				;
			}
		}		
		// addOrRemoveLike();
	</script>
	
	<script>
		let isBested = false;
		let bestCount = '<c:out value="${recipe.recipe_best }" />';
		
		$(document).ready(function () {
			if ($("#loginid-input").length == 1) {
				let loginid = $("#loginid-input").val();
				let recipe_num = $("#recipe-num").val(); // 게시글 번호 가져오기				
				
				$.ajax({
					url : "/myhome4/board/isBested",
					type : "get",
					data : {
						member_id : loginid,
						recipe_num : recipe_num
					},
					async : false,
					success : function (result) {
						if (result == 1) {
							console.log("이미 이 레시피를 추천함.");
							bested();
							isBested = true;
						} else if (result == 0) {
							console.log("아직 이 레시피를 추천하지 않음.");
							notBested();
							isBested = false;
						}
					}
				});
			}
		});
		
		const bested = function () {
			$("#best-text").html("이 레피시 추천 <b style='color: red;'>취소</b>하기! [현재 추천 수: <b id='best-count'>" + bestCount + "</b>개]");
			$("#best-img").attr("src", "${pageContext.request.contextPath }/resources/image/thumbs/colorthumbs.png");
			$("#best-img").attr("onmouseover", "this.src='${pageContext.request.contextPath }/resources/image/thumbs/blackthumbs.png'");
			$("#best-img").attr("onmouseout", "this.src='${pageContext.request.contextPath }/resources/image/thumbs/colorthumbs.png'");
		}
		
		const notBested = function () {
			$("#best-text").html("이 레피시 <b style='color: green;'>추천</b>하기! [현재 추천 수: <b id='best-count'>" + bestCount + "</b>개]");
			$("#best-img").attr("src", "${pageContext.request.contextPath }/resources/image/thumbs/blackthumbs.png");
			$("#best-img").attr("onmouseover", "this.src='${pageContext.request.contextPath }/resources/image/thumbs/colorthumbs.png'");
			$("#best-img").attr("onmouseout", "this.src='${pageContext.request.contextPath }/resources/image/thumbs/blackthumbs.png'");
		}	
		
		
		$("#best-img").click(function () {
			addOrRemoveBest();
		});
		
		const addOrRemoveBest = function () {
			console.log(isBested); // 변수 인식 잘 되네요...
			let loginid = $("#loginid-input").val();
			let recipe_num = $("#recipe-num").val(); // 게시글 번호 가져오기
			
			if (isBested == true) { // 이미 추천 되어 있으니, best_list 에서 제거시키고 recipe 테이블에서 추천 수 하나 내려야 한다
				$.ajax({
					url : "/myhome4/board/removeFromBestListTable",
					type : "get",
					data : {
						member_id : loginid,
						recipe_num : recipe_num
					},
					async : false,
					success : function (result) {
						
							console.log("성공적으로 best_list 테이블에서 삭제 성공");
							notBested();
							$("#best-count").html(result);
							isBested = false;						
					}
				});
			} else if (isBested == false) { // 아직 추천 되어 있지 않으니, best_list 에 추가시키고, recipe 테이블에서 추천 수 하나 늘리기
				$.ajax({
					url : "/myhome4/board/addToBestListTable",
					type : "get",
					data : {
						member_id : loginid,
						recipe_num : recipe_num
					},
					async : false,
					success : function (result) {
						
							console.log("성공적으로 best_list 테이블에 등록 성공.");
							bested();
							$("#best-count").html(result);
							isBested = true;						
					}
				});
			} else {
				;
			}
		}		
	</script>	
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/boardReply.js"></script>
	
	<script>
		$(document).ready(function () {
			console.log("document ready for recipe_reply...");
			
			let recipe_num = "<c:out value='${recipe.recipe_num }' />";
			let loginid = $("#loginid-input").val();
			
			
			let recipeDiv = $("#recipe-reply");
			
			// 댓글 작성하기 버튼 클릭 시 모달 보여주기
			let commentBtn = $("#comment-btn");
			commentBtn.click(function () {
				$('#myModal').modal({backdrop: 'static', keyboard: false});
				
				$("#modal-replyer").val("");
				$("#modal-replyer").val(loginid);
				
				$("#modal-content").val("");
				$("#modal-content").attr("placeholder", "댓글 내용을 입력하세요.");
				
				$("#modal-submit").show();
				$("#modal-update").hide();				
				
				$("#myModal").modal("show");                
            });			
			
			// 댓글 작성 모달 닫기 이벤트
			$("button[data-dismiss='alert']").on("click", function (e) {			    
                if (confirm("취소 하시겠습니까?")) {
                	$("#modal-replyer").val("");
                	$("#modal-content").val("");
                    $("#myModal").modal("hide");
                } else {
                    return;
                }
            });				
			
			// 댓글 입력 후 submit 시 이벤트
			$("#modal-submit").on("click", function (e) {
				if ($("#modal-content").val() == "") {
					alert("댓글 내용을 입력하세요.");
					return;
				}
				if (confirm("댓글을 등록하시겠습니까?")) {
					boardReply.add({
						recipe_num : recipe_num,
						member_id : loginid,
						content : $("#modal-content").val().trim()
					}, function (result) {
						if (result == "success") {
							alert("댓글 등록 완료.");
							$("#modal-replyer").val("");
		                	$("#modal-content").val("");
		                	$("#myModal").modal("hide");
		                	
		                	showList(1);
						}					
					});
				} else {
					return;
				}
			});
			
			// 내가 작성한 댓글 수정 버튼 클릭 시 이벤트
			$("body").on("click", "#reply-edit", function (e) {
				
				let beforeContent = $(this).parent().parent().parent().find("p").text().trim();
				let loginid = $(this).parent().parent().find("span:nth-child(1)").text().trim();
				let reply_num = $(this).data("reply_num");
				
				console.log("beforeContent: " + beforeContent);
				console.log("loginid: " + loginid);
				console.log("reply_num: " + reply_num);
				
				console.log("")
				
				$("#modal-replyer").val(loginid);
				$("#modal-content").val(beforeContent);
				$("#modal-submit").hide();
				$("#modal-update").show();
				
				$("#myModal").modal("show");
				
				$("#modal-update").off("click"); // 이벤트 제거...
				
				$("#modal-update").click(function (e) {		
					
					if (beforeContent === $("#modal-content").val().trim()) {
						alert("댓글을 수정하지 않았습니다. 수정할 댓글 내용을 입력하세요.");
						$("#modal-content").focus();
						return;
					} else if ($("#modal-content").val().trim() == "") {
						alert("수정할 댓글 내용을 입력하세요.");
						$("#modal-content").focus();
						return;
					} else {
						console.log("댓글 수정 작업 중...");
						
						boardReply.update({
							reply_num : reply_num,
							content : $("#modal-content").val().trim()
						}, function (result) {
							if (result == "success") {
								alert("댓글 수정 완료.");
								$("#modal-replyer").val("");
								$("#modal-content").val("");
								
								$("#myModal").modal("hide");
								showList(1);
							}
						});
						
					}	
				});
				
			});
			
			// 댓글 삭제 이벤트
			$("body").on("click", "#reply-delete", function (e) {
				if (confirm("해당 댓글을 삭제하시겠습니까?")) {
					let reply_num = $(this).data("reply_num");
					
					boardReply.remove(reply_num, function (result) {
						if (result == "success") {
							alert("댓글 삭제 완료.");
							showList(1);
						}
					})
					
				} else {
					;
				}
			});
			
			const showList = function (page) {
				boardReply.getList({
					recipe_num : recipe_num,
					page : page || 1
				}, function (list) {
					var str = "";
					
					if (list == undefined || list == null || list.length == 0) {
						recipeDiv.html("<h5 style='color: olive; text-align: center;'>아직 등록된 댓글이 없습니다.</h5>");
						return;
					}
					
					for (let i = 0; i < list.length; i++) {
						str += "<div class='bg-white p-2'>";
						str += "	<div class='d-flex flex-row user-info'>";
						str += '		<img class="rounded-circle" src="${pageContext.request.contextPath }/resources/image/profileimg/user.png" width="45">';
						str += "		<div class='d-flex flex-column justify-content-start ml-2'>";
						str += "			<span class='d-block font-weight-bold name' style='font-size: 18px!important;'>" + list[i].member_id + "</span>";
						str += "			<span class='date text-black-50'>" + boardReply.getFullYmdStr(list[i].reply_date) + "</span>";
						str += "		</div>";
						
						if (loginid == list[i].member_id) {
							str += "<div class='mt-2 text-right'>";
							str += "	<button id='reply-edit' class='btn btn-warning btn-sm ml-3 shadow-none' type='button' data-reply_num='" + list[i].reply_num + "'>수정</button>";
							str += "	<button id='reply-delete' class='btn btn-danger btn-sm ml-1 shadow-none' type='button' data-reply_num='" + list[i].reply_num + "'>삭제</button>";
							str += "</div>";
						}
						
						
						str += "	</div>";
						str += "	<div class='mt-2'>";
						str += "		<p class='comment-text' style='font-size: 16px;'>";
						str += 				list[i].content;
						str += "		</p>";
						str += "	</div>";
						str += "</div>";
						
					}
					
					recipeDiv.html(str);
				}); // getList 호출 끝
			}; // showList 함수 정의 끝
			
			showList(1);			
		}) // document.ready ends
	</script>
	
	

</body>
</html>