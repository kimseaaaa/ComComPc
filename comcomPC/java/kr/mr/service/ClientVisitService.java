package kr.mr.service;

import kr.mr.model.ClientVisitDTO;

public interface ClientVisitService {
	//로그인시점 저장
	public int loginPoint (ClientVisitDTO cvdto);
	
	//로그아웃이안된 코드 가져오기
	public String logoutnullcode (String cvid);
	
	//로그아웃시점 저장
	public int logoutPoint (String cvcode);
	
	//로그인한 시점 가져오기
	public ClientVisitDTO loginTime (String cvcode);

}
