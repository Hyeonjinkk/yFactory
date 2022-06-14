<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div class="m-4">

	<!-- Modal HTML -->
	<div id="myModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">주문서 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div id="grid"></div>
				</div>
			

			</div>
		</div>
		</div>
			<div id="ProcPlModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">상세 계획 목록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
				<div class="col-md-12" style="padding-bottom: 10px;">
				<div class="input-group">
					<label for="inputText" class="col-form-label"
						style="padding-right: 40px;">기간 조회</label>
					<div class="col-sm-3" style="padding-right: 10px;">
						<input type="date" class="form-control" id="dateA">
					</div>
					<label for="inputText" class="col-form-label"
						style="padding-right: 5px;">~</label>
					<div class="col-sm-3" style="padding-right: 10px;">
						<input type="date" class="form-control" id="dateB">
					</div>
					<button id="dateSearch" class="btn1">검색</button>
				</div>
			
		</div>
					<div id="pGrid"></div>
				</div>
				

		</div>
	</div>
</div> 
</div>
<script>
//날짜
 document.getElementById('dateA').value = new Date().toISOString().substring(0, 10);
document.getElementById('dateB').value = new Date().toISOString().substring(0, 10); 

$(function(){
	 if($("#HNum").val() == 1){
		 const url = "procOrderSelectAll";
		   $.ajax(url,{
			   dataType : "JSON",
			   method: "GET"
		   }).done(function(result){
			   
			   grid.resetData(result);
		   })
		   
			   
		   var grid = new tui.Grid({

		       el: document.getElementById('grid'),
		       scrollX: false,
		       scrollY: false,
		       columns: [
		    	 {
			           header: '주문 코드',
			           name: '주문 코드',
			   			className : 'fontClass',
						align : 'center',
			      },
		         {
		           header: '주문 일자',
		           name: '주문일자',
		   			className : 'fontClass',
					align : 'center',
		         },
		         {
		             header: '납기일자',
		             name: '납기일자',
			   			className : 'fontClass',
						align : 'center',
		           },
		           {
		               header: '업체명',
		               name: '업체명',
			   			className : 'fontClass',
		             },
		             {
			               header: '총 수량',
			               name: '주문수량',
			   			className : 'fontClass',
						align: 'right',
						formatter(myNum) {                
							               return myNum.value.toString()
							               .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							         		}
			          },
		             ],
		   					rowHeaders: ['rowNum'],
		                     pageOptions: {
		                         useClient: true,
		                         perPage: 5
		                    }
		     });
	   
	 }else {
		 //if($("#HNum").val() == 2){
		 
	
		const url = "procPlanAll";
		   $.ajax(url,{
			   dataType : "JSON",
			   method: "GET"
		   }).done(function(result){
			   
			   grid.resetData(result);
		   })
		   
			   
		   var grid = new tui.Grid({

		       el: document.getElementById('pGrid'),
		       scrollX: false,
		       scrollY: false,
		       columns: [
		    	 {
			           header: '생산계획코드',
			           name: '생산계획코드',
			   			className : 'fontClass',
						align : 'center',
			      },
		         {
		           header: '계획명',
		           name: '계획명',
		   			className : 'fontClass',
		         },
		         {
		             header: '계획일자',
		             name: '계획일자',
			   			className : 'fontClass',
						align : 'center',
		           },
		           {
		               header: '계획량',
		               name: '계획량',
						align: 'right',
						formatter(myNum) {                
							               return myNum.value.toString()
							               .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
							         		}
			          
		               
		             },
		             ],
		   					rowHeaders: ['rowNum'],
		                     pageOptions: {
		                         useClient: true,
		                         perPage: 5
		                    }
		     });
	 }  
		 
		 
	 $("#dateSearch").click(function () {
		 $("#pGrid").empty();
		
		 let date1 = $("#dateA").val();
		 let date2 = $("#dateB").val();
		 
		 
		 const url = "prdtPlanSelect";
		   $.ajax(url,{
			   dataType : "JSON",
			   method: "GET",
			   data : {
				   date1 : date1,
				   date2 : date2
			   },
		   }).done(function(result){
			   grid.resetData(result);
			   
		   })
		   
		   var grid = new tui.Grid({

		       el: document.getElementById('pGrid'),
		       scrollX: false,
		       scrollY: false,
		       columns: [
		    	 {
			           header: '생산계획코드',
			           name: '생산계획코드',
			      },
		         {
		           header: '계획명',
		           name: '계획명',
		         },
		         {
		             header: '계획일자',
		             name: '계획일자',
		           },
		           {
		               header: '계획량',
		               name: '계획량',
		             },
		             ],
		   					rowHeaders: ['rowNum'],
		                     pageOptions: {
		                         useClient: true,
		                         perPage: 5
		                    }
		     });
	 });
	 
  $("#btnSav").click(function () {
      Swal.fire({
          title: '정말로 그렇게 하시겠습니까?',
          text: "다시 되돌릴 수 없습니다. 신중하세요.",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: '승인',
          cancelButtonText: '취소'
      }).then((result) => {

          if (result.isConfirmed) {
              Swal.fire(
                  '승인이 완료되었습니다.',
                  '화끈하시네요~!',
                  'success'
              )
              $('#myModal').modal('hide')
          }else{
          	Swal.fire(
                      '승인이 취소되었습니다.',
                      '섹시하시네요~!',
                      'error'
                  )
          }
      })
  });

  
	setTimeout(function(){
		grid.refreshLayout();
	},300);
	
	grid.on("dblclick",function(e) {
		//debugger
		let ordCd = grid.getValue(e.rowKey, '주문 코드');
		 if(ordCd != null){
			  $('#myModal').modal('hide');
			 
 			  $.ajax({
					   url  : "orderSelectOk",
					   data : {
						   ordCd : ordCd
						   },
					   dataType : "JSON",
					   contentType : "application/json; charset = UTF-8;"
				   }).done(function(result){

				   
							for (var i = 0; i < result.length; i++) {
								resultGrid.appendRow(result[i]);

							}
								
			
				   })
		} 
		
		
	})
	grid.on("dblclick",function(e) {
		//debugger
		let ppCd = grid.getValue(e.rowKey, '생산계획코드');
		
		 if(ppCd != null){
			  $('#ProcPlModal').modal('hide');
			 
 			  $.ajax({
					   url  : "procPlanSelect",
					   data : {
						   ppCd : ppCd
						   },
					   dataType : "JSON",
					   contentType : "application/json; charset = UTF-8;"
				   }).done(function(result){
					  
							for (var i = 0; i < result.length; i++) {
								resultGrid.appendRow(result[i]);
							}
			
				   })
		} 
		
		
	})
	


})
</script>
