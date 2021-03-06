<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>

   .mouseOver {
      cursor:pointer;
      
   } 
   .blue {
   	background: #F7F8E0 ;
   }
</style>


<div class="procLineTitle">
	<h1>제품 공정 흐름도</h1>
</div>
<div class="min1">
	<div class="LineA">
		<div class="procLineInfo" style="margin-top: 2em; margin-bottom: 2em;">
			<h3>제품 라인정보</h3>
			<hr>
			<div id="procLine"></div>
		</div>
	</div>
	<div class="LineB">
		<div class="procLineEditor" >
			<h3>제품 라인정보 관리</h3>
			<hr style="margin-top: auto;">
			<button type="button" id="btnUpdate"class="btn1" style="float: right; margin-bottom: 1em;">변경사항 저장</button>
			<button type="button" id="btnDelete"class="btn1" style="float: right;">공정삭제</button>
			<button type="button" id="btnInsert" class="btn1" style="float: right;">공정추가</button>
		</div>
			<div id="procLineEditor" ></div>
			<hr>
	</div>
		<div id="test"></div>
</div>
<script>
		var lineCd //라인 코드
		var prodCd //제품 코드
/* ====================================== 제품 라인정보 그리드 ====================================== */
procLine = new tui.Grid({
		el : document.getElementById('procLine'),
		scrollX : false,
		bodyHeight : 250,
		columns : [ {
			header : '제품코드',
			name : '제품코드',
			className : 'fontClass',
    		align: 'center',
		}, {
			header : '제품명',
			name : '제품명',
			className : 'fontClass',
			

		}, {
			header : '라인코드',
			name : '라인코드',
			className : 'fontClass',
    		align: 'center',
		}	],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			type: 'scroll',
			perPage : 5
		}

	});

		
/* ====================================== 제품 라인정보 ====================================== */

/* ====================================== 라인정보 수정 그리드 ====================================== */
procLineEdit = new tui.Grid({
		el : document.getElementById('procLineEditor'),
		scrollX : false,
		bodyHeight : 300,
		columns : [ {
			header : '공정코드',
			name : '공정코드',
			className : 'fontClass',
    		align: 'center',
			validation: { required: true }
		}, {
			header : '공정명',
			name : '공정명',
			className : 'fontClass',
    		align: 'center',
		}, {
			header : '설비코드',
			name : '설비코드',
			className : 'fontClass',
    		align: 'center',
		},{
			header : '설비명',
			name : '설비명',
    		align: 'center',
			//className : 'blue fontClass',
		}	],
		rowHeaders : [
	          		{
			        type: 'checkbox',
			          },
		        	{
		            type: 'rowNum',
		          }
		          ],
		pageOptions : {
			type: 'scroll',
			perPage : 5
		}

	});
/* ===================================== 행 추가 ========================================*/
btnInsert.addEventListener("click", function() {
	procLineEdit.appendRow();
});
/* =====================================  행 삭제 ========================================*/
btnDelete.addEventListener("click", function() {
	procLineEdit.removeCheckedRows(false);
});
/* ===================================== 변경 정보 수정  ========================================*/
btnUpdate.addEventListener("click", function() {

	Swal.fire({
        title: '변경사항을 저장 하시겠습니까?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '승인',
        cancelButtonText: '취소'
    }).then((result) => {
    	if (result.isConfirmed) {
				 data1 = {
						 lineCd : lineCd
					 };
				 
	               $.ajax({
					   url  : "procLineDelete",
					   data : data1,
					   async : false,
					   method : "POST"
						}).done(function(result){
						console.log(result);
						})
						
				  		let idx = procLineEdit.getRowCount();
	               		console.log(idx);
				 		let eqArr = [];
				 		var data = {};
				 		for (var i = 0; i < idx; i++) {
					  		  data= {
					  				lineCd : lineCd,
					  				lineTurn : i + 1,
					  				procCd : procLineEdit.getRow(i).공정코드,
					  				prodCd : prodCd
			
				   				 };
					  		eqArr.push(data);	
				 			
					}
				 		console.log(eqArr);
				 
	               $.ajax({
					   url  : "procLineInsert",
					   data : JSON.stringify(eqArr), 
					   async : false,
					   method : "POST",
					   contentType : "application/json; charset = UTF-8;"
					 }).done(function(result){
						console.log(result);
								})
								
								Swal.fire(
						                  '승인이 완료되었습니다.',
						                  '변경이 완료되었습니다.',
						                  'success'
						              ).then(function(){
						            	  location.reload(true);	  
						          	  });
							        	}else{
							              	Swal.fire(
							                        '승인이 취소되었습니다.',
							                        '',
							                        'error'
							                    )
							            }
							           })

    }); 
	




/* ===================================== 공정 모달 호출 ========================================*/
procLineEdit.on("click", function(e) {
	
	let prCd = procLineEdit.getFocusedCell('공정코드');
	console.log(prCd);
	console.log(prCd.columnName);
	if (prCd.columnName == '공정코드') {
		if (prCd.value == null) {
			$("#test").load("procCdModal", function() {
				const procCdModal = new bootstrap.Modal('#procCdModal');
				procCdModal.show();

			})
		}
	}

})
 
/* ====================================== Window.onload ====================================== */ 
 
 window.onload = function(){
	$.ajax({	// 라인정보 Ajax
		url : 'procLineAjax',
		dataType : 'JSON',
		method : 'GET'
	}) // end of $.ajax
	.done(function(LineData){
		
		for (var i = 0; i < LineData.length; i++) {
			procLine.appendRow(LineData[i]); // 라인정보 최신화
		} // end of for
		
	}) // end of done
	.fail(function(error){
		console.log(error);
	}); // end of fail
	
/* ====================================== Mouseover Event ====================================== */
	procLine.on('mouseover', function(e){
		   orgin: 'cell';
		   var cn = e.columnName;
		   var tt = e.targetType;
		      if(cn == '라인코드' && tt == 'cell' ){         
		         $('#procLine').attr("class", "mouseOver");
		      }else{
		         $('#procLine').removeClass();               
		      }
		}); 
/* ====================================== End Line ====================================== */
	procLine.on('dblclick',function(e){
		
		 lineCd = procLine.getValue(e.rowKey,'라인코드');
		 prodCd = procLine.getValue(e.rowKey,'제품코드');
		$.ajax({
			url : 'procLineEdit',
			data : {"lineCd" : lineCd},
			method : 'GET',
			dataType : 'JSON'
		}) // end of ajax
		.done(function(procData){

					procLineEdit.resetData(procData);
				
			
		}) // end of done
		.fail(function(err){
			console.log(err);
		}) // end of fail
		
	}) // end of procLine DblClick
	
	
} // end of window.onload
</script>