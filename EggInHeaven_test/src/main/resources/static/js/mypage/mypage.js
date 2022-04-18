	$(function() {
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');

		var recipe = true;
		var commu =false;
		
		var id = $('#user').text();
		console.log(id);
		var data = "id=" + id
		var url ="my_recipe";
		tap = ['내가 쓴 레시피','작성하신 레시피가 없습니다',
			'공유하고 싶은 나만의 레시피를 작성해 주세요',
			'레시피 글 쓰기',
			'',
			'글쓰러 가기']
		ajax(data,url,tap);
		
		
		function ajax(data,url,tap) {
		    output = "";
		    $.ajax({
		        type : "POST",
		        data : data,
		        url	: url,
		        beforeSend: function(xhr){
		            xhr.setRequestHeader(header, token);
		        },
		        dataType : "json",
		        cache : false,
		        success : function(data) {
		            if (data.listcount > 0) { //총 갯수가 0보다 큰 경우
		            	$(".content-box").empty();
		                var num = data.listcount;
		                var img = '';
		                var title = '';
		                var content = '';
		                var view ='';
		                
		                
		                
		                output =  '<h1>'+tap[0]+'</h1><div class="go">'
		                		+ '<b id="all">총 개시글 수 : ' + num + '</b>'
		                		+ '<a id="go" href="/myhome4/'+ tap[4] +'">'+ tap[5] +'</a></div>'
		                		+ '<table class="myrecipe-list table">'
		                		+ '<tr><th>글번호</th><th>이미지</th><th>본문</th>'
		                		+ '</tr>';
		                $(data.boardlist).each(
		                    function(index,item){
		                    	
		                    	if(recipe){
				                	img = "cook" + item.cook_db;
				                	title = item.recipe_title;
				                	content = item.recipe_content;
				                	view = '/myhome4/board/view?num='+ item.recipe_num;
				                }
				                if(commu){
				                	img = "upload" + item.commu_img;
				                	title = item.commu_subject;
				                	content = item.commu_content;
				                	view = '/myhome4/community/detail?num='+ item.commu_num;
				                }
		                    	
		                    	
		                        output += '<tr><td style="width: 100px">' + (num--) + '</td>'
		                            + '<td style="width: 500px">'
		                            + '<a href="' + view + '">'
		                            + '<img class="main-img" src="'+ img + '" />'
		                            + '</a>'
		                            + '</td>'
		                            + '<td class="preview">'
		                            + '<h3>'+ title +'</h3>'
		                            + '<p>'+ content +'</p>'
		                            + '</td>'
		                            + '</tr>'
		                    })
		                   output += '</table>'
		                $(".content-box").append(output)//table완성
		            }else{
		                $(".content-box").empty();
		                console.log("게시글 없음")
		                output = '<div id="no_list">'
							+ '<h3>'+ tap[1] +'</h3>'
							+ '<p>'+ tap[2] +'</p>'
							+ '<a href="/myhome4/'+ tap[4]+'">'
							+ '<button type="button" class="btn btn-primary mr-1">'
							+ tap[3]
							+ '</button>'	
							+ '</a>'
							+ '</div>'
		                
		                $(".content-box").append(output);
		            }
		        }, //success end
				error :function(){
					console.log('에러')
				}
		    })
		}
		
		
		
		
		$(".list-group-item").click(function(){
			$(".list-group-item").removeClass("active");
			$(this).addClass("active");

			
			var nav = $(this).text();
			var output = '';
			
			if(nav == '레시피') {
				console.log('rec')
				recipe = true;
				commu = false;
				
				url = 'my_recipe'
					tap = ['내가 쓴 레시피','작성하신 레시피가 없습니다',
					'공유하고 싶은 나만의 레시피를 작성해 주세요',
					'레시피 글 쓰기',
					'',
					'글쓰러 가기']
				
				ajax(data,url,tap);

				
			}else if(nav == '관심레시피'){
				console.log('like_rec')	
				recipe = true;
				commu = false;
				
				url = 'like_recipe'
					tap = ['관심 레시피','관심등록한 레시피가 없습니다',
						'마음에 드는 레시피를 관심등록해 주세요',
						'관심레시피 등록',
						'board/list',
						'레시피 리스트로 이동']
					
				ajax(data,url,tap);

			}else if(nav == '커뮤니티'){
				console.log('comm')
				recipe = false;
				commu = true;
				
				url = 'my_commu'
					tap = ['나의 커뮤니티 게시글',
							'등록된 커뮤니티 글이 없습니다.',
							'내가 만든 요리, 사소한 일상 등을 공유해 보세요.',
							'커뮤니티 글쓰기',
							'community/write',
							'글쓰러가기']
						
					ajax(data,url,tap);
				
			}else if(nav == '개인정보'){
				console.log('info')
				
				$(".content-box").empty();
				
				$.ajax({
					url:"mypage_info",

					success:function(result) {

					$(".content-box").html(result);

				}});

			}
			
		})
		
		
		
		
	})
