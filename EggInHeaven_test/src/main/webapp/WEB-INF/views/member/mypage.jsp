<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>마이페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/mypage/mypage.js"></script>
		<jsp:include page="../mk/header.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">


</head>
<body>


	<div class="container">
		<div class="my_tabs">
			<ul class="nav nav-tabs nav-justified">
				<li class="list-group-item list-group-item-action active">레시피</li>
				<li class="list-group-item list-group-item-action">관심레시피</li>
				<li class="list-group-item list-group-item-action">커뮤니티</li>
				<li class="list-group-item list-group-item-action">개인정보</li>
			</ul>
		</div>

		<div class="content">
			<div class="content-box">
					<table>
						<tr>
              <th>이미지</th>
              <th>본문</th>
              <th>조리시간</th>
            </tr>					
					</table>				
			</div>
		</div>
	</div>
</body>

</html>