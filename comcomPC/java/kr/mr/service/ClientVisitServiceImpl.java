package kr.mr.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.mr.mapper.ClientVisitMapper;
import kr.mr.model.ClientVisitDTO;

public class ClientVisitServiceImpl implements ClientVisitService{
	
	@Autowired
	private ClientVisitMapper mapper;
	
	
	//로그인시점 저장
	@Override
	public int loginPoint(ClientVisitDTO cvdto) {
		return mapper.loginPoint(cvdto);
	}
	
	//로그아웃시점 저장
	@Override
	public int logoutPoint(String cvid) {
		return  mapper.logoutPoint(cvid);
	}
	

}
