<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST</title>
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/hootstrap.css">
<style>
	#logo:hover{		
		cursor: pointer;
	}
</style>
<body>
<div>
	
	<div class="card-body d-flex flex-column justify-content-center align-items-center">		
		<h4 id ="logo" class="card-title text-primary">Egg in Heaven</h4>				
								<span> [ admin ] </span> if 로그인시 표시
	</div>

		<nav class="navbar navbar-expand-md navbar-dark bg-primary mb-2">
			<div class="collapse navbar-collapse justify-content-center" id="navbarColor02">
				<ul class="navbar-nav">					
					<li class="nav-item"><a class="nav-link" href="#">[레시피]</a></li>
					<li class="nav-item"><a class="nav-link" href="3">[상세검색]</a></li>
					<li class="nav-item"><a class="nav-link" href="#">[랭킹]</a></li>
					<li class="nav-item"><a class="nav-link" href="#">[커뮤니티]</a></li>
					<li class="nav-item"><a class="nav-link" href="#">[내 레시피 등록]</a></li>
					<li class="nav-item"><a class="nav-link" href="#">[마이 페이지]</a>
					</li>
				</ul>
			</div>
		</nav>
</div>
</body>
</html>