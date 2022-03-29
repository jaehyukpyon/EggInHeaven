<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="header.jsp" />
<style>
.dropbtn {
	background-color: #ea2129;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content .a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content .a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}

.dropdown-content {
	align-items:
}

.slide {
	voerflow: hidden;
	position: relative;
	display: inline-block;
}

.slide-container {
	width: 300vw;
	height: 400px;
	display: flex;
	transition: all 0.8s;
	padding: 0 1.5rem;
}

.box {
	margin: 0.5rem 0.5rem;
	width: 150px;
	height: 150px;
}

.box:nth-of-type(1) {
	background-color: red
}

.box:nth-of-type(2) {
	background-color: green
}

.box:nth-of-type(3) {
	background-color: blue
}

.box:nth-of-type(4) {
	background-color: red
}

.next {
	position: absolute;
	top: 20%;
	right: 0;
}

.prev {
	position: absolute;
	top: 20%;
	left: 0;
	top: 20%;
}

.list {
	border: solid 0.5px;
	align-items: center !important;
	justify-content: center !important;
}
</style>
</head>
<body>
	<div class="card-body d-flex flex-column justify-content-center align-items-center">
		<div class="dropdown">
			<button class="dropbtn">유제품</button>
			<div class="dropdown-content">
				<div class="a">
					우유 <input type="checkbox" class="ckbox">
				</div>
				<div class="a">
					밀크 <input type="checkbox" class="ckbox">
				</div>
				<div class="a">
					요거트 <input type="checkbox" class="ckbox">
				</div>
				<div class="a">
					치즈<input type="checkbox" class="ckbox">
				</div>
				<div class="a">
					우유 <input type="checkbox" class="ckbox">
				</div>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn">육류</button>
			<div class="dropdown-content">
				<div class="a">
					1 <input type="checkbox" class="ckbox">
				</div>
				<div class="a">
					2 <input type="checkbox" class="ckbox">
				</div>
				<div class="a">
					3 <input type="checkbox" class="ckbox">
				</div>
				<div class="a">
					4<input type="checkbox" class="ckbox">
				</div>
				<div class="a">
					5 <input type="checkbox" class="ckbox">
				</div>
			</div>
		</div>
		<div class="dropdown">
		<button class="dropbtn">채소류</button>
		<div class="dropdown-content">
			<div class="a">
				우유 <input type="checkbox" class="ckbox">
			</div>
			<div class="a">
				밀크 <input type="checkbox" class="ckbox">
			</div>
			<div class="a">
				요거트 <input type="checkbox" class="ckbox">
			</div>
			<div class="a">
				치즈<input type="checkbox" class="ckbox">
			</div>
			<div class="a">
				우유 <input type="checkbox" class="ckbox">
			</div>
		</div>
		</div>
		<div class="dropdown">
		<button class="dropbtn">곡 류</button>
		<div class="dropdown-content">
			<div class="a">
				우유 <input type="checkbox" class="ckbox">
			</div>
			<div class="a">
				밀크 <input type="checkbox" class="ckbox">
			</div>
			<div class="a">
				요거트 <input type="checkbox" class="ckbox">
			</div>
			<div class="a">
				치즈<input type="checkbox" class="ckbox">
			</div>
			<div class="a">
				우유 <input type="checkbox" class="ckbox">
			</div>
		</div>
		</div>
		<div class="dropdown">
		<button class="dropbtn">해산물</button>
		<div class="dropdown-content">
			<div class="a">
				우유 <input type="checkbox" class="ckbox">
			</div>
			<div class="a">
				밀크 <input type="checkbox" class="ckbox">
			</div>
			<div class="a">
				요거트 <input type="checkbox" class="ckbox">
			</div>
			<div class="a">
				치즈<input type="checkbox" class="ckbox">
			</div>
			<div class="a">
				우유 <input type="checkbox" class="ckbox">
			</div>
		</div>
		</div>
		<hr>
		<div>
			요리시간
			<div class="progress mb-2">
				<div class="progress-bar bg-primary w-25" role="progressbar"
					aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
			</div>
		</div>
	</div>
	<hr>
	<div class="card-body d-flex flex-column justify-content-center align-items-center">
		<div>
			<label>랭킹 레시피 리스트 </label>
		</div>
		<div class="slide">
			<div>
				<div class="dropbtn">
					<div>box1</div>
					<div>설명 글</div>
				</div>
				<div class="dropbtn">
					<div>box2</div>
				</div>
				<div class="dropbtn">
					<div>box3</div>
				</div>
				<div class="dropbtn">
					<div>box4</div>
				</div>
			</div>
			<button class="next">&gt;</button>
			<button class="prev">&lt;</button>
		</div>
	</div>
</body>

</html>
