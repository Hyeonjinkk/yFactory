package com.yfactory.mes.sales.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yfactory.mes.sales.mapper.SalesMapper;
import com.yfactory.mes.sales.service.SalesService;

@Service
public class SalesServiceImpl implements SalesService {
	
	@Autowired	SalesMapper map;
	
	@Override
	public List<Map> selectOrderList() {
		// TODO 
		
		return map.selectOrderList();
	}

	@Override
	public List<Map> selectBomList(String key) {
		// TODO Auto-generated method stub
		return map.selectBomList(key);
	}

	@Override
	public List<Map> searchOrderList(String pnm, String vnm,
									 String pcd, String vcd,
									 String req1, String req2,
									 String res1, String res2,
									 String key) {
		
		return map.searchOrderList(pnm, vnm, pcd, vcd, req1, req2, res1, res2, key);
	}

	@Override
	public List<Map> selectProdLotList() {
		return map.selectProdLotList();
	}

	@Override
	public List<Map> searchProdLotList(String pnm, String pcd, String fdt1, String fdt2) {
		
		return map.searchProdLotList(pnm, pcd, fdt1, fdt2);
	}

	@Override
	public List<Map> prodModalList() {
		return map.prodModalList();
	}

	@Override
	public List<Map> prodModalSearch(String key) {
		return map.prodModalSearch(key);
	}

	@Override
	public List<Map> prodWrnoteIn() {
		return map.prodWrnoteIn();
	}

	@Override
	public List<Map> prodWrnoteOut() {
		return map.prodWrnoteOut();
	}

	@Override
	public List<Map> searchWrnIn(String pnm, String pcd, String fdt1, String fdt2) {
		return map.searchWrnIn(pnm, pcd, fdt1, fdt2);
	}

	@Override
	public List<Map> searchWrnOut(String pnm, String pcd, String fdt1, String fdt2) {
		return map.searchWrnOut(pnm, pcd, fdt1, fdt2);
	}

	@Override
	public List<Map> ordDtpList() {
		return map.ordDtpList();
	}

	@Override
	public List<Map> outProdModal(String key) {
		return map.outProdModal(key);
	}

	@Override
	public int releaseOrder(Map<String, String> result) {
		// TODO Auto-generated method stub
		
		return map.releaseOrder(result);
	}

	@Override
	public List<Map> ordtlModalList(String key) {
		
		return map.ordtlModalList(key);
	}

	@Override
	public int updateSafe(Map<String, String> result) {
		return map.updateSafe(result);
	}

	@Override
	public int updateBom(Map<String, String> result) {
		return map.updateBom(result);
	}

	@Override
	public List<Map> prodSafetyList() {
		return map.prodSafetyList();
	}

	@Override
	public List<Map> searchProdSafety(Map<String, String> result) {
		return map.searchProdSafety(result);
	}

}
