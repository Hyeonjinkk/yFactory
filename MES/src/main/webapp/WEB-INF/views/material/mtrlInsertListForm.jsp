<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고조회</title>
</head>

<body onkeyup="on_key_up()">

	<div>
		<div class="mainTitle">
			<h1 style="padding-bottom: 15px;">원자재입고관리</h1>
		</div>
	
		<div class="min2">
			<button class="btn2" id="btnMg">등록</button>
			<button class="btn3" id="btnIn">관리</button>
		</div>
		
		<div class="min1">
				<!-- 자재명 -->
				<div class="col-md-5 " style="padding-bottom: 20px;">
					<div class="input-group ">
						<label for="inputText" class="col-form-label" style="padding-right: 27px;">자재명</label> 
						<input type="text" class="form-control" style="width: 50px" id="mtNminput" placeholder="자재명">
						<a class="nav-link nav-icon search-bar-toggle " id="myBtn" onclick="myBtn"> 
							<i class="bi bi-search"style="color: #2c3e50"></i>
						</a> 
						<input type="text" class="form-control" id="mtCdinput" readonly="readonly">
					</div>
				</div>
				<!-- 업체명 -->
				<div class="col-md-5 " style="padding-bottom: 10px;">
					<div class="input-group  " style="padding-bottom: 10px;">
						<label for="inputText" class="col-form-label"style="padding-right: 27px;">업체명</label> 
						<input type="text" class="form-control" style="width: 50px" id="vdrNminput" placeholder="업체명">
						<a class="nav-link nav-icon search-bar-toggle "id="vdr" onclick="vdr"> 
							<i class="bi bi-search" style="color: #2c3e50"></i>
						</a> 
						<input type="text" class="form-control" id="vdrCdinput" readonly="readonly">
					</div>
				</div>

				<!-- 날짜 -->
				<div class="col-md-12">
					<div class="input-group">
						<label for="inputText" class="col-form-label"
							style="padding-right: 10px;">입고날짜</label>
						<div class="col-sm-2">
							<input type="date" id="req1" class="form-control">
						</div>

						<div style="padding: 0px 22px 0px 22px;">
							<p>~</p>
						</div>
						<div class="col-sm-2" style="padding-right: 20px;">
							<input type="date" id="req2" class="form-control">
						</div>

						<div style="padding-right: 10px;">
							<button class="btn1"  type="button" id="search">조회</button>
						</div>

						<div>
							<button class="btn1" type="reset" id="reset">초기화</button>
						</div>
					</div>
				</div>

			
			<hr style="border: solid 1px gray;">

			<!-- 테이블 -->
			<div class="code-html contents" style="padding-bottom: 10px;">
				<div id="mtrlInTable"></div>
				<div id="test"></div>
			</div>
			<!-- 버튼 -->
			<div>
				<button  class="btn1" id="excel">Excel</button>
				<button class="btn1" id="mtrlcancel">구매전표</button>
			</div>
			
			</div>
		</div>
	</div>
	

</body>

<script>

	//입고 관리
	$('#btnIn').on('click', function(){
		location.href = 'mtrlInsertListForm';
	
	})
	
	  
	//입고 등록
	  $('#btnMg').on('click', function(){
		location.href = 'mtrlInsertForm';
	  }) 

	//자재명 모달  
	myBtn.addEventListener("click", function(){
	$("#test").load("mtcdModal", function(){
		const myModal = new bootstrap.Modal('#myModal');
		myModal.show();
	})
	});
	//업체명 모달
	vdr.addEventListener("click", function(){
		$("#test").load("vdrModal", function(){
			const myModal = new bootstrap.Modal('#myModal');
			myModal.show();
		})
		});

	
	function on_key_up(){
		if($("#vdrNminput").val()==""){
			$("#vdrCdinput").val("");
		}
		if($("#mtNminput").val()==""){
			$("#mtCdinput").val("");
		}
	}
	
	

	//입고 전체조회
	$.ajax({
		url : "mtrlInList",
		method : "GET",
		dataType : "JSON",
		success : function(result) {
			mtrlInGrid.resetData(result);
		}
	});

	var mtrlInGrid = new tui.Grid({
		el : document.getElementById('mtrlInTable'),
		columns : [ {
			header : '원자재발주코드',
			name : '원자재발주코드',
			className : 'fontClass',
			sortable: true,
			sortingType: 'asc',
			align : 'center'
		}, {
			header : '원자재코드',
			name : '원자재코드',
			className : 'fontClass',
			align : 'center'
		}, {
			header : '원자재명',
			name : '원자재명',
			className : 'fontClass',
		}, {
			header : '업체명',
			name : '업체명',
			className : 'fontClass',
		}, {
			header : '입고량',
			name : '입고량',
			className : 'fontClass',
			align : 'right',
			formatter(myNum) { 					
			      return myNum.value.toString()
			      .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			}
		},{
			header : '원자재LOT번호',
			name : '원자재LOT번호',
			className : 'fontClass',
			align : 'center'
		},{
			header : '입고일시',
			name : '입고일시',
			className : 'fontClass',
			align : 'center'
		},{
			header : '유통기한',
			name : '유통기한',
			className : 'fontClass',
			align : 'center'
		}
		

		],
		rowHeaders : [ 'rowNum' ],
		pageOptions : {
			useClient : true,
			perPage : 10
		}
	});

  // 자재명 검색
  $("#search").on("click", function() {
   console.log("click!")
   var mtNminput = $("#mtNminput").val();
   var vdrNminput = $("#vdrNminput").val();
   var req1 = $("#req1").val();
   var req2 = $("#req2").val();
   $.ajax({
      url : "mtrlInSearch",
      data : {
    	  m1 : mtNminput,
    	  m2 : vdrNminput,
            req1 : req1,
            req2 : req2
      },
      method : 'get',
      dataType: 'JSON',
      contentType : "application/json; charset=utf-8"
   }).done(function(result){
	   mtrlInGrid.resetData(result);
       console.log(result);
       
   }).fail(function(result){
	   console.log(result);
   });
})

/* 검색 결과 초기화  */
$('#reset').on('click',function(){
	const url = "mtrlLot";
	   $.ajax(url,{
	      dataType : "JSON",
	      method: "GET"
	   }).done(function(result){
		   mtrlInGrid.resetData(result);
	     console.log(result);
	   });
})
//excel호출
$('#excel').on('click',function(){
	const options = {
			  includeHiddenColumns: true,
			  onlySelected: true,
			  fileName: '원자재입고조회',
			};
	mtrlInGrid.export('xlsx', options);
})
 </script>
</html>