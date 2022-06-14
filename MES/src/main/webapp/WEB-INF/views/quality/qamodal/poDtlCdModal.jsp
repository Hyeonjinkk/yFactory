<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 발주상세코드 Modal  -->
	<div id="poDtlCdModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">발주상세코드</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					<div class="col-md-8 " style="padding-bottom: 20px;">
						<div class="input-group ">
							<label for="inputText" class="col-form-label" style="padding-right: 10px;">발주코드</label> 
							<input type="text" class="form-control" style="width: 50px" id="mtName" placeholder="발주코드">
							<a class="nav-link nav-icon search-bar-toggle " id="mtNameSearch" onclick="mtNameSearch">
								<i class="bi bi-search" style="color: #2c3e50"></i>
							</a>
						</div>
					</div>
					<div id="poDtlCd"></div>
				</div>
				<!-- 내용끝 -->
			</div>
		</div>
	</div>
	<!-- 모달끝 -->

	<script>
	
	// 발주상세코드 조회
	 $.ajax({
			url: "selectpoDtlRequest",
			dataType: "JSON",
			method : "GET",
			contentType : "application/json; charset=utf-8",
		}).done(function(result) {
			console.log(result);
			grid.refreshLayout();
			grid.resetData(result);
		});
	
	
	var grid = new tui.Grid({
		el: document.getElementById('poDtlCd'),
		columns: [ {
			header: '발주코드',
			name: '발주코드',
		}, {
			header: '발주신청일',
			name: '발주신청일',
		}, {
			header: '발주신청인',
			name: '발주신청인',
		}],
		rowHeaders: [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 5
		}
	});
	
	
	 
	$('body').css("overflow", "hidden");
	  
	  var myModal = document.getElementById('poDtlCdModal')

	  myModal.addEventListener('shown.bs.modal', function () {
		  //ajax 호출
		  //grid.resetData(data)
	      grid.refreshLayout(); // success 시에 리프레쉬 안되면 이 코드를  대신 넣기
	  })
	
	// 자재명 검색
	$("#mtNameSearch").on("click",function(){
		var key = $("#mtName").val();
		console.log(key);
	
	$.ajax({
		url : "pocdModalSearch",
		type: "GET",
		data : JSON.stringify({
			key : key
		}),
		dataType: 'JSON',
		contentType : "application/json; charset=utf-8"
	}).done(function(result){
		grid.resetData(result);
		})
	});
	
	//모달 데이터값 받아오기
	grid.on("dblclick",function(e) {
    //debugger
       let poCd = grid.getValue(e.rowKey, '발주코드');
	   let mtDt = grid.getValue(e.rowKey, '발주신청일');
       let mtName = grid.getValue(e.rowKey, '발주신청인');
       
       
       
       $("#pdt").val(poCd);
       $("#mcd").val(mtName);
       $("#mnm").val(mtDt);
       
       $('#poDtlCdModal').modal('hide');
	});
	</script>

</body>
</html>
