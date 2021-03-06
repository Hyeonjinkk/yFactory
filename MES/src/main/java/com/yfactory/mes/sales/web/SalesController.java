package com.yfactory.mes.sales.web;


import java.io.InputStream;
import java.sql.Connection;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;



@Controller
public class SalesController {

	@Autowired DataSource datasource;
	
	@RequestMapping("/orderList")
	public String  OrderList() {
		return "sales/orderList";
	}
	
	@RequestMapping("/bomList")
	public String BomList() {
		return "sales/bomList";
	}
	
	@RequestMapping("/bomList2")
	public String BomList2() {
		return "sales/bomList2";
	}

	//완제품LOT재고조회폼
	@RequestMapping("/prodLotForm")
	public String prodLotForm() {
		return "sales/prodLotForm";
	}
	
	//완제품modal호출
	@RequestMapping("/prodModal")
	public String prodModal() {
		return "sales/salesModal/prodModal";
	}	
	
	//업체명modal호출
	@RequestMapping("/salesVenderModal")
	public String salesVenderModal() {
		return "sales/salesModal/vdrModal";
	}
	
	//입/출고 관리
	@RequestMapping("/prodWrnote")
	public String prodWrnote() {
		return "sales/prodWrnote";
	}
	
	//출고관리
	@RequestMapping("/prodRelease")
	public String prodRelease() {
		return "sales/prodRelease";
	}
	
	//출고관리 modal호출
	@RequestMapping("/releaseModal")
	public String releaseModal() {
		return "sales/salesModal/releaseModal";
	}
	
	//완제품 안전재고
	@RequestMapping("/prodSafety")
	public String prodSafety() {
		return "sales/prodSafety";
	}
	
	//주문서 조회 - 주문서 상세 조회
	@RequestMapping("/ordtlModal")
	public String ordtlModal() {
		return "sales/salesModal/ordtlModal";
	}
	
	/*
	 * jasper
	 */
	//발주서 PDF
	@RequestMapping("orderJasper")
	public void report(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = datasource.getConnection();
		
		InputStream jasperStream = getClass().getResourceAsStream("/jasper/salesOrder.jasper");
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream); 
		//파라미터 맵
		HashMap<String,Object> map = new HashMap<>(); 
		map.put("key", request.getParameter("pdfOcd"));
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, map, conn);
		JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
	}

}
