package kr.mr.mapper;

import java.util.List;
import java.util.Map;

import kr.mr.model.ChatDTO;

public interface ChatMapper {
	//전체 메시지 조회
	public List<ChatDTO> msgList();
	
	//안읽은 메시지 개수 조회
	public int noCheckCount();
	
	//안읽은 메시지 개수 조회(회원용)
	public int clientnoCheckCount(String cto);
	
	//회원 메시지 등록하기
	public int chatAdd(ChatDTO cDto);
	
	//메시지 읽음 처리
	public int msgCheckOK(String cfrom);
	
	//메시지 중복 아이디&개수 조회하기
	public List<Map<String, Object>> msgDupl();
	
	//회원별 최신 메시지 조회
	public List<ChatDTO> latestList();
	
	//관리자 메시지 등록하기
	public int adminChatAdd(ChatDTO cDto);
	
	//아이디별 최근 메시지 조회
	public ChatDTO recentMsgList(String sid);

}
