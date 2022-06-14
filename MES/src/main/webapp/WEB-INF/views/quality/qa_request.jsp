<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mainTitle" style="padding-bottom: 15px;">
		<h1>품질검사요청</h1>
	</div>

	<div style="background-color: #e9ecef; padding: 8px;">
		<div class="mainTitle" style="padding: 15px;">
			<form>
				<!-- 발주상세코드 -->
				<div class="col-md-6" style="padding-bottom: 10px;">
					<div class="input-group" style="padding-bottom: 10px;">
						<div class="col-md-3">
							<label for="inputText" class="col-form-label" style="padding-right: 27px;">발주 코드</label>
						</div>
						<input type="text" class="form-control" style="width: 50px" placeholder="발주코드를 입력해주십시오" id="pdt" readonly>
						<a class="nav-link nav-icon search-bar-toggle" id="pdcBtn" onclick="pdcBtn">
							<i class="bi bi-search" style="color: #2c3e50"></i>
						</a>
					</div>
				</div>
				
				<!-- 자재코드 -->
				<div class="col-md-6" style="padding-bottom: 10px;">
					<div class="input-group" style="padding-bottom: 10px;">
						<div class="col-md-3">
							<label for="inputText" class="col-form-label" style="padding-right: 27px;">발주 신청인</label>
						</div> 
						<input type="text" class="form-control" style="width: 50px" placeholder="신청인을 입력해주십시오" id="mcd" readonly="readonly">
					</div>
				</div>
				
				<!-- 자재명 -->
				<div class="col-md-6" style="padding-bottom: 10px;">
					<div class="input-group" style="padding-bottom: 10px;">
						<div class="col-md-3">
							<label for="inputText" class="col-form-label" style="padding-right: 27px;">발주 신청일</label>
						</div> 
						<input type="text" class="form-control" style="width: 50px" placeholder="YYYY-MM-DD" id="mnm" disabled>
					</div>
				</div>
				
				
				<div class="col-md-5" style="padding-bottom: 10px;">
					<div class="input-group">
						<div style="padding-right: 10px;">
							<button type="button" id="insert" class="btn1" onclick="insert">신청</button>							
						</div>
						<div>
							<button type="reset" id="reset" class="btn1">초기화</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<div id="poDtlModal"></div>
	
	<script type="text/javascript">
	// 발주상세코드 modal
	pdcBtn.addEventListener("click", function() {
		$("#poDtlModal").load("poDtlCdModal", function() {
			const pocdModal = new bootstrap.Modal('#poDtlCdModal');
			pocdModal.show();
		})
	});
	
	// 품질검사요청 버튼 클릭
	insert.addEventListener("click", function() {
		var pdt = $("#pdt").val();
		var mcd = $("#mcd").val();
		var mnm = $("#mnm").val();
		$.ajax({
			url: "reqMtQuality",
			data: {
				pdt: pdt
			}
		}).done(function() {
			Swal.fire({
                icon: 'success',
                title: '품질검사신청완료.',
                text: '품질검사 신청이 완료되었습니다.',
            }).then(function(){
				location.href = 'qa_requestMgr';
            })
		}).fail(function() {
			Swal.fire({
                icon: 'error',
                title: '품질검사신청완료.',
                text: '품질검사 신청이 실패하였습니다.',
            })
		})
	});
	</script>
</body>
</html>