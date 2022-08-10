package kr.mr.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mr.mapper.ClientVisitMapper;
import kr.mr.model.ClientVisitDTO;

@Service
public class ClientVisitServiceImpl implements ClientVisitService{
	
	@Autowired
	private ClientVisitMapper mapper;
	
	private int mytime = 0;
	
	
	//로그인시점 저장
	@Override
	public int loginPoint(ClientVisitDTO cvdto) {
		return mapper.loginPoint(cvdto);
	}
	
	//로그아웃이안된 코드 가져오기
	@Override
	public String logoutnullcode(String cvid) {
		return mapper.logoutnullcode(cvid);
	}
	
	//로그아웃시점 저장
	@Override
	public int logoutPoint(String cvcode) {
		return  mapper.logoutPoint(cvcode);
	}
	
	//로그인한 시점 가져오기
	@Override
	public ClientVisitDTO loginTime(String cvcode) {
		return mapper.loginTime(cvcode);
	}

}
