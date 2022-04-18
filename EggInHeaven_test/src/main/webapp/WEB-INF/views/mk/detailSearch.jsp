<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/hootstrap.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/MK.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet"href="https://unpkg.com/swiper/swiper-bundle.min.css"/>

<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="header.jsp" />
<style>
body{
min-width: 768px}
.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 100px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn btn btn-primary btn-block {background-color: #3e8e41;}

.dropbtn btn btn-primary btn-block {
	width: 4rem;
}


.progress:hover{
	cursor: pointer;
}

.del{
	border: none;	
}
.asd{
	background-color: rgb(239,239,239);
	position: relative;
	display: inline-block;
	float: left;
	width: 85%;
	overflow: hidden;
	height: 3.5rem;
}
.add{
	display: inline-block;
	min-width: 70px;	
}

.box{
	width:0.2rem;
	height: 1rem;
	border: solid; 
	cursor: pointer;
	z-index: 10;
	position : static !important;
}
</style>
</head>
<body>
<div class="container">
	<form id="formData" name="detailSearchList" action="detailSearchList">	
	<div class="parent">
			<div class="dropdown">
				<button class="dropbtn btn btn-primary btn-block btn btn-primary btn-block btn btn-primary btn-block" name="4" value="유제품">유제품</button>
				<div class="dropdown-content">
					<div >
						우유 <input type="checkbox" name="4" value="우유" class="ckbox">
					</div>
					<div >
						버터 <input type="checkbox" name="4" value="버터" class="ckbox">
					</div>
					<div >
						치즈 <input type="checkbox" name="4" value="치즈" class="ckbox">
					</div>
					<div >
						생크림<input type="checkbox" name="4" value="생크림" class="ckbox">
					</div>
					<div >
						요거트 <input type="checkbox" name="4" value="요거트" class="ckbox">
					</div>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn btn btn-primary btn-block btn btn-primary btn-block" name="1">육류</button>
				<div class="dropdown-content">
					<div >
						돼지고기 <input type="checkbox" name="1" value="돼지고기" class="ckbox">
					</div>
					<div >
						소고기 <input type="checkbox" name="1" value="소고기" class="ckbox">
					</div>
					<div >
						닭고기 <input type="checkbox" name="1" value="닭고기" class="ckbox">
					</div>
					<div >
						오리고기<input type="checkbox" name="1" value="오리고기" class="ckbox">
					</div>
					<div >
						가공육 <input type="checkbox" name="1" value="가공육" class="ckbox">
					</div>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn btn btn-primary btn-block" name="3">채소류</button>
				<div class="dropdown-content">
					<div >
						당근 <input type="checkbox" name= "3" value="당근"class="ckbox">
					</div>
					<div >
						양파 <input type="checkbox" name= "3" value="양파"class="ckbox">
					</div>
					<div >
						파 <input type="checkbox" name= "3" value="파" class="ckbox">
					</div>
					<div >
						시금치<input type="checkbox" name= "3" value="시금치" class="ckbox">
					</div>
					<div >
						콩나물 <input type="checkbox" name= "3" value="콩나물" class="ckbox">
					</div>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn btn btn-primary btn-block" name="5">곡 류</button>
				<div class="dropdown-content">
					<div >
						밀가루 <input type="checkbox" name="5" value="밀가루"class="ckbox">
					</div>
					<div >
						쌀 <input type="checkbox" name="5" value="쌀" class="ckbox">
					</div>
					<div >
						옥수수 <input type="checkbox" name="5" value="옥수수" class="ckbox">
					</div>
					<div >
						보리<input type="checkbox" name="5" value="보리" class="ckbox">
					</div>
					<div >
						콩 <input type="checkbox" name="5" value="콩" class="ckbox">
					</div>
				</div>
			</div>
			<div class="dropdown">
				<button class="dropbtn btn btn-primary btn-block" name="2">해산물</button>
				<div class="dropdown-content">
					<div >
						조개류 <input type="checkbox" name="2" value ="조개류" class="ckbox">
					</div>
					<div >
						생선류 <input type="checkbox" name="2" value="생선류" class="ckbox">
					</div>					
				</div>
			</div>
			<div style="display: inline-block; width: 11rem;">
				<div class="progress" style="z-index: 10">
					<div id="progress-bar" class="progress-bar bg-primary" style="width: 2rem;">					
					</div>
					<div class="box">
					</div>										
				</div> 				
			</div>
			
			<input type="text" id ="time" value="10" style="border: none; max-width:2rem; text-align: right;" readonly>분
			<!-- 1. var num= progress 숫자 ==  text.value 2. text 클릭시 -->
			
		</div>
		<!-- search부분 -->
		<div class="research-container">
				<br>
				<br>
				<h5 class="card-title text-primary">선택된 목록</h5>
				
			<div class="asd">
			</div>
			<div style="float: right; background-color: rgb(239,239,239); width: 15%; height: 3.5rem;">			
				  <button id="sub" type="button" style="width: 100%;height: 100%; overflow: hidden;">총 <span id="count">0</span>개 재료 검색</button> 
				<!--   <button id="sub" type="submit" style="width: 100%;height: 100%; overflow: hidden;">총 <span id="count">0</span>개 재료 검색</button> -->
			</div>
		</div>		
	</form>
	
	
	<div id="recipe" style="border: solid; display: flex; overflow: hidden;">  
	<br>
	<br>	 	
	<br>
	<br>
	</div>  
	</div><!-- 콘테이너 -->
</body>
</html>
