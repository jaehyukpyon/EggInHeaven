<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/hootstrap.css">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<style>
#logo:hover {
	cursor: pointer;
}

</style>
<script>
	$(function(){
		$("#logout").click(function(event){
			event.preventDefault();
			$("form[name=logout]").submit();
		})
	})
</script>

<body>
	<div>
		<!-- isAnnoymouse() :  -->


		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="pinfo" />
			<div
				class="card-body d-flex flex-column justify-content-center align-items-center">
				<h4 id="logo" class="card-title text-primary">
					<a href="${pageContext.request.contextPath}/main">Egg in Heaven</a>
				</h4>	
					<a class="nav-link" href="${pageContext.request.contextPath}/mypage">
						<h6 class="text-primary" id="user">${pinfo.username}</h6>
					</a>

			</div>
				<nav class="navbar navbar-expand-md navbar-dark bg-primary mb-2">
					<div class="collapse navbar-collapse justify-content-center"
						id="navbarColor02">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="2">[레시피]</a></li>
							<li class="nav-item"><a class="nav-link" href="3">[상세검색]</a></li>
							<li class="nav-item"><a class="nav-link" href="#">[랭킹]</a></li>
							<li class="nav-item"><a class="nav-link" href="#">[커뮤니티]</a></li>
							<li class="nav-item"><a class="nav-link" href="#">[내 레시피
									등록]</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/mypage">[마이 페이지]</a></li>
								
							<li class="nav-item">
								<form action="${pageContext.request.contextPath}/member/logout" method="post"
									style="margin-bottom:0px" name="logout">
									<a class="nav-link" href="#" id="logout">
										<p id="loginid">[로그아웃]</p>
									</a>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								</form>
							</li>	
								
						</ul>
					</div>
				</nav>
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
		<div
				class="card-body d-flex flex-column justify-content-center align-items-center">
				<h4 id="logo" class="card-title text-primary">
					<a href="${pageContext.request.contextPath}/main">Egg in Heaven</a>
				</h4>				
					<a class="nav-link" href="${pageContext.request.contextPath}/member/login">
						<span class="text-primary">[로그인]</span>
					</a>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
			</div>
		
		
			<nav class="navbar navbar-expand-md navbar-dark bg-primary mb-2">
				<div class="collapse navbar-collapse justify-content-center"
					id="navbarColor02">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="2">[레시피]</a></li>
						<li class="nav-item"><a class="nav-link" href="3">[상세검색]</a></li>
						<li class="nav-item"><a class="nav-link" href="#">[랭킹]</a></li>
						<li class="nav-item"><a class="nav-link" href="#">[커뮤니티]</a></li>
						<li class="nav-item"><a class="nav-link" href="#">[내 레시피
								등록]</a></li>
					</ul>
				</div>
			</nav>
		</sec:authorize>
	</div>


	</div>
</body>

</html>