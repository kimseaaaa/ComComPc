package kr.mr.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mr.mapper.ChatMapper;
import kr.mr.model.ChatDTO;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired ChatMapper mapper;
	
	//전체 메시지 조회
	@Override
	public List<ChatDTO> msgList() {
		return mapper.msgList();
	}

	//안읽은 메시지 개수 조회
	@Override
	public int noCheckCount() {
		return mapper.noCheckCount();
	}
	
	//안읽은 메시지 개수 조회(회원용)
	@Override
	public int clientnoCheckCount(String cto){
		return mapper.clientnoCheckCount(cto);
	}
	
	//회원 메시지 등록하기
	@Override
	public int chatAdd(ChatDTO cDto) {
		return mapper.chatAdd(cDto);
	}
	
	//메세지 읽음 처리
	@Override
	public int msgCheckOK(String cfrom) {
		return mapper.msgCheckOK(cfrom);
	}
	
	//메시지 중복 아이디&개수 조회하기
	@Override
	public List<Map<String, Object>> msgDupl() {
		return mapper.msgDupl();
	}
	
	//회원별 최신 메시지 조회
	@Override
	public List<ChatDTO> latestList() {
		return mapper.latestList();
	}
	
	//관리자 메시지 등록하기
	@Override
	public int adminChatAdd(ChatDTO cDto) {
		return mapper.adminChatAdd(cDto);
	}
	
	//아이디별 최근 메시지 조회
	@Override
	public ChatDTO recentMsgList(String sid) {
		return mapper.recentMsgList(sid);
	}

}
