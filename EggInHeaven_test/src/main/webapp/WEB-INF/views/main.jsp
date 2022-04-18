<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>egg in heaven</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>


<style type="text/css">
.swiper-container {
	height: 300px;
}

.swiper-slide {
	text-align: center;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center; /* 위아래 기준 중앙정렬 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
	max-width: 100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}

.container {
	width: 70%;
	position: absolute;
	left: 50%;
	margin-top: 70%;
	transform: translate(-50%, -50%);
}

h1 {
	display: inline-block;
}

.all {
	display: inline-block;
	float: right;
}

.title {
	margin: 0 20px 0 40px;
}

.inner-con {
	margin-top: 100px;
}

.logo {
	width: 99vw;
	height: 500px;
	position: absolute;
}

.image-thumbnail {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.welcome {
	position: absolute;
	z-index: 1;
	width: 70%;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
	color:white; 
	background-color : black;
	opacity:0.8;
	height : 170px;
	width: 65%;
	padding-top :10px;
}
</style>

<script>
$(function() {
	
	$(".content").each(function (index, item) {
		var cont = $(item).text().substring(0,40)


		if(cont.length >= 40)
			cont += "..."

		$(item).text(cont);

	})
	
	
	
})
	
	if("${result}"=="updateSuccess"){
		alert("회원정보 수정 완료");
	}
	
</script>

</head>
<body>
	<jsp:include page="./mk/header.jsp" />

	<div class="logo">
		<img class="image-thumbnail" id="random"
			src="${pageContext.request.contextPath}/resources/main_img/0.jpg">
	</div>
	<div class="welcome">
		<h1 class="display-5">Welcome to</h1><br>
		<h1 class="display-3">egg in heaven</h1>
	</div>



	<div class="container">
		<div class="inner-con">
			<div class="title">
				<h1>인기 레시피 TOP 10</h1>
				<a href="${pageContext.request.contextPath}/board/list">
				<button class="all btn btn-dark">더보기</button>
				</a>
			</div>
			<div class="swiper-container">

				<div class="swiper-wrapper">
					<c:forEach var="r" items="${bestReclist}">
						<div class="swiper-slide">
							<div>
								<a href="${pageContext.request.contextPath}/board/view?num=${r.recipe_num}">
								<img
									src="${pageContext.request.contextPath}/cook${r.cook_db}" />
								</a>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- 네비게이션 -->
				<div class="swiper-button-next"></div>
				<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div>
				<!-- 이전 버튼 -->

				<!-- 페이징 -->
				<div class="swiper-pagination"></div>
			</div>
		</div>


		<div class="inner-con">
			<div class="title">
				<h1>최신 레시피</h1>
				<a href="${pageContext.request.contextPath}/board/list">
				<button class="all btn btn-dark">더보기</button>
				</a>
			</div>
			<div class="swiper-container">

				<div class="swiper-wrapper">
					<c:forEach var="r" items="${newReclist}">
						<div class="swiper-slide">
							<div>
							<a href="${pageContext.request.contextPath}/board/view?num=${r.recipe_num}">
								<img
									src="${pageContext.request.contextPath}/cook${r.cook_db}" />
								<span class="badge badge-primary">new</span>
							</a>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- 네비게이션 -->
				<div class="swiper-button-next"></div>
				<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
				<div class="swiper-button-prev"></div>
				<!-- 이전 버튼 -->

				<!-- 페이징 -->
				<div class="swiper-pagination"></div>
			</div>
		</div>



		<div class="inner-con">
			<div class="title">
				<h1>커뮤니티 최신글</h1>
				<a href="${pageContext.request.contextPath}/community/list">
				<button class="all btn btn-dark">더보기</button>
				</a>
			</div>
			<div>
				<div class="table-responsive">
					<table class="table table-hover table-sm" id="commu">
						<tbody>
							<tr>
								<th class="w-25">제목</th>
								<th class="w-50">본문</th>
								<th class="w-15">조회수</th>
								<th class="w-15">작성일</th>
							</tr>
							<c:forEach var="c" items="${newCommlist}">
								
									<tr onclick="location.href=
									'${pageContext.request.contextPath}/community/detail?num=${c.commu_num}'" 
									style="cursor:hand">
										<td>${c.commu_subject} <span class="badge badge-pill badge-primary">new</span></td>
										<td class="content">${c.commu_content} </td>
										<td>${c.commu_readcount}</td>
										<td>${c.commu_date}</td>
									</tr>
								
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>


	</div>


	<script>
		new Swiper(".swiper-container", {
			slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
			spaceBetween : 30, // 슬라이드간 간격
			slidesPerGroup : 2, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

			// 그룹수가 맞지 않을 경우 빈칸으로 메우기
			// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
			loopFillGroupWithBlank : true,

			loop : true, // 무한 반복

			pagination : {
				// 페이징
				el : ".swiper-pagination",
				clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
			},
			navigation : {
				// 네비게이션
				nextEl : ".swiper-button-next", // 다음 버튼 클래스명
				prevEl : ".swiper-button-prev", // 이번 버튼 클래스명
			},
		});
		
		

	</script>
	<script
		src="${pageContext.request.contextPath}/resources/js/main/main_img.js">		
	</script>


</body>

</html>