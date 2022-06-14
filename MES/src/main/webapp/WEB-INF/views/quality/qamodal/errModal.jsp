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
	<div id="errModal" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #2c3e50; color: white; font-size: small; padding: 10px;">
					<h5 class="modal-title" style="font-size: 17px;">불량명</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					<div class="col-md-8" style="padding-bottom: 20px;">
						<div class="input-group">
							<label for="inputText" class="col-form-label" style="padding-right: 10px;">불량명</label> 
							<input type="text" class="form-control" style="width: 50px" id="errName" placeholder="불량명">
							<a class="nav-link nav-icon search-bar-toggle " id="errNameSearch" onclick="errNameSearch">
								<i class="bi bi-search" style="color: #2c3e50"></i>
							</a>
						</div>
					</div>
					<div id="errCodeModal"></div>
				</div>
				<!-- 내용끝 -->
			</div>
		</div>
	</div>
	<!-- 모달끝 -->

	<script>
	
	// 불량코드 조회
	$.ajax({
			url: "selectErrCode",
			dataType: "JSON",
			method : "GET",
			contentType : "application/json; charset=utf-8",
		}).done(function(result) {
			console.log(result);
			grid.refreshLayout();
			grid.resetData(result);
		});
	
	
	var grid = new tui.Grid({
		el: document.getElementById('errCodeModal'),
		columns: [ {
			header: '불량코드',
			name: '불량코드',
		}, {
			header: '불량명',
			name: '불량명',
		}],
		rowHeaders: [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 5
		}
	});
	 
	$('body').css("overflow", "hidden");
	  
	  var myModal = document.getElementById('errModal')

	  myModal.addEventListener('shown.bs.modal', function () {
		  //ajax 호출
		  //grid.resetData(data)
	      grid.refreshLayout(); // success 시에 리프레쉬 안되면 이 코드를  대신 넣기
	  })
	
	// 불량명 검색
	$("#errNameSearch").on("click",function(){
		var key = $("#errName").val();
		console.log(key);
	
	$.ajax({
		url : "errNmModalSearch",
		data : {
			"errName" : key
		}
	}).done(function(result){
		grid.resetData(result);
		grid.refreshLayout();
		})
	});
	
	grid.on("dblclick",function(e) {
		//errCd와 errNm에 불량코드와 불량명을 담는다.
		let errCd = grid.getValue(e.rowKey, '불량코드');
		let errNm = grid.getValue(e.rowKey, '불량명');
		
		//errCd가 null이 아닌 경우
		if(errCd != null){
			// errModal을 숨긴다.
			$('#errModal').modal('hide');
			// err변수에 부모 그리드(defaultMt)의 포커스 셀을 불량코드에 맞춘다
			let err = defaultMt.getFocusedCell('불량코드');
			// defaultMt그리드에 err의 rowKey에 맞춰 불량코드와 불량명 컬럼에 각각 errCd와 errNm을 담는다.
			defaultMt.setValue(err.rowKey, '불량코드', errCd);
			defaultMt.setValue(err.rowKey, '불량명', errNm);
		}
	})
	</script>
</body>
</html>
