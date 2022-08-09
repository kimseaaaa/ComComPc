package kr.mr.mapper;

import kr.mr.model.ClientVisitDTO;

public interface ClientVisitMapper {
	//로그인시점 저장
	public int loginPoint (ClientVisitDTO cvdto);
	
	//로그아웃시점 저장
	public int logoutPoint (String cvid);

}
