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
	
	// 좌석 번호 임으로 넣어줌 추후 삭제 필요
	@Override
	public int seat72(ClientDTO cldto) {
		return mapper.seat72(cldto);
	}
	
}
