<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<!-- 추가 CDN -->
<!-- toastr.CSS -->
   <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></link>
<!-- toastr.JS -->
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
	integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<style>
/* input {
	vertical-align: middle;
	margin : 3px  2px;
}

*/
/* .btnpart {
	background-color: #555555;
	color: white;
} */

/* button:hover {
	color: black;
	background-color: white;
} */
button {     
	color: black;
    text-align: center;
    
    border: solid 1px #2c3e50;
    margin: 3px;
    line-height: 25px;
    padding: 0px 15px 0px 15px;
    border-radius: 5px 5px 0px 0px;
		  }
button:hover {
	color: black;
	background-color: white;
}
</style>
</head>
<body>

		<div style="padding-bottom: 70px; ">
		<div class="mainTitle" style="padding-bottom:15px;">
		<h1>설비 등록</h1>
	 	<!-- <div id="in/out"></div> -->
		</div>
			<div class="min2">
				<button type="button" id="reset" class="btn2">초기화</button>
				<button type="button" id="btnok" class="btn2" >저장</button>
			</div>
			<div class="min1" >
			<div style="background-color: #e9ecef; padding: 8px;">
			<div class="mainTitle" style="padding: 15px;">
			<form name="frm" id="frm" method="POST" enctype="multipart/form-data">
				<div class="row">

					<div class="col-8">
						<hr style="border: solid 2px gray;" />

						<!-- 설비명 -->
						<div class="col-md-5 " style="padding-bottom: 20px;">
							<div class="input-group ">
								<label for="inputText" class="col-form-label"
									style="padding-right: 27px;">모델명<span style="color:red">*</span></label> <input type="text"
									id="eq_mdnm" name="eq_mdnm" class="form-control"
									style="width: 30px" data-name="모델명" title="업체명+제품명+설비구분 ex)태진빼빼로반죽기" onkeypress="addKeyword(event)" required autofocus>

							</div>
						</div>

						<!-- 사용여부 -->
						<div class="col-md-5 " style="padding-bottom: 30px;">
							<div class="input-group ">
								<label for="inputText" class="col-form-label"
									style="padding-right: 27px;">사용여부</label>

								<div class="form-check">
									<input class="form-check-input" type="radio" name="eq_actst"
										value="USE01" checked="checked"> <label class="form-check-label"
										for="flexRadioDefault1" style="width: 15px;">Y</label>

								</div>
								&nbsp;&nbsp;
								<div class="form-check">
									<input class="form-check-input" type="radio" name="eq_actst"
										value="USE02"> <label class="form-check-label"
										for="flexRadioDefault2" >N</label>
								</div>


							</div>
						</div>

						<!-- 구분코드 -->
						<!--  eq_cd는 함수로 알아서 생성 > 인자값을 일부러 넘기지 않음 -->
						<div class="col-md-5 " style="padding-bottom: 20px;">
							<div class="input-group ">
								<label for="inputText" class="col-form-label"
									style="padding-right: 27px;">구분코드</label> <input type="text"
									id="eq_divCd" name="eq_nm" class="form-control"/>
								<button type="button" id="eqdiv">조회</button>

								<input type="text" id="eq_divNm" class="form-control">

							</div>
						</div>
						<!-- 모델번호 -->
						<div class="col-md-5 " style="padding-bottom: 20px;">
							<div class="input-group ">
								<label for="inputText" class="col-form-label"
									style="padding-right: 27px;">모델번호</label> <input type="text"
									class="form-control" id="eq_mdno" name="eq_mdno"
									style="width: 50px" placeholder="모델번호">

							</div>
						</div>


						<!-- 제작업체 -->
						<div class="col-md-5 " style="padding-bottom: 20px;">
							<div class="input-group ">
								<label for="inputText" class="col-form-label"
									style="padding-right: 27px;">제작업체</label> <input type="text"
									id="vdr_code" name="vdr_code" class="form-control"
									style="width: 20px"> &nbsp;&nbsp; <label
									for="inputText" class="col-form-label"
									style="padding-right: 10px;">UPH*</label> <input type="text"
									id="eq_uph" name="eq_uph" class="form-control" min="1"
									max="500" style="width: 50px" data-name="UPH" required>

							</div>
						</div>

						<!-- 가용온도 -->
						<div class="col-md-5 " style="padding-bottom: 20px;">
							<div class="input-group ">
								<label for="inputText" class="col-form-label"
									style="padding-right: 27px;">가용온도</label> <input type="text"
									id="eq_min" name="eq_min" class="form-control"
									style="width: 20px" placeholder="최소" data-name="최소">
								&nbsp;
								<h3>~</h3>
								&nbsp; <input type="text" id="eq_max" name="eq_max"
									class="form-control" style="width: 50px" placeholder="최대"
									data-name="최대">
								<h3>℃</h3>
							</div>
						</div>

						<!-- 점검주기 -->
						<div class="col-md-5 " style="padding-bottom: 20px;">
							<div class="input-group ">
								<label for="inputText" class="col-form-label"
									style="padding-right: 27px;">점검주기</label> <input type="number"
									class="form-control" id="eq_chkcyc" name="eq_chkcyc"
									style="width: 30px" min="3" max="7" placeholder="일수기준"
									data-name="점검주기">
									 <label for="inputText" class="col-form-label"
									style="padding-right: 27px; font-size:19px;">일</label>

							</div>
						</div>


						<!-- 등록인 /  구매일자 -->
						<div class="col-md-5 " style="padding-bottom: 20px;">
							<div class="input-group ">
								<label for="inputText" class="col-form-label"
									style="padding-right: 27px;">등록자명</label> <input type="text"
									class="form-control" id="eq_inster" name="eq_inster"
									style="width: 20px"> &nbsp;

							</div>
						</div>


						<!-- 구매일자 -->
						<div class="col-md-5 " style="padding-bottom: 20px;">
							<div class="input-group ">
								<label for="inputText" class="col-form-label"
									style="padding-right: 27px;">구매일자</label> <input type="date"
									class="form-control" id="eq_purdt" name="eq_purdt"  style="width: 50px">
							</div>
						</div>


						<input type="hidden" class="form-control" id="eq_actst" name="eq_actst" value="">
						<input type="hidden" class="form-control" id="uuid" name = "uuid" value="">
						<input type="hidden" class="form-control" id="img_path" name="img_path">
						<input type="hidden" class="form-control" id="img_nm" name="img_nm" >
						




					</div>
					<div class="col-4">
						<img id="prevu" src="#" onError="this.style.visibility='hidden'" />


						<div class="mb-2 ">
							<label for="formFile" class="form-label"></label> <input
								class="form-control" type="file"  id="upldfile" name="file"
								onchange="readURL(this)" accept="image/*" />
						</div>

					</div>

				</div>

			</form>
			<!--  END OF FORM -->
		</div> 
		
		<hr style="border: solid 2px gray;" />
	</div>
	<!-- END OF DIV-->
	

</div>
</div>
	<div id="modalDiv"></div>


</body>
<script>
	// 모델명 일정키워드 서치후 모델번호 input에 자동 키워드 생성 
	function addKeyword(ev){
		var inputVal = $("#eq_mdnm").val();
		
		if(ev.keyCode === 13){ // 엔터키가 입력된경우
			if(inputVal.includes('누드')){
				if(inputVal.includes('태진')){
					if(inputVal.includes('반죽')){
						// 태진누드반죽 키워드 타이핑시
						$("#eq_mdno").val('TJNDMX');
					}else if(inputVal.includes('성형')){
						// 태진누드성형 키워드 타이핑시
						$("#eq_mdno").val('TJNDTRM');	
					}else if(inputVal.includes('냉각')){
						// 태진누드냉각 키워드 타이핑시
						$("#eq_mdno").val('TJNDFRZ');	
					}else if(inputVal.includes('포장')){
						// 태진누드포장 키워드 타이핑시
						$("#eq_mdno").val('TJNDBX');	
					}
					
				}
				else if(inputVal.includes('금영')){
					if(inputVal.includes('반죽')){
						// 금영누드반죽 키워드 타이핑시
						$("#eq_mdno").val('GYNDMX');	
					}else if(inputVal.includes('성형')){
						// 금영누드성형 키워드 타이핑시
						$("#eq_mdno").val('GYNDTRM');	
					}else if(inputVal.includes('냉각')){
						// 금영누드냉각 키워드 타이핑시
						$("#eq_mdno").val('GYNDFRZ');	
					}else if(inputVal.includes('포장')){
						// 금영누드포장 키워드 타이핑시
						$("#eq_mdno").val('GYNDBX');	
					}
				} else{
					if(inputVal.includes('반죽')){
						// 누드반죽 키워드 타이핑시
						$("#eq_mdno").val('NDMX');	
					}else if(inputVal.includes('성형')){
						// 누드성형 키워드 타이핑시
						$("#eq_mdno").val('NDTRM');	
					}else if(inputVal.includes('냉각')){
						// 누드냉각 키워드 타이핑시
						$("#eq_mdno").val('NDFRZ');	
					}else if(inputVal.includes('포장')){
						// 누드포장 키워드 타이핑시
						$("#eq_mdno").val('NDBX');	
					}
				} 
				
			}
			else if(inputVal.includes('아몬드')){
						if(inputVal.includes('태진')){
							if(inputVal.includes('반죽')){
								// 태진아몬드반죽 타이핑시
								$("#eq_mdno").val('TJALMMX');	
							}else if(inputVal.includes('성형')){
								// 태진아몬드성형 타이핑시
								$("#eq_mdno").val('TJALMTRM');	
							}else if(inputVal.includes('냉각')){
								// 태진아몬드냉각 타이핑시
								$("#eq_mdno").val('TJALMFRZ');	
							}else if(inputVal.includes('포장')){
								// 태진아몬드포장 타이핑시
								$("#eq_mdno").val('TJALMBX');	
							}
					
					}
					else if(inputVal.includes('금영')){
							if(inputVal.includes('반죽')){
								// 금영아몬드반죽 타이핑시
									$("#eq_mdno").val('GYALMMX');	
								}else if(inputVal.includes('성형')){
									// 금영아몬드성형 타이핑시
									$("#eq_mdno").val('GYALMTRM');	
								}else if(inputVal.includes('냉각')){
									// 금영아몬드냉각 타이핑시
									$("#eq_mdno").val('GYALMFRZ');	
								}else if(inputVal.includes('포장')){
									// 금영아몬드포장 타이핑시
									$("#eq_mdno").val('GYALMBX');	
								}
					} else{
						if(inputVal.includes('반죽')){
							// 아몬드반죽 타이핑시
								$("#eq_mdno").val('ALMMX');	
							}else if(inputVal.includes('성형')){
								// 아몬드성형 타이핑시
								$("#eq_mdno").val('ALMTRM');	
							}else if(inputVal.includes('냉각')){
								// 아몬드냉각 타이핑시
								$("#eq_mdno").val('ALMFRZ');	
							}else if(inputVal.includes('포장')){
								// 아몬드포장 타이핑시
								$("#eq_mdno").val('ALMBX');	
							}
					} 
				
			}
			else{
				if(inputVal.includes('태진')){
					if(inputVal.includes('반죽')){
						// 태진빼빼로반죽 타이핑시
						$("#eq_mdno").val('TJORIMX');
					}else if(inputVal.includes('성형')){
						// 태진빼빼로성형 타이핑시
						$("#eq_mdno").val('TJORITRM');
					}else if(inputVal.includes('냉각')){
						// 태진빼빼로냉각 타이핑시
						$("#eq_mdno").val('TJORIFRZ');
					}else if(inputVal.includes('포장')){
						// 태진빼빼로포장 타이핑시
						$("#eq_mdno").val('TJORIBX');
					}

				}else if(inputVal.includes('금영')){
					if(inputVal.includes('반죽')){
						// 금영빼빼로반죽 타이핑시
						$("#eq_mdno").val('GYORIMX');
					}else if(inputVal.includes('성형')){
						// 금영빼빼로성형 타이핑시
						$("#eq_mdno").val('GYORITRM');
					}else if(inputVal.includes('냉각')){
						// 금영빼빼로냉각 타이핑시
						$("#eq_mdno").val('GYORIFRZ');
					}else if(inputVal.includes('포장')){
						// 금영빼빼로포장 타이핑시
						$("#eq_mdno").val('GYORIBX');
					}
				} else{
					if(inputVal.includes('반죽')){
						// 빼빼로반죽 타이핑시
						$("#eq_mdno").val('ORIMX');
					}else if(inputVal.includes('성형')){
						// 빼빼로성형 타이핑시
						$("#eq_mdno").val('ORITRM');
					}else if(inputVal.includes('냉각')){
						// 빼빼로냉각 타이핑시
						$("#eq_mdno").val('ORIFRZ');
					}else if(inputVal.includes('포장')){
						// 빼빼로포장 타이핑시
						$("#eq_mdno").val('ORIBX');
					}
					
				} 
			}
		}
	};


// 이미지 파일 썸네일 보기 구현완료
function readURL(input) {
    	if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.readAsDataURL(input.files[0]);
		
        //파일이름 가져옴
        var imgNm = input.files[0].name;
      	var imgSrc = null;
        
        // 이미지 파일 명 input 에 넣기
        img_nm.value = imgNm;
        
        reader.onload = function (e) {
    	
        	var tempImage=new Image();
        	tempImage.src=reader.result;
        	
        	
        	 // 이미지 고유 경로 input에 넣기
        	//img_path.value=tempImage.src;
        	
        	//console.log("img_path: "+ img_path.value);
        	
        	tempImage.onload=function(){
        		var canvas=document.createElement('canvas');
        		var canvasContext=canvas.getContext("2d");
        		
        		
            	var img = new Image();
	        	img.src = e.target.result;
	        	//console.log("img.src:" + img.src);
	        	console.log(img);
	        	$("#img_path").val(img.src);
	        	$("#img_nm").val(imgNm);
	        	
	        	
        		canvas.width=img.width*0.7;
        		canvas.height=img.height*0.7;
        		
        		canvasContext.drawImage(this,0,0,canvas.width,canvas.height);
        		
        		var dataURI=canvas.toDataURL("image/png");
        		
        		document.querySelector("#prevu").src=dataURI; // 
        		document.querySelector("#prevu").style.visibility="visible"; // 엑박이 아닐경우 보이기 
        		
        		imgSrc = img.src;
        		
        		}
        
        	
        	};
        	
    	}
    	
    	
			// 사진 첨부 시 현재 value값들
    	console.log("img_nm: "+ $("#img_nm").val());
    	console.log("img_src: "+ $("#img_path").val());
    	
    	console.log("eq_mdnm: "+ eq_mdnm.value);
    	console.log("vdr_code: "+ vdr_code.value);
    	console.log("eq_min: "+ eq_min.value); 
    	console.log("eq_max: "+ eq_max.value); 
    	console.log("eq_uph: "+ eq_uph.value); 
    	console.log("eq_purdt: "+ eq_purdt.value); 
    	
    	console.log("eq_inster: "+ eq_inster.value); 
    	console.log("uuid: "+ uuid.value); 
    	
    	
	}// END OF readURL(input) 


//UUID 생성 부 - 사용 중
// 참고 : https://developyo.tistory.com/110
function makeUUID(){
	// uuid 리턴
	 	return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	
		// UUID 가 중복이 될경우도 생각을 해보고 보통은 이미지명 + UUID 로 조합하여 중복을 제거하는게 일반적
}


/* 	 var vdrCode = $("#vdr_code").val();
	 var eqMdnm =  $("#eq_mdnm").val();
	 var eqNm =  $("#eq_nm").val();
	 var eqMdno =  $("#eq_mdno").val();
	 var eqUph =  $("#eq_uph").val();
	 var eqMin =  $("#eq_min").val();
	 var eqMax =  $("#eq_max").val();
	 var eqChkcyc =  $("#eq_chkcyc").val();
	 var eqInster =  $("#eq_inster").val();
	 var eqPurdt =  $("#eq_purdt").val();
	 var imgPath =  $("#img_path").val();
	 var uuid = makeUUID();
	 var imgNm =  $("#img_nm").val();*/
	// $("#eq_actst").val( $("input[name='testinput']:checked").val());  
	
	 
	
	 //var frmVal = $("#frm input");
		
		
			reset.addEventListener("click" , function(){
				$("#prevu").attr("src" , "");
				$(".form-check-input").checked = false;
				$(".form-control").val('');
			});
			
			// 클릭시 form  submit
			$("#btnok").on("click" , function(e){
				$("#uuid").val( makeUUID() );
				
				
			
//
								// 다 돌고 null 또는 공백이 없는 경우
							//toastr.success('등록완료!');
								//$("form").attr('action' , "eqMngPage"); 
								//$("form").submit(); 
					var form = $("#frm")[0];
					var data = new FormData(form); // form데이터는 form전체를 아울러 file타입도 같이 넘어간다
								
								$.ajax({
									url : "eqMng",
									method : "POST",
									data : data ,
									processData: false,
									contentType: false,
									success : function(){
										
										toastr.options = {
									            closeButton: false,
									            progressBar: true,
									            timeOut: 1200
									        	};
										toastr.success('등록완료!');
										$("#frm").prop('action' , "eqMngPage");
										setTimeout(function(){
											location.reload(); // 등록이 완료된다면 새로고침을 진행
										}, 1500);
										
										//$("form").submit();
										
									},
									error : function(){
										console.log($(".form-control"));
										toastr.options = {
									            closeButton: true,
									            progressBar: true,
									            positionClass: "toast-bottom-right",
									            timeOut: 5000
									        	};
										toastr.error('빈칸을 채워주세요!');
										
									}
									
									
								
									 
								}); // END OF AJAX
								
								
				
			}); // END OF BUTTON CLICKED EVENT AJAX
			

						
		//}); // END OF FORM SUBMIT BUTTON

				// 폼 양식 등록 > alert창 출력후 바로 등록
				
				
	
				
			 // console.log(  $("input[name='eq_actst']:checked").val()  ); // 사용여부 실시간 체크 Y or N


				
				// 조회 버튼을 클릭시  > 모달 호출
				eqdiv.addEventListener("click" , function(){
					
					//모달 페이지 호출 부
					$("#modalDiv").load("eqdvmodal" , function(){
						const myModal = new bootstrap.Modal('#myModal');
						myModal.show();	
						
						
					})
								
				});
				
				
				$("#eq_inster").on("click" , function(){
					//모달 페이지 호출 부
					$("#modalDiv").load("eqInstermodal" , function(){
						const myModal = new bootstrap.Modal('#myModal');
						myModal.show();	
						
						
					})
					
				});
				
				$("#vdr_code").on("click" , function(){
					//모달 페이지 호출 부
					$("#modalDiv").load("eqvdrmodal" , function(){
						const myModal = new bootstrap.Modal('#myModal');
						myModal.show();	
						
						
					})
					
				});
				



	
</script>

</html>
