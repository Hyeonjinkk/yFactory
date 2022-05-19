package com.yfactory.mes.mtrl.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MtrlService {
	
	//미지시 생산계획조회
	List<Map>selectPl();
	
	
	//LOT재고조회
	List<Map>listMtrlLot();
	
	//자재명 조회
	List<Map>mtcdList();
	
	//자재명 검색
	List<Map>mtnmSelectSearch(String mtnm);
	
	//업체명 조회
	List<Map>vendorList();
	
	//업체명 검색
	List<Map>vdrnmSelectSearch(String vdrnm);
	
	//LOT재고 검색
	List<Map>lotSelectSearch(String m1,
							 String m2,
							 String req1,
							 String req2);
}
