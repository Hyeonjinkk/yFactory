package com.yfactory.mes.eq.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/*
 *  등록일자 : 2022-05-15
 *  등록자    : 김세명
 *  연결 테이블 명 : EQ
 *  테이블 물리명 : 설비
 */

@Data
public class EqVO {
	//EQ_CD			설비코드	PK
	private String eq_cd;
	//VDR_CODE		업체코드	FK	VENDOR.VDR_CD
	private String vdr_code;
	//EQ_NM			설비명
	private String eq_nm;
	//EQ_MAX		최고온도
	private int eq_max;
	//EQ_MIN		최저온도
	private int eq_min;
	//EQ_CHKCYC		점검주기
	private int eq_chkcyc;
	//EQ_MDNO		모델번호
	private String eq_mdno;
	
	//EQ_PURDT		구매일자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eq_purdt;
	//EQ_ACTST		사용여부	FK	COMM_CODE.COMM_CD
	private String eq_actst;
	//EQ_UPH		시간당생산량
	private int eq_uph;
	//EQ_INSTER		등록인	FK	EMPLOYEE.EMP_NO
	private int eq_inster;
	//UUID			설비이미지	FK	IMG_ATTATCH.UUID
	private String uuid;
	//EQ_MDNM		모델명
	private String eq_mdnm;
	
	//설비 등록시 들고갈 경로
	private String img_path;
	//설비 등록시 들고갈 파일명
	private String img_nm;
	
	
	
	
	
	
}
