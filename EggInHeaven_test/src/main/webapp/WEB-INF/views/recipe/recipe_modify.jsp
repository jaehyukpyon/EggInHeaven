<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/recipe.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/recipe.css">

</head>
<body>
<div class="container">
		<form action="modify_action" method="post" name="recipemodify" enctype="multipart/form-data">
		<%--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
		<input type="hidden" name="member_id" value="${id}">
		<input type="hidden" name="recipe_num" value="${param.num}">
		<div class="center">
			<div class="title">레시피 등록</div>
			
		<div class="cont_box pad1">
			<div class="cont_line">
				<p class="cont_tit">레시피제목</p>
				<input type="text" name="recipe_title" id="recipe_title"
				class="form-control" value='<c:out value="${recipe.recipe_title }" />'
				placeholder="예) 소고기 미역국 끓이기"
				style="width:610px;">
			</div>
			
			<div class="cont_line pad2">
				<p class="cont_tit">요리소개</p>
				<textarea name="recipe_content" id="recipe_content"
				class="form-control step_cont" placeholder="이 레시피의 설명을 해주세요"
				style="height: 100px; width: 610px; resize: none;">${recipe.recipe_content }</textarea>
			</div>
			
			<div class="cont_line">
				<p class="cont_tit">카테고리</p><br>
				<div class="check">
				<b>육류</b> 
					<label>돼지고기<input type="checkbox" name="category_num" value="1-1"></label>
					<label>소고기<input type="checkbox" name="category_num" value="1-2"></label>
					<label>닭고기<input type="checkbox" name="category_num" value="1-3"></label> 
					<label>소세지<input type="checkbox" name="category_num" value="1-4"></label> 
					<label>양고기<input type="checkbox" name="category_num" value="1-5"></label><br>
				<b>해산물</b> 
				<label>생선<input type="checkbox" name="category_num" value="2-1"></label> 
				<label>조개류<input type="checkbox" name="category_num" value="2-2"></label> 
				<label>갑각류<input type="checkbox" name="category_num" value="2-3"></label> 
				<label>오징어<input type="checkbox" name="category_num" value="2-4"></label>  
				<label>해조류<input type="checkbox" name="category_num" value="2-5"></label><br>
				<b>채소류</b>
				<label>양파<input type="checkbox" name="category_num"value="3-1"></label>
				<label>당근<input type="checkbox" name="category_num" value="3-2"></label> 
				<label>파<input type="checkbox" name="category_num" value="3-3"></label> 
				<label>토마토<input type="checkbox" name="category_num" value="3-4"></label> 
				<label>마늘<input type="checkbox" name="category_num" value="3-5"></label><br>
				<b>유제품</b> 
				<label>우유<input type="checkbox" name="category_num"value="4-1"></label>
				 <label>치즈<input type="checkbox" name="category_num" value="4-2"></label> 
				 <label>버터<input type="checkbox" name="category_num" value="4-3"></label> 
				 <label>생크림<input type="checkbox" name="category_num" value="4-4"></label> 
				 <label>요거트<input type="checkbox" name="category_num" value="4-5"></label><br>
				 <b>곡류</b>
				 <label>쌀<input type="checkbox" name="category_num" value="5-1"></label>
				 <label>밀가루<input type="checkbox" name="category_num" value="5-2"></label> 
				 <label>보리<input type="checkbox" name="category_num" value="5-3"></label> 
				 <label>검은깨<input type="checkbox" name="category_num" value="5-4"></label> 
				 <label>찹쌀<input type="checkbox" name="category_num" value="5-5"></label>
			</div>
			</div>
			
			<div class="cont_line">
				<p class="cont_tit">요리시간</p>
				<span class="pad1_1">시간</span>
				<select name="recipe_time" id="recipe_time">
					<option >시간</option>
					<option value="5">5분이내</option>
					<option value="10">10분이내</option>
					<option value="15">15분이내</option>
					<option value="20">20분이내</option>
					<option value="30">30분이내</option>
					<option value="60">60분이내</option>
					<option value="90">90분이내</option>
					<option value="120">120분이내</option>
				</select>
			</div>
		</div>
		
<div class="cont_box pad1">
	<div class="mag" id="material">
		<li id="material_1">
			<p class="cont_tit2 st2 mag">
				<input type="text" name="mat_title_1" id="mat_title_1"
				value="재료" class="form-control"
				style="font-weight: bold; font-size: 18px; width: 210px;">
			</p>
			<ul id="mat_area_1" class="ui-sortable">
			<c:forEach items="${material}"  var="material">
				<li id="limat_1">
					<input type="text" 
					class="form-control" style="width:330px;"
					name="material_name" 
					id="material"placeholder="예)돼지고기"
					value="${material.material_name }"
					>
					<input type="text" 
					class="form-control" style="width:280px;"
					name="material_amount" 
					id="material_amount" placeholder="예)300g"
					value="${material.material_amount }"
					>
					<span class="btn-del" ></span>
				</li>
				
				<!-- <li id="limat_2">
					<input type="text" 
					class="form-control" style="width:330px;" 
					name="material_name" 
					id="material" placeholder="예)양배추">
					<input type="text" 
					class="form-control" style="width:280px;" 
					name="material_amount" 
					id="material_amount" placeholder="예)1/2개">
					<span class="btn-del" ></span>
				</li>
				
				<li id="limat_3">
					<input type="text" 
					class="form-control" style="width:330px;" 
					name="material_name" 
					id="material" placeholder="예)마늘">
					<input type="text" 
					class="form-control" style="width:280px;" 
					name="material_amount" 
					id="material_amount" placeholder="예)5알">
					<span class="btn-del" ></span>
				</li> -->
				</c:forEach>
			</ul>
				

			<button type="button" class="btn_add" id="add_1"
			 	style="padding:0 0 20px 220px; width:880px;">
			 	<span class="glyphicon glyphicon-plus"></span>
			 	추가
			 </button>
		</li>
		<li id="material_2">
			<p class="cont_tit2 st2 mag2">
				<input type="text" name="mat_title_1" id="mat_title_2"
				value="양념" class="form-control"
				style="font-weight: bold; font-size: 18px; width: 210px;">
			</p>
			<ul id="mat_area_2" class="ui-sortable">
			<c:forEach items="${sauce}"  var="sauce">
				<li id="limats_1">
					<input type="text" 
					name="sauce_name"
					value="${sauce.sauce_name }"
					class="form-control" style="width:330px;" 
					placeholder="예)간장">
					<input type="text" 
					name="sauce_amount"
					value="${sauce.sauce_amount }"
					class="form-control" style="width:280px;" 
					placeholder="예)2숟갈">
					<span class="btn-del3" ></span>
				</li>
				
				<!-- <li id="limats_2">
					<input type="text" 
					name="sauce_name"
					class="form-control" style="width:330px;" 
					placeholder="예)다진마늘">
					<input type="text"
					name="sauce_amount" 
					class="form-control" style="width:280px;" 
					placeholder="예)50g">
					<span class="btn-del3" ></span>
				</li>
				
				<li id="limats_3">
					<input type="text" 
					name="sauce_name"
					class="form-control" style="width:330px;" 
					placeholder="예)설탕">
					<input type="text"
					name="sauce_amount" 
					class="form-control" style="width:280px;" 
					placeholder="예)20g">
					<span class="btn-del3" ></span>
				</li> -->
				</c:forEach>
			</ul>
				

			<button type="button" class="btn_add2" id="add_2"
			 	style="padding:0 0 20px 220px; width:880px;">
			 	<span class="glyphicon glyphicon-plus"></span>
			 	추가
			 </button>
		</li>
	</div>
		
		</div>
		<div class="cont_box pad1">
			<p class="cont_tit3">요리순서</p>
			<div id="stepArea">
			<c:forEach var="step" items="${step}">
			<div id="step_1" class="step">
			<p id="step_index" class="cont_tit3_1">Step${step.STEP_INDEX}</p>
			
			<div id="divStepText_1" style="display:inline-block">
                <textarea name="step_content" id="step_content" class="form-control step_cont" 
                placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요."
                 style="height:160px; width:430px; resize:none;">${step.STEP_CONTENT}</textarea>
                 <div id="divStepUpload" style="display:inline-block">
                		<!-- <input type="hidden" name="step_photo[]" id="step_photo_1" value=""> -->
                		<label>
                		<input type="file" name="uploadfile${step.STEP_INDEX}" id="step_file_1"  accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" >
                		
                		<img id="step_img" src="../step${step.STEP_DB }" width="160" height="160">
            				<input type="hidden" name="step_db" value="${step.STEP_DB}">
                		<input type="hidden" name="step_original" value="${step.STEP_ORIGINAL}">
            				</label>
            				<span class="btn-del2" ></span>
            	</div>
            </div>
          </div>
            </c:forEach>
        </div>
            <div class="btn_add mag_b_25" style="padding:0 0 20px 180px; width:820px;"><button type="button" onclick="addStep()" class="btn btn-default">
            <span class="glyphicon glyphicon-plus-sign"></span>순서추가
            </button></div>
            
            
            <p class="cont_tit4">요리완성사진
		 </p>
		 <div id="divWorkArea" style="display:inline-block;" class="ui-sortable">
		<c:forEach var="cookimg" items="${cookimg}" varStatus="status">
                <div id="divWorkUpload_1" class="complete_pic">
            <label>
            <!--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">-->
            <input type="file" name="cook_uploadfile${status.count}" id="q_work_file_1" accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" >
                <img src="../cook${cookimg.COOK_DB }" alt="No Image" style="width: 140px; height: 140px;">
            	<input type="hidden" name="cook_db" value="${cookimg.COOK_DB}">
                <input type="hidden" name="cook_original" value="${cookimg.COOK_ORIGINAL}">
            </label>
            <span class="btn-del4" ></span>
            </div>
    	
              </c:forEach>
              </div>
               <div class="btn_add mag_b_25" style="padding:0 0 20px 180px; width:820px;"><button type="button" onclick="addcook()" class="btn btn-default">
            <span class="glyphicon glyphicon-plus-sign"></span>순서추가
            </button></div>
			</div>
		</div>	
		
		<div class="regi_btm">
    <button type="submit"  class="btn-lg btn-primary">수정</button>
	    
      </div>
      <sec:csrfInput/>
	</form>
</div>

<script>
$('.btn-del').css('display','none');
$('.btn-del3').css('display','none');


	//<button type="button" onclick="mat_add()"class="btn_add"
	//style="padding:0 0 20px 220px; width:880px;">
	//<span class="glyphicon glyphicon-plus"></span>
	//추가
	//</button> var id=$('#material li').attr('id');
	//var id_num =id.split("_")[1];
	
//재료	
var obj=null;

function mat_add(seletor){
	
	console.log(seletor);
	//mat_area_1  - ul 아이디
	//length=$("#mat_area_1 li").length
	
	length=seletor.find("li").length
	
	console.log(length);
	var id;
	var id_num =0;
	//console.log(add_num);
	
	//갯수가 없으면 obj를 clone한다.
	
		 //id = $("#mat_area_1 li").last().attr("id");
		 id = seletor.find("li").last().attr("id");
		 id_num =id.split("_")[1];
		 
		 $("#mat_area_1").append($("#mat_area_1>#limat_1").last().clone());
		 $("#mat_area_1 input[name=material_name]").last().val('');
		 $("#mat_area_1 input[name=material_amount]").last().val('');
		
	 
	
	seletor.find("li").last().attr("id" ,"limat_"+(parseInt(id_num)+1) );
	var length = $('.btn-del').length
 	console.log(length)
 	if (length==1){
 		$('.btn-del').css('display','none')
 	}else{
 		$('.btn-del').css('display','inline-block')
 	}
}//end

$('.mag').on('click', '#add_1', function(){
	selector = $(this).prev(); //ul
	console.log(".mag=" + selector);
	mat_add(selector );
	
})


$('.mag').on('click', '.btn-del', function(){
	$(this).parents("ul>li").remove();
	var length = $('.btn-del').length
 	console.log(length)
 	if (length==1){
 		$('.btn-del').css('display','none')
 	}else{
 		$('.btn-del').css('display','inline-block')
 	}
})
//삭제버튼(재료)
var length = $('.btn-del').length
	 	console.log(length)
	 	if (length==1){
	 		$('.btn-del').css('display','none')
	 	}else{
	 		$('.btn-del').css('display','inline-block')
	 	}

//양념
var obj2=null;
function mat_add2(seletor){
	
	console.log(seletor);
	//mat_area_1  - ul 아이디
	//length=$("#mat_area_1 li").length
	
	length=seletor.find("li").length
	
	console.log(length);
	var id;
	var id_num =0;
	//console.log(add_num);
	
	//갯수가 없으면 obj를 clone한다.
	
		 //id = $("#mat_area_1 li").last().attr("id");
		 id = seletor.find("li").last().attr("id");
		 id_num =id.split("_")[1];
		 
		 $("#mat_area_2").append($("#mat_area_2>#limats_1").last().clone());
	 
	
	seletor.find("li").last().attr("id" ,"limats_"+(parseInt(id_num)+1) );
	var length = $('.btn-del3').length
 	console.log(length)
 	if (length==1){
 		$('.btn-del3').css('display','none')
 	}else{
 		$('.btn-del3').css('display','inline-block')
 	}
}//end

$('.mag').on('click', '#add_2', function(){
	selector = $(this).prev(); //ul
	console.log(".mag=" + selector);
	mat_add2(selector );
	
})


$('.mag').on('click', '.btn-del3', function(){
	$(this).parents("ul>li").remove();
	var length = $('.btn-del3').length
 	console.log(length)
 	if (length==1){
 		$('.btn-del3').css('display','none')
 	}else{
 		$('.btn-del3').css('display','inline-block')
 	}
})
//삭제버튼(소스)

var length = $('.btn-del3').length
	console.log(length)
	if (length==1){
		$('.btn-del3').css('display','none')
	}else{
		$('.btn-del3').css('display','inline-block')
	}
	
	
//요리완성
var cnt=0;
function addcook(){
	
	cnt++;
		 $("#divWorkArea").append($(".complete_pic").first().clone());
		 $("#divWorkArea img").last().attr("src","https://recipe1.ezmember.co.kr/img/pic_none2.gif")
		 
		 $("#divWorkArea input[type=file]").each(function(index, item){ 
		 		$(this).attr("name","cook_uploadfile"+(index+1))
		 	})
		 
		 $("#divWorkUpload_1>label>input").last().attr("id","q_work_file_"+(parseInt(cnt)+1) );	
		 	var length = $('.btn-del4').length
		 	console.log(length)
		 	if (length==1){
		 		$('.btn-del4').css('display','none')
		 	}else{
		 		$('.btn-del4').css('display','inline-block')
		 	}

		 	
	}
	$('#divWorkArea').on('click','.btn-del4', function(){
		
		$(this).parent().remove();
		$('.btn-del4').each(function(index, item){ 
	 		$(this).parent().find('input[type="file"]').attr("name","cook_uploadfile"+(index+1))
	 	})
	 	var length = $('.btn-del4').length
	 	console.log(length)
	 	if (length==1){
	 		$('.btn-del4').css('display','none')
	 	}else{
	 		$('.btn-del4').css('display','inline-block')
	 	}
	})
//요리순서
   //var step_obj=$('#stepArea> div').last().clone();
	var cnt =0;
	function addStep(){
		var id =$('#stepArea> div').last().attr('id');
		var id_num=id.split("_")[1];
		
		cnt++;
		   // $('#stepArea').append(step_obj);
		     $("#stepArea").append($("#stepArea> div").first().clone());
		    $("#stepArea> div").last().attr("id" ,"step_"+(parseInt(id_num)+1) );
		    
		 	$("#stepArea> div>p").last().text("Step"+(parseInt(cnt)+1) );
		 	
		 	$("#divStepUpload>label>input").last().attr("id","step_file_"+(parseInt(cnt)+1) );
		 	$("#stepArea textarea").last().val('')
		 	$("#stepArea img").last().attr("src","https://recipe1.ezmember.co.kr/img/pic_none2.gif")
		 	
		 	
		 	$('.cont_tit3_1').each(function(index, item){ 
		 		$(this).text('Step'+(index+1))
		 		$(this).parent().find('input[type="file"]').attr("name","uploadfile"+(index+1))
		 	})
		 	
		 	var length = $('.btn-del2').length
		 	console.log(length)
		 	if (length==1){
		 		$('.btn-del2').css('display','none')
		 	}else{
		 		$('.btn-del2').css('display','inline-block')
		 	}

		 	
	}
	$('#stepArea').on('click','.btn-del2', function(){
		
		
		$(this).parents(".step").remove();
		$('.cont_tit3_1').each(function(index, item){ 
	 		$(this).text('Step'+(index+1))
	 		$(this).parent().find('input[type="file"]').attr("name","uploadfile"+(index+1))
	 	})
	 	var length = $('.btn-del2').length
	 	console.log(length)
	 	if (length==1){
	 		$('.btn-del2').css('display','none')
	 	}else{
	 		$('.btn-del2').css('display','inline-block')
	 	}
	})
	
	
	
	$("#stepArea").on('change','input[type=file]',function (e) {
		console.log('파일 변경')
		console.log($(this).val()); // 만약 파일명이 melon.png일 경우, C:\fakepath\melon.png
		var file = e.target.files[0];
		var target = $(this);
		//file.type : 파일의 형식 (MIME타입 - 예) image/png, image/gif ...)
		//정규식에서 .은 문자 한개를 의미합니다.
		//정규식에서 *는 0번 이상을 의미합니다.
		//.* : 문자가 0개 또는 1개 이상 올 수 있다는 의미입니다.
		if (!file.type.match('image.*')) { //파일 타입이 image인지 확인합니다.
			alert("확장자는 이미지 확장자만 가능합니다.");
			$('input[type=file]').val('');
			return;
		}
		//파일을 읽기 위한 객체 생성
		var reader = new FileReader();				
		
		//DataURL 형식으로 파일을 읽어옵니다. 
		//읽어온 결과는 reader객체의 result 속성에 저장됩니다.			
		reader.readAsDataURL(file);
		
		//읽기에 성공했을 때 실행되는 이벤트 핸들러	
		reader.onload = function(e) {
			//result:읽기 결과가 저장됩니다.
			//reader.result 또는 e.target.result
		target.next().attr('src', e.target.result);
		}//reader.onload end
			
	}); // input[type="file"]-change event ends
	
	
	
	$("#divWorkArea").on('change','input[type=file]',function (e) {
		console.log($(this).val()); // 만약 파일명이 melon.png일 경우, C:\fakepath\melon.png
		var file = e.target.files[0];
		this$ = $(this);
		//file.type : 파일의 형식 (MIME타입 - 예) image/png, image/gif ...)
		//정규식에서 .은 문자 한개를 의미합니다.
		//정규식에서 *는 0번 이상을 의미합니다.
		//.* : 문자가 0개 또는 1개 이상 올 수 있다는 의미입니다.
		if (!file.type.match('image.*')) { //파일 타입이 image인지 확인합니다.
			alert("확장자는 이미지 확장자만 가능합니다.");
			$('input[type=file]').val('');
			return;
		}
		//파일을 읽기 위한 객체 생성
		var reader = new FileReader();				
		
		//DataURL 형식으로 파일을 읽어옵니다. 
		//읽어온 결과는 reader객체의 result 속성에 저장됩니다.			
		reader.readAsDataURL(file);
		
		//읽기에 성공했을 때 실행되는 이벤트 핸들러	
		reader.onload = function(e) {
			//result:읽기 결과가 저장됩니다.
			//reader.result 또는 e.target.result
		this$.next().attr('src', e.target.result);
		
		}//reader.onload end
			
	}); // input[type="file"]-change event ends
	
	
 var c_r='${category}';//2-2,3-2,
 var c_r_array=c_r.split(",");
 for(i=0;i<c_r_array.length-1;i++){
	 $("input[value=" + c_r_array[i] + "]").prop('checked',true);
 }
 
 $("#recipe_time").val('${recipe.recipe_time}')
 





</script>

</body>
</html>