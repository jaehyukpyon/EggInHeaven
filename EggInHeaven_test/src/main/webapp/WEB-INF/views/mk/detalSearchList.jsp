<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="height: 10rem">
		검색

		<br>
		<c:if test="${name != null}">
		 	재료 = <c:forEach var="foodname" items="${name}"> [${foodname}] </c:forEach>
			<br> 
			시간 = ${time }분
		</c:if>
	</div>
	
</body>
</html>