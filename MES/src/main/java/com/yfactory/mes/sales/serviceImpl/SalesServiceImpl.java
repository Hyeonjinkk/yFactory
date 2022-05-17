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
	public List<Map> selectBomList() {
		// TODO Auto-generated method stub
		return map.selectBomList();
	}

	@Override
	public List<Map> searchOrderList(String pnm, String vnm, String req1, String req2, String res1, String res2) {
		// TODO Auto-generated method stub
		return map.searchOrderList(pnm, vnm, req1, req2, res1, res2);
	}

}
