package com.yfactory.mes.eq.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yfactory.mes.common.vo.ImageAttachVO;
import com.yfactory.mes.eq.vo.EqVO;

public interface EquipMapper {

	// 설비 메인 페이지
	List<Map> findAll(); // 설비 조회(설비관리 페이지)

	int insertEq(EqVO vo); // 설비 등록

	EqVO findSelect(EqVO vo); // 설비 단건조회(설비등록 페이지)

	int eqUpd(); // 설비 가동상태 수정 및 데이터 수정(설비관리 페이지)

	List<Map> searchEq(); // 설비 코드 + 설비 명 조회 메서드

	List<Map> searchEqMngList(); // 서비스 관리 페이지 이동시 기본으로 나타나는 리스트 테이블 쿼리 메서드

	List<Map> searchPrcList(); // 설비 관리 페이지 - 공정명 공정코드 전체 리스트 조회

	List<Map> selectEq(String eqCd); // 설비 코드를 조회하여 데이터를 모달에서 현재페이지로 전송

	List<Map> searchEmp(); // 설비 등록시 사원번호 + 사원명 조회
	
	List<Map> getVdrList(); // 설비 등록시 업체코드 업체구분코드 업체명 조회
	
	List<Map> getEqActStatList(); // 설비 사용여부 및 비가동 상태를 포함판 조회
	
	List<Map> getEqInActList(String key); // 설비 사용여부 및 비가동 상태를 포함판 검색
	
	List<Map> getEqInList(); // 비가동 설비 내역 조회
	
	// 비가동 설비 내역 검색
	List<Map> searchEqIna(Map<String, String> result);

	// 비가동 설비 내역 추가
	int setEqIn(Map<String, String> result);		

	List<Map> getEqChkList(); // 설비 점검 전체 리스트

	List<Map> selectEqPrc(String prcCd); // 공정코드 + 공정명 조회

	List<Map> getEqChkSelectList( HashMap<String, Object> list); // 설비구분명 + 점검시작일 + 차기점검일 기준 조회

	
	List<Map> getEqDailyChkCount(@Param("chkdt1")String chkdt1 ,@Param("chkdt2")String chkdt2); // 일일 점검 건수 리스트
	
  
	//<Map> eqChkResultAjax(@RequestBody List<HashMap<String, Object>>list); 	// 점검관리 페이지 - 등록 버튼 클릭시 그리드에 남아있는 데이터들을 DB로
	int eqChkResultAjax( List<HashMap<String, Object>>list); 	// 점검관리 페이지 - 등록 버튼 클릭시 그리드에 남아있는 데이터들을 DB로
	
	List<Map> dailyChkListAjax( List<HashMap<String, Object>> list); // 일점검건수 - 날짜를 기즌올 해달날짜 점검 데이터 조회 > 날짜가 여러개
	
	int eqChkDelAjax( List<HashMap<String, Object>>list); // 점검관리 메인 페이지 항목 데이터 삭제 기능
	
	int eqMngUpdateAjax( HashMap<String, Object>list); // 설비관리 페이지 설비수정 버튼 기능부
	
	List<Map>getEqTemp(String lineCd); // 설비 가용온도 리스트 조회
	
	List<Map>eqModalSelect(); //비가동 설비 내역 - 설비 modal 조회
	
	List<Map> getEqDetailDataAjax(String eqDtlCd); // 설비 관리페이지 - 설비 상세 모달
	
	String getEqImgAjax(String eqDtlCd); // 이미지 따로
	
	List<Map>getEqUph(String lineCd); // 설비 uph 리스트 조회
	
	List<Map>eqDivChkAjax(); // 설비 구분명 리스트 조회
	// -----------------------------------------------------------
	
	List<Map> eqInaAll(); // 설비 비가동 리스트(설비비가동 페치지)

	int eqInaIns(); // 설비 비가동 등록(설비 비가동 페이지)

	List<Map> eqChkAll();// 설비 점검 전체 조회(점검관리 페이지)

	int eqChkIns(); // 설비 점검 등록(점검관리 페이지)

	int eqChkDel(); // 설비 점검 삭제(점검관리 페이지)

	int eqChkMng();// 설비 점검 일별 건수 조회(점검관리 페이지)
	
	int updateIna(Map<String, String> result); // 비가동 설비 재가동

	
	 
	



}
