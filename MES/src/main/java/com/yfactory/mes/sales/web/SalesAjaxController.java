package com.yfactory.mes.sales.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.sales.service.SalesService;

@RestController
public class SalesAjaxController {

	@Autowired private SalesService salesService;
	
	//주문서 조회
	@GetMapping("/salesOrder")
	public List<Map>  selectOrdersList() {
		
		return salesService.selectOrderList();
	}
	
	//주문서 검색
	@GetMapping("/searchOrderList")
	public List<Map> searchOrderList( String pnm, String vnm,
									  String pcd, String vcd,
			  						  String req1, String req2,
			  						  String res1, String res2, String key) {
		
		return salesService.searchOrderList(pnm, vnm, pcd, vcd, req1, req2, res1, res2, key);
	}

	//BOM조회
	@GetMapping("/bomListAjax")
	public List<Map> BomList(String key){
		return salesService.selectBomList(key);
	}
	
	//BOM수정
	@RequestMapping("/updateBom")
	public String updateBom(@RequestParam Map<String,String> result){
			salesService.updateBom(result);
		return "";
	}
	
	//완제품조회 - 완제품LOT 조회
	@GetMapping("/prodLot")
	public List<Map> prodLot(){
		return salesService.selectProdLotList();
	}
	
	//완제품조회 - 완제품LOT 검색
	@GetMapping("/searchProdLot")
	public List<Map> searchProdLot(String pnm, String pcd, String fdt1, String fdt2){		
		return salesService.searchProdLotList(pnm, pcd, fdt1, fdt2);
	}
		
	//완제품조회 - 완제품modal리스트
	@GetMapping("/prodModalList")
	public List<Map> prodModalList(){
		return salesService.prodModalList();
	}
	
	//완제품조회 - 완제품modal 검색
	@GetMapping("/prodModalSearch")
	public List<Map> prodModalSearch(String key){		
		return salesService.prodModalSearch(key);
	}
	
	//입/출고 조회 - 입고 리스트
	@GetMapping("/prodWrnoteIn")
	public List<Map> prodWrnoteIn(){
		return salesService.prodWrnoteIn();
	}
	
	//입/출고 조회 - 출고 리스트
	@GetMapping("/prodWrnoteOut")
	public List<Map> prodWrnoteOut(){
		return salesService.prodWrnoteOut();
	}
	
	//입/출고 조회 - 입고 검색
	@GetMapping("/searchWrnIn")
	public List<Map> searchWrnIn(String pnm, String pcd, String fdt1, String fdt2){
		return salesService.searchWrnIn(pnm, pcd, fdt1, fdt2);
	}
	
	//입/출고 조회 - 출고 검색
	@GetMapping("/searchWrnOut")
	public List<Map> searchWrnOut(String pnm, String pcd, String fdt1, String fdt2){
		return salesService.searchWrnOut(pnm, pcd, fdt1, fdt2);
	}
	
	//출고 관리 - 주문 상세 리스트
	@GetMapping("/ordDtpList")
	public List<Map> ordDtpList(){
		return salesService.ordDtpList();
	}
	
	//출고 관리 - 완제품 modal 리스트
	@GetMapping("/outProdModal")
	public List<Map> outProdModal(String key){		
		return salesService.outProdModal(key);
	}
	
	
	//출고등록
	@PostMapping("/releaseOrder")
	public String releaseOrder(@RequestParam Map<String, String> result) {
		
		salesService.releaseOrder(result);
		
		return "성공";
	}
	
	//주문서 조회 - 주문 상세 조회 그리드
	@RequestMapping("/ordtlModalList")
	public List<Map> ordtlModalList(@RequestParam("key") String key) {
		
		return salesService.ordtlModalList(key);
	}
	
	//완제품 안전재고 조회
	@RequestMapping("/prodSafetyList")
	public List<Map> prodSafetyList(){
		return salesService.prodSafetyList();
	}
	
	//완제품 안전재고 검색
	@RequestMapping("/searchProdSafety")
	public List<Map> searchProdSafety(@RequestParam Map<String, String> result){
		return salesService.searchProdSafety(result);
	}
	
	//완제품 안전재고 수정
	@RequestMapping("/updateSafe")
	public String updateSafe(@RequestParam Map<String, String> result) {
		salesService.updateSafe(result);
		return "";
	}
}
