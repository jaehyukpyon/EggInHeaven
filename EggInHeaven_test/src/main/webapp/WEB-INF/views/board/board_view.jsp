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
		/* ?????? comment ?????? css */		
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
	
		<%--?????? ?????? ????????? ??????????????? ?????? --%>
		<div class="slideshow-container" style="position: relative;">
	        <%-- <div class="mySlides">
	            <div class="numbertext">1 / 4</div>
	            <img id="img-slide" src="${pageContext.request.contextPath }/resources/image/slide/pasta1.jpg" style="width:100%">
	            <div class="text">??? ?????? ?????? ?????????</div>
	        </div>	
	        <div class="mySlides">
	            <div class="numbertext">2 / 4</div>
	            <img id="img-slide" src="${pageContext.request.contextPath }/resources/image/slide/pasta2.jpg" style="width:100%">
	            <div class="text">??? ?????? ?????? ?????????</div>
	        </div>	
	        <div class="mySlides">
	            <div class="numbertext">3 / 4</div>
	            <img id="img-slide" src="${pageContext.request.contextPath }/resources/image/slide/pasta3.jpg" style="width:100%">
	            <div class="text">??? ?????? ?????? ?????????</div>
	        </div>	
	        <div class="mySlides">
	            <div class="numbertext">4 / 4</div>
	            <img id="img-slide" src="${pageContext.request.contextPath }/resources/image/slide/pasta4.jpg" style="width:100%">
	            <div class="text">??? ?????? ?????? ?????????</div>
	        </div> --%>	
	        
	        <c:forEach var="cookImage" items="${cookImages }" varStatus="status">
	        	<div class="mySlides">
		            <div class="numbertext"><c:out value="${status.index + 1 }" /> / 4</div>
		            <img id="img-slide" src="/myhome4/jayCook${cookImage.cook_db }" style="width:100%">
		            <c:choose>
		            	<c:when test="${status.index eq 0 }"><div class="text">??? ?????? ?????? ?????????</div></c:when>
		            	<c:when test="${status.index eq 1 }"><div class="text">??? ?????? ?????? ?????????</div></c:when>
		            	<c:when test="${status.index eq 2 }"><div class="text">??? ?????? ?????? ?????????</div></c:when>
		            	<c:when test="${status.index eq 3 }"><div class="text">??? ?????? ?????? ?????????</div></c:when>
		            </c:choose>
	        	</div>
	        </c:forEach>
	        
	        <c:if test="${fn:length(cookImages) > 1 }">
		        <a class="prev" onclick="plusSlides(-1)">???</a>
		        <a class="next" onclick="plusSlides(1)">???</a>
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
		    	<span style="font-size: 18px; position: absolute; left: 45px; top: 105px;">?????? ????????????: <b>${recipe.recipe_time }???</b></span>
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
		    		<span id="fav-text" style="position: absolute; top: 22px;">?????? ???????????? <b>????????????!</b></span>
		    	</div>
		    
			    <div style="position: relative; height: 50px; top: -80px; left: 225px;">
			    	<img id="best-img" src="${pageContext.request.contextPath }/resources/image/thumbs/blackthumbs.png" style="width: 50px; position: absolute; top: -25px;"
			    			onmouseover="this.src='${pageContext.request.contextPath }/resources/image/thumbs/colorthumbs.png'" 
			    			onmouseout="this.src='${pageContext.request.contextPath }/resources/image/thumbs/blackthumbs.png'"/>
			    	<span id="best-text" style="position: absolute; top: 22px;">??? ????????? <b>????????????!</b> [?????? ?????? ???:  <b id="best-count"><c:out value="${recipe.recipe_best }" />???</b>]</span>
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
				    			<li><b>?????????</b></li>
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
				    			<li><b>??????</b></li>
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
				    			<li><b>??????</b></li>
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
				    			<li><b>?????????</b></li>
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
				    			<li><b>?????????</b></li>
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
		    		<h5><b>?????? ?????? ?????????</b></h5>
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
		    		<h5><b>?????? ?????? ?????????</b></h5>		    		
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
						<th><span class="badge badge-primary" style="font-size: 1rem;">??????</span></th>
						<th><span class="badge badge-primary" style="font-size: 1rem;">??????</span></th>
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
					<!-- <button class="btn btn-success float-right" style="margin-left: 10px;">????????????</button> -->
					<button class="btn btn-secondary float-right"><a href="/myhome4/recipe/modify_action?num=${recipe.recipe_num }">????????????</a></button>
				</div>
			</div>			
		</c:if>			
	</sec:authorize>
	
	
	<div class="container" id="comments-container" style="margin-bottom: 100px;">
        <div class="d-flex justify-content-center row">
            <div class="col-md-8">
                <div class="d-flex flex-column comment-section">               
                	
                	<sec:authorize access="isAuthenticated()">	                    
	                    <button id="comment-btn" class="btn btn-primary btn-sm shadow-none" type="button">?????? ????????????</button>	                    
                    </sec:authorize>
                    
                    <div id="recipe-reply" style="margin-top: 20px;"></div>
                    
				</div>
            </div>
        </div>
    </div>
	
	
	<!--?????? ?????? ??????.  -->
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 id="modal-title">?????? ??????</h3>
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">??</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
						<label>?????????</label>
						<input id="modal-replyer" class="form-control" name='replyer' value='' readonly="true" />
					</div>
					
					<div class="form-group">
						<label>??????</label>
						<!-- <input id="modal-content" class="form-control" name='reply' value=''> -->
						<textarea id="modal-content" class="form-control"></textarea>
					</div>
                </div>
                <div class="modal-footer">
                	<button id="modal-submit" class="btn btn-primary">?????? ??????</button>
                	<button id="modal-update" class="btn btn-success">?????? ??????</button>
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
				let recipe_num = $("#recipe-num").val(); // ????????? ?????? ????????????
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
							console.log("?????? ?????? ???????????? ?????? ??? ??????.");
							added();
							isAdded = true;
							console.log("test");
						} else if (result == 0) {
							console.log("?????? ???????????? ?????? ??? ?????? ??????.");
							notAdded();
							isAdded = false;
						}
					}
				});
			}
		});
		
		const added = function () {			
			$("#fav-text").html("?????? ??????????????? <b style='color: red;'>??????</b>??????");
			$("#fav-img").attr("src", "${pageContext.request.contextPath }/resources/image/heart/pinkheart.png");
			$("#fav-img").attr("onmouseover", "this.src='${pageContext.request.contextPath }/resources/image/heart/blackheart.png'");
			$("#fav-img").attr("onmouseout", "this.src='${pageContext.request.contextPath }/resources/image/heart/pinkheart.png'");
		}
		
		const notAdded = function () {
			$("#fav-text").html("?????? ???????????? <b style='color: green;'>??????</b>??????");
			$("#fav-img").attr("src", "${pageContext.request.contextPath }/resources/image/heart/blackheart.png");
			$("#fav-img").attr("onmouseover", "this.src='${pageContext.request.contextPath }/resources/image/heart/pinkheart.png'");
			$("#fav-img").attr("onmouseout", "this.src='${pageContext.request.contextPath }/resources/image/heart/blackheart.png'");
		}
		
		$("#fav-img").click(function () {
			addOrRemoveLike();
		});
		
		const addOrRemoveLike = function () {
			console.log(isAdded); // ?????? ?????? ??? ?????????...
			let loginid = $("#loginid-input").val();
			let recipe_num = $("#recipe-num").val(); // ????????? ?????? ????????????
			
			if (isAdded == true) { // ?????? ???????????? ?????? ?????? ????????? "??????" ????????? ??????.
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
							console.log("??????????????? ?????? ??????????????? ?????? ??????");
							notAdded();
							isAdded = false;
						}
					}
				});
			} else if (isAdded == false) { // ?????? ???????????? ?????? ?????? ?????? ????????? "??????" ???????????? ?????????
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
							console.log("??????????????? ?????? ???????????? ?????? ??????.");
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
				let recipe_num = $("#recipe-num").val(); // ????????? ?????? ????????????				
				
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
							console.log("?????? ??? ???????????? ?????????.");
							bested();
							isBested = true;
						} else if (result == 0) {
							console.log("?????? ??? ???????????? ???????????? ??????.");
							notBested();
							isBested = false;
						}
					}
				});
			}
		});
		
		const bested = function () {
			$("#best-text").html("??? ????????? ?????? <b style='color: red;'>??????</b>??????! [?????? ?????? ???: <b id='best-count'>" + bestCount + "</b>???]");
			$("#best-img").attr("src", "${pageContext.request.contextPath }/resources/image/thumbs/colorthumbs.png");
			$("#best-img").attr("onmouseover", "this.src='${pageContext.request.contextPath }/resources/image/thumbs/blackthumbs.png'");
			$("#best-img").attr("onmouseout", "this.src='${pageContext.request.contextPath }/resources/image/thumbs/colorthumbs.png'");
		}
		
		const notBested = function () {
			$("#best-text").html("??? ????????? <b style='color: green;'>??????</b>??????! [?????? ?????? ???: <b id='best-count'>" + bestCount + "</b>???]");
			$("#best-img").attr("src", "${pageContext.request.contextPath }/resources/image/thumbs/blackthumbs.png");
			$("#best-img").attr("onmouseover", "this.src='${pageContext.request.contextPath }/resources/image/thumbs/colorthumbs.png'");
			$("#best-img").attr("onmouseout", "this.src='${pageContext.request.contextPath }/resources/image/thumbs/blackthumbs.png'");
		}	
		
		
		$("#best-img").click(function () {
			addOrRemoveBest();
		});
		
		const addOrRemoveBest = function () {
			console.log(isBested); // ?????? ?????? ??? ?????????...
			let loginid = $("#loginid-input").val();
			let recipe_num = $("#recipe-num").val(); // ????????? ?????? ????????????
			
			if (isBested == true) { // ?????? ?????? ?????? ?????????, best_list ?????? ??????????????? recipe ??????????????? ?????? ??? ?????? ????????? ??????
				$.ajax({
					url : "/myhome4/board/removeFromBestListTable",
					type : "get",
					data : {
						member_id : loginid,
						recipe_num : recipe_num
					},
					async : false,
					success : function (result) {
						
							console.log("??????????????? best_list ??????????????? ?????? ??????");
							notBested();
							$("#best-count").html(result);
							isBested = false;						
					}
				});
			} else if (isBested == false) { // ?????? ?????? ?????? ?????? ?????????, best_list ??? ???????????????, recipe ??????????????? ?????? ??? ?????? ?????????
				$.ajax({
					url : "/myhome4/board/addToBestListTable",
					type : "get",
					data : {
						member_id : loginid,
						recipe_num : recipe_num
					},
					async : false,
					success : function (result) {
						
							console.log("??????????????? best_list ???????????? ?????? ??????.");
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
			
			// ?????? ???????????? ?????? ?????? ??? ?????? ????????????
			let commentBtn = $("#comment-btn");
			commentBtn.click(function () {
				$('#myModal').modal({backdrop: 'static', keyboard: false});
				
				$("#modal-replyer").val("");
				$("#modal-replyer").val(loginid);
				
				$("#modal-content").val("");
				$("#modal-content").attr("placeholder", "?????? ????????? ???????????????.");
				
				$("#modal-submit").show();
				$("#modal-update").hide();				
				
				$("#myModal").modal("show");                
            });			
			
			// ?????? ?????? ?????? ?????? ?????????
			$("button[data-dismiss='alert']").on("click", function (e) {			    
                if (confirm("?????? ???????????????????")) {
                	$("#modal-replyer").val("");
                	$("#modal-content").val("");
                    $("#myModal").modal("hide");
                } else {
                    return;
                }
            });				
			
			// ?????? ?????? ??? submit ??? ?????????
			$("#modal-submit").on("click", function (e) {
				if ($("#modal-content").val() == "") {
					alert("?????? ????????? ???????????????.");
					return;
				}
				if (confirm("????????? ?????????????????????????")) {
					boardReply.add({
						recipe_num : recipe_num,
						member_id : loginid,
						content : $("#modal-content").val().trim()
					}, function (result) {
						if (result == "success") {
							alert("?????? ?????? ??????.");
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
			
			// ?????? ????????? ?????? ?????? ?????? ?????? ??? ?????????
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
				
				$("#modal-update").off("click"); // ????????? ??????...
				
				$("#modal-update").click(function (e) {		
					
					if (beforeContent === $("#modal-content").val().trim()) {
						alert("????????? ???????????? ???????????????. ????????? ?????? ????????? ???????????????.");
						$("#modal-content").focus();
						return;
					} else if ($("#modal-content").val().trim() == "") {
						alert("????????? ?????? ????????? ???????????????.");
						$("#modal-content").focus();
						return;
					} else {
						console.log("?????? ?????? ?????? ???...");
						
						boardReply.update({
							reply_num : reply_num,
							content : $("#modal-content").val().trim()
						}, function (result) {
							if (result == "success") {
								alert("?????? ?????? ??????.");
								$("#modal-replyer").val("");
								$("#modal-content").val("");
								
								$("#myModal").modal("hide");
								showList(1);
							}
						});
						
					}	
				});
				
			});
			
			// ?????? ?????? ?????????
			$("body").on("click", "#reply-delete", function (e) {
				if (confirm("?????? ????????? ?????????????????????????")) {
					let reply_num = $(this).data("reply_num");
					
					boardReply.remove(reply_num, function (result) {
						if (result == "success") {
							alert("?????? ?????? ??????.");
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
						recipeDiv.html("<h5 style='color: olive; text-align: center;'>?????? ????????? ????????? ????????????.</h5>");
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
							str += "	<button id='reply-edit' class='btn btn-warning btn-sm ml-3 shadow-none' type='button' data-reply_num='" + list[i].reply_num + "'>??????</button>";
							str += "	<button id='reply-delete' class='btn btn-danger btn-sm ml-1 shadow-none' type='button' data-reply_num='" + list[i].reply_num + "'>??????</button>";
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
				}); // getList ?????? ???
			}; // showList ?????? ?????? ???
			
			showList(1);			
		}) // document.ready ends
	</script>
	
	

</body>
</html>