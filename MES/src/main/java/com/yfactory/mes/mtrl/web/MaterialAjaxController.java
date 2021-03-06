package com.yfactory.mes.mtrl.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yfactory.mes.mtrl.service.MtrlService;

@RestController
public class MaterialAjaxController {

	@Autowired private MtrlService service;
	
		/* 발주관리등록 */
		//미지시 생산품조회
		@GetMapping("/mtrlorder")
		public List<Map> mtrlorder() {		
			return service.selectPl();
		}
		// 생산계획별 자재 재고
		@GetMapping("/mtrlPlan")
		public List<Map> mtrlPlan(String ppCd){
			
			System.out.println("테스트: " +ppCd);
			return service.mtrlPlanList(ppCd);
		}
		// 발주요청서 등록
		@GetMapping("/mtrlOrderList")
		public List<Map> mtrlOrderList(String ppCd, String mtCd){
			return service.mtrlOrderList(ppCd, mtCd);
		}
		/* END 발주관리등록 */
		
		
		/* LOT페이지 */
		//LOT재고조회
		@GetMapping("/mtrlLot")
		public List<Map> mtrlLot() {
			return service.listMtrlLot();
		}
		//LOT 검색
		@GetMapping("/lotSelectSearch")
		public List<Map> lotSelectSearch(String m1, String m2,String req1,String req2){
			return service.lotSelectSearch(m1, m2, req1, req2);
		}
		/* END LOT페이지 */
		
		
		//발주관리 조회
		@GetMapping("/mtrlRequestList")
		public List<Map> mtrlRequestList(){
			return service.listRequest();
		}
		//발주관리 검색조회
		@GetMapping("/mtrlReqSelectSearch")
		public List<Map> mtrlReqSelectSearch(String poCdinput){
			return service.mtrlReqSelectSearch(poCdinput);
		}
		
		//자재명 조회
		@GetMapping("/mtcd")
		public List<Map> mtcd(){
			return service.mtcdList();
		}
		//자재명 검색
		@GetMapping("/mtnmSelectSearch")
		public List<Map> mtnmSelectSearch(String mtnm){
			return service.mtnmSelectSearch(mtnm);
		}
		
		//업체명 조회
		@GetMapping("/vdrcd")
		public List<Map> vdrcd(){
			return service.vendorList();
		}
		@GetMapping("/vdrnmSelectSearch")
		public List<Map> vdrnmSelectSearch(String vdrnm){
			return service.vdrnmSelectSearch(vdrnm);
		}
		
		//발주코드 조회
		@GetMapping("/pocd")
		public List<Map> pocd(String pocd){
			 return service.pocdList();
		}
		@GetMapping("/pocdSelectSearch")
		public List<Map>pocdSelectSearch(String pocd){
			return service.pocdSelectSearch(pocd);
		}
		//발주등록 
		@PostMapping("/mtrlReqInsert")
		public String mtrlReqInsert(@RequestParam Map<String, String> result){
			service.mtrlReqInsert(result);	
			return "성공";
		}
		
		
		//입고 등록조회
		@GetMapping("/mtrlInsertList")
		public List<Map> mtrlInsertList(){
			return service.insertList();
		}
		//입고등록 전체검색
		@GetMapping("/insertSearch")
		public List<Map> insertSearch(String m1, String m2,String req1,String req2){
			return service.insertSearch(m1, m2, req1, req2);
		}		
		//입고예정 목록
		@GetMapping("/expectList")
		public List<Map>expectList(){
			return service.expectList();
		}		
		//입고예정 목록 버튼
		@GetMapping("/selectMtrlReqList")
		public List<Map> selectMtrlReqList(@RequestParam Map<String, String> result){
			return service.selectMtrlReqList(result);	
		}		
		// 입고등록
		@PostMapping("/insertMtrlIn")
		public int insertMtrlIn(@RequestParam Map<String, String> MtrlIn) {
				System.out.println(MtrlIn);
			return service.insertMtrlIn(MtrlIn);
		}
		//입고 전체조회
		@GetMapping("/mtrlInList")
		public List<Map>mtrlInList(){
			return service.mtrlInList();
		}
		//입고 단건조회
		@GetMapping("/mtrlInSearch")
		public List<Map>mtrlInSearch(String m1, String m2,String req1,String req2){
			return service.mtrlInSearch(m1, m2, req1, req2);
		}
		
		
		//안전재고 전체조회
		@GetMapping("/mtrlSafetyList")
		public List<Map> mtrlSafetyList() {
			return service.mtrlSafetyList();
		}
		//안전재고 단건조회
		@GetMapping("/mtrlSafetySearch")
		public List<Map>mtrlSafetySearch(String m1){
			return service.mtrlSafetySearch(m1);
		}
		
		//안전재고 수정
		@RequestMapping("/mtrlUpdateSafe")
		public String mtrlUpdateSafe(@RequestParam Map<String, String> result) {
			service.mtrlUpdateSafe(result);
			return "";
		}
		
		//원자재 재고조회
		@GetMapping("/mtrlStorageList")
		public List<Map> mtrlStorageList() {
			return service.mtrlStorageList();
		}
		
		//원자재 재고검색
		@GetMapping("/mtrlStorageSearch")
		public List<Map> mtrlStorageSearch(String m1, String m2){
			return service.mtrlStorageSearch(m1, m2);
		}

		
}
