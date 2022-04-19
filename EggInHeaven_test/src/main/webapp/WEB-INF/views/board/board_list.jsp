<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>board_list.jsp</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" 
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" 
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/theme.css" />	
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
	
	<style>
		* {
			font-family: 'Poor Story', cursive !important;
		}
		
		select {
			text-align-last: center;
			text-align: center;
			-ms-text-align-last: center;
			-moz-text-align-last: center;
		}
	</style>
	
</head>
<body>

	<jsp:include page="../mk/header.jsp" />
	
	<div class="container-fluid">

        <!-- Page Heading 
        <h1 class="h3 mb-2 text-gray-800">Tables</h1>
        <p class="mb-4">
            DataTables is a third party plugin that is used to generate the demo table below.
            For more information about DataTables, please visit the 
            <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.
        </p>
        -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h4 class="m-0 font-weight-bold text-primary">레시피 목록</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                        <div class="row">                            
                            <div class="col-sm-12 col-md-6">
                                <div id="dataTable_filter" class="dataTables_filter">
                                	<span style="display: inline-block!important;">&nbsp;&nbsp;레시피 제목으로 검색:</span><br />                                    	
                                    &nbsp;
                                    <input id="keyword" class="form-control form-control-sm" placeholder="검색어를 입력하세요." style="display: inline-block!important; width: 70%;" 
                                    	value='<c:out value="${pageMaker.det.keyword }" />' />
                                    <button id="keywordBtn" class="btn btn-outline-primary btn-sm" style="display: inline-block!important; width: 20%;">검색</button>                                    
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                            <br />
                            	<select class="form-control form-control-sm float-right" id="order" style="width: 40%;">
									<option value="latest"
											<c:out value="${pageMaker.det.order eq 'latest' or pageMaker.det.order eq '' or pageMaker.det.order eq null ? 'selected' : '' }" />
										>최신 등록순</option>
									
									<option value="bestest"
											<c:out value="${pageMaker.det.order eq 'bestest' ? 'selected' : '' }" />
										>추천순</option>
								</select>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-12">
                                <table class="table table-bordered dataTable" id="dataTable" width="100%"
                                    cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                    <thead>
                                        <tr role="row" style="text-align: center;">                                            
                                            <th>레시피 번호</th>
                                            <th>제목</th>
                                            <th>등록일</th>
                                            <th>추천수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${list }" var="recipe">
                                    		<tr>
                                    			<td style="text-align: center;"><c:out value="${recipe.recipe_num }" /></td>
                                    			<td>
                                    				<a class="move" href='<c:out value="${recipe.recipe_num }" />'>
                                    					<c:out value="${recipe.recipe_title }" />
                                    				</a>
                                    			</td>
                                    			<td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${recipe.recipe_date }"/></td>
                                    			<td style="text-align: center;"><c:out value="${recipe.recipe_best }" /></td>                                    			
                                    		</tr>
                                    	</c:forEach>                                                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                        
                            <div class="col-sm-12 col-md-3">
                                <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
                                &nbsp;
                                	<c:choose>
                                		<c:when test="${pageMaker.det.keyword ne null and pageMaker.det.keyword ne '' }">
                                    		검색어: <b><c:out value="${pageMaker.det.keyword } "/></b><br />
                                    		레시피 개수: <b><c:out value="${totalListCount }" /></b>개
                                    	</c:when>
                                    	<c:otherwise>                                    		
                                    		전체 레시피 개수: <b><c:out value="${totalListCount }" /></b>개
                                    	</c:otherwise>
                                	</c:choose>
                                    
                                </div>
                            </div>
                            
                            <div class="col-sm-12 col-md-7">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                    <ul class="pagination">
                                        
                                        <c:if test="${pageMaker.prev }">
                                        	<li class="pagination_button page-item previous">
                                        		<a href="${pageMaker.startpage - 1 }" class="page-link">&lt;</a>
                                        	</li>                                        	
                                        </c:if>
                                        
                                        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                                        	<li class="pagination_button page-item ${pageMaker.det.pageNum == num ? 'active' : '' }">
                                        		<a href="${num }" class="page-link">${num }</a>
                                        	</li>
                                        </c:forEach>
                                        
                                        <c:if test="${pageMaker.next }">
                                        	<li class="pagination_button page-item next">
                                        		<a href="${pageMaker.startpage + 1 }" class="page-link">&gt;</a>
                                        	</li>                                        	
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                            
                            <div class="col-sm-12 col-md-2">
                            	<button id="resetListBtn" class="btn btn-outline-dark btn-sm float-right">목록 초기화</button>
                            </div>
                            
                            
                            <%--
                           		페이징을 위한 처리
                            --%>
                            <form id="actionForm" action="/myhome4/board/list" method="get">
                            	<input type="hidden" name="pageNum" value="${pageMaker.det.pageNum }" />
                            	<input type="hidden" name="keyword" value="${pageMaker.det.keyword }" />  
                            	<input type="hidden" name="order" value="${pageMaker.det.order }" />                        
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
    <script>
    	$(document).ready(function () {
    		
    		var actionForm = $("#actionForm");
    		
    		$("li.pagination_button > a").on("click", function (e) {
    			e.preventDefault();
    			
    			console.log("paging a tag click");
    			
    			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    			
    			actionForm.submit();
    		});
    		
    		
    		
    		// 게시글의 제목 클릭 시 이동 이벤트 추가
    		$("a.move").on("click", function (e) {
    			e.preventDefault();
    			actionForm.append("<input type='hidden' name='recipe_num' value='" + $(this).attr("href") + "' />");    			
    			
    			actionForm.attr("action", "/myhome4/board/view");
    			actionForm.submit();
    		});  
    		
    		$("button#keywordBtn").on("click", function (e) {
    			let keyword = $("input#keyword").val();
    			
    			if (keyword == "") {
    				alert("검색어를 입력하세요.");
    				return;
    			}
    			
    			actionForm.find("input[name='keyword']").val(keyword);
    			actionForm.find("input[name='pageNum']").val("1");
    			
    			actionForm.submit();
    		});
    		
    		$("input#keyword").on("keyup", function (e) {
    			if (e.keyCode == 13) {
    				$("button#keywordBtn").trigger("click");
    			}
    		})
    		
    		$("button#resetListBtn").on("click", function (e) {
    			location.href = "/myhome4/board/list";
    		});
    		
    		$("select#order").on("change", function (e) {
    			actionForm.find("input[name='order']").val($(this).val());
    			actionForm.find("input[name='pageNum']").val("1");
    			
    			actionForm.submit();
    		});		
    	});
    </script>
	
</body>
</html>