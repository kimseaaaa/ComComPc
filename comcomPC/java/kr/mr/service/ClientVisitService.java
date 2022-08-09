package kr.mr.service;

import kr.mr.model.ClientVisitDTO;

public interface ClientVisitService {
		//로그인시점 저장
		public int loginPoint (ClientVisitDTO cvdto);
		
		//로그아웃시점 저장
		public int logoutPoint (String cvid);

}
