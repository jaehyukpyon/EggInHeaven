$(function() {

	// 기본 레시피 뿌려주기
	$("#recipe").load("2");

	// 전체 선택 전체 해제
	$('.dropbtn')
			.on(
					'click',
					function(e) {
						e.preventDefault();
						var name = $(this).attr('name');
						var total = $("input[name=" + name + "]").length;
						var checked = $("input[name=" + name + "]:checked").length;

						if (total != checked) {
							$("input:checkbox[name='" + name + "']").prop(
									"checked", true);
							for (var i = 0; i < total; i++) {
								// var chk = $("input[name="+name+"]")[i].value;
								// // name= milk 일 경우 결과 우 , 터 , undefined
								$('.asd')
										.append(
												'<div class="add" id="'
														+ name
														+ '" name="'
														+ $("input[name="
																+ name + "]")[i].value
														+ '"> [ <span>'
														+ $("input[name="
																+ name + "]")[i].value
														+ '</span> ] <button type="button"class="del">x</button> </div>');
							}
						} else {
							$("input:checkbox[name='" + name + "']").prop(
									"checked", false);
							for (var i = 0; i < total; i++) {
								$('#' + name).remove();
							}
						}
						count();
					})

	// 체크박스 선택 또는 해제시
	$('.ckbox')
			.change(
					function() {
						var name = $(this).attr('name');
						var val = $(this).attr('value');
						if ($(this).is(":checked") == true) {
							$('.asd')
									.append(
											'<div class="add" id = "'
													+ name
													+ '" name="'
													+ val
													+ '"> [ <span>'
													+ val
													+ '</span> ] <button type="button"class="del">x</button> </div>');
						} else if ($(this).is(":checked") == false) {
							$("div[name=" + val + "]").remove();

						}
						count();
					})

	// X버튼 클릭시
	$('.asd').on('click', '.del', function() {
		var ckname = $(this).parent().find('span').text();
		$("input:checkbox[value='" + ckname + "']").prop("checked", false);
		$(this).parent().remove();
		count();
	})

	// 총 선택된 갯수
	function count() {
		var milk = $("input:checkbox[name='milk']:checked").length;
		var meat = $("input:checkbox[name='meat']:checked").length;
		var vegetable = $("input:checkbox[name='vegetable']:checked").length;
		var serial = $("input:checkbox[name='serial']:checked").length;
		var seefood = $("input:checkbox[name='seafood']:checked").length;
		var count = milk + meat + vegetable + serial + seefood;
		$('#count').text(count);
	}

	$('#sub').on("click", function() {
		var id = $.map($('.add'), function(name) {
			return $(name).attr("id");
		})
		var name = $.map($('.add'), function(name) {
			return $(name).attr("name");
		})
		var time = $('#time').val();
		if ($("#count").text() == 0) {
			alert("검색할 재료가 없습니다.");
			return;
		}
		$.ajax({
			url : "4",
			type : "get",
			async : false,
			traditional : true, // 배열 넘기기 옵션
			data : {
				"id" : id,
				"name" : name,
				time : time
			},
			success : function(result) {
				$("#recipe").html(result);
			}
		});
	})

	$(".progress").click(function(e) {
		var temp = e.pageX - this.offsetLeft;
		var time = Math.round(temp / 10) * 10;
		if (time < 10) {
			time = 10;
		}
		move(time)
	})
	
	$('.box').draggable({
		containment : 'parent', // 부모요소 안에 종속
		drag : function(e) {
			var start = $('.progress').offset().left;
			var end = start +$(".progress").outerWidth();
			var barLength = $(".progress-bar").outerWidth();
			var barStart = $(".progress-bar").offset().left;
			var temp = e.pageX - start;
			var time = Math.round(temp / 10) * 10;
			$('.box').css("left", barStart + barLength);
			if(time > 180){
				time = 180;
			}
			if(time < 10){
				time = 10;
			}			
			move(time);
		}
	})
	
	

	function move(time) {
		$("#time").val(time);
		$('#progress-bar').width(time);	
	}
	


})