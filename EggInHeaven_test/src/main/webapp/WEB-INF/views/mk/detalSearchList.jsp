<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<head>
<style type="text/css">
img {
	width: 8rem;
	height: 9rem;
}

.qwe{
	float: left;
	align-items: center;
	justify-content: center;	
	width: 10rem;
	margin: 0.7rem;	
}
.test{
	display: flex;
	overflow-x: auto; 

}
.test::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}

#search{
	padding: 0.5rem;
}
img{
	cursor: pointer;
}
.ri{
 	float: right;
 	position: relative; 	
 	bottom : 8rem;
 	right: -1rem;
}
.le{
	float: left;
	position: relative;
	bottom : 8rem;
	left : -1rem;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<div class="test">
	<c:choose>
	<c:when test="${search != null }">
	<c:forEach var = "recipe" items="${search}">
		<div class="qwe" >		
			<div>				
				<img id="${recipe.recipe_num }" src="${pageContext.request.contextPath}/resources/img/portfolio/${recipe.cook_original}">
			</div>			
			<div>			
				<span>${recipe.recipe_title}</span><br>				
				<span> 시간 : ${recipe.recipe_time} </span>
			</div>		
		</div>					
	</c:forEach>
	</c:when>
	<c:otherwise>
		<c:forEach var = "recipe" items="${all }">
			<div class="qwe">		
			<div>				
				<img id="${recipe.recipe_num }" src="${pageContext.request.contextPath}/resources/img/portfolio/${recipe.cook_original}">
			</div>			
			<div>			
				<span>${recipe.recipe_title}</span><br>				
				<span> 시간 : ${recipe.recipe_time} </span>
			</div>		
		</div>	
		</c:forEach>
	</c:otherwise>
	</c:choose>
	</div>
						<button class="le"> < </button>
		<button class="ri"> > </button>	
		<c:if test="${result == 1}">
			<div id="search">
		 		<span>재료 = <c:forEach var="foodname" items="${name}"> [${foodname}] </c:forEach></span>
				<br> 
				<span>시간 = ${time }분</span>
				<span id="allCancel"style="float:right; cursor: pointer;">모두 지우기</span>
			</div>			
		</c:if>				 
		<c:if test="${result == 0}">	
		<div id="search">
			<br>
			<span style="color : red">검색 결과가 없어 기존 리스트를 보여줍니다.</span>
		</div>
		</c:if>	
	</div>


</body>
</html>