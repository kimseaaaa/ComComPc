package kr.mr.service;

import java.util.List;

import kr.mr.model.ClientDTO;
import kr.mr.model.GameDTO;

public interface ClientService {
	//전체 리스트 
	public List<ClientDTO> clgetList();
	//등록
	public int clinsert(ClientDTO cldto);
	//삭제
	public int cldelete(String id);
	
	//수정
	public int clupdate(ClientDTO cldto);
	
	//해당 아이디의 고객 가져오기
	public ClientDTO getclient(String id);
	
	//마이페이지 수정
	public int myupdate(ClientDTO cldto);
	
	//검색
	public List<ClientDTO> clsearch(String keyword);
	
	//비밀번호 초기화
	public int clreset(ClientDTO cldto);
	
	//로그인
	public ClientDTO clientLogin(ClientDTO cldto);
	
	
	//시간으로 봐꿔주기~
	public String format00(int rtime);

	//로그아웃시 남은 시간 저장
	public int mytimeUpdate(ClientDTO cldto);
	
   // 좌석 번호 임으로 넣어줌 추후 삭제 필요
   public int seat72(ClientDTO cldto);
	
}
