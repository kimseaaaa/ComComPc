package kr.mr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mr.mapper.ClientMapper;
import kr.mr.model.ClientDTO;
import kr.mr.model.GameDTO;

@Service
public class ClientServiceImpl implements ClientService{
	
	@Autowired
	private ClientMapper mapper;
	//전체
	@Override
	public List<ClientDTO> clgetList() {
		return mapper.clgetList();
	}
	//등록
	@Override
	public int clinsert(ClientDTO cldto) {
		System.out.println(cldto.toString());
		
		return mapper.clinsert(cldto);
	}
	//삭제
	@Override
	public int cldelete(String id) {
		return mapper.cldelete(id);
	}
	
	//수정
	@Override
	public int clupdate(ClientDTO cldto) {
		return mapper.clupdate(cldto);
	}
	
	@Override
	public ClientDTO getclient(String id) {
		return mapper.getclient(id);
	}
	
	//마이페이지 수정
	@Override
	public int myupdate(ClientDTO cldto) {
		return mapper.myupdate(cldto);
	}
	
	//검색
	@Override
	public List<ClientDTO> clsearch(String keyword) {
		return mapper.clsearch(keyword);
	}
	//비밀번호 초기화
	@Override
	public int clreset(ClientDTO cldto) {
		return mapper.clreset(cldto);
	}
	
	@Override
	public ClientDTO clientLogin(ClientDTO cldto) {
		return mapper.clientLogin(cldto);
	}
	
	@Override
	public String format00(int rtime) {
		
		String format00;
		   
		int hh = rtime / 60;
		int mm  = rtime % 60;
		   
		if(hh<10) format00="0"+hh;
		else format00=String.valueOf(hh);
		   
		if(mm<10) format00+=":0"+mm;
		else format00+=":"+mm;
		   
		return format00;
	}
	
	//로그아웃시 남은 시간 저장
	@Override
	public int mytimeUpdate(ClientDTO cldto) {
		return mapper.mytimeUpdate(cldto);
	}

	
}
