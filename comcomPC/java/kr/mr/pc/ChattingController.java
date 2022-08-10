package kr.mr.pc;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.mr.model.ChatDTO;
import kr.mr.model.ClientDTO;
import kr.mr.model.SeatDTO;
import kr.mr.service.ChatService;
import kr.mr.service.ClientService;
import kr.mr.service.SeatService;

@Controller
public class ChattingController {

	@Autowired
	private ChatService service;
	
	@Autowired
	private SeatService seatService;

	@Autowired
	private  ClientService clientService;

	// client 메시지 보내는 폼 이동
	@RequestMapping("/clientChat.do")
	public String clientChat(ChatDTO cDto, HttpSession session, Model model,RedirectAttributes redirect) {
		ClientDTO cldto = (ClientDTO) session.getAttribute("cllogdto");
		String cfrom = cldto.getId(); // 보낸사람
		
		int cnt = service.msgCheckOK("관리자");
		  
		if (cnt > 0) {
			//System.out.println("메시지 읽음처리 성공");
		} else {
			//System.out.println("메시지 읽음처리 실패");
		}
	
		List<ChatDTO> msgList = service.msgList();
		model.addAttribute("id", cfrom);
		model.addAttribute("list", msgList);

		return "client/clientChat";
	}

	// client -> 관리자 메시지 보내기
	@RequestMapping("/clientChatSend.do")
	public String clientChatSend(ChatDTO cDto, HttpSession session, Model model, RedirectAttributes redirect) {
		ClientDTO cldto = (ClientDTO) session.getAttribute("cllogdto");
		//System.out.println("채팅사이트!!!!" + cldto.toString());

		cDto.setCfrom(cldto.getId()); // 보낸사람
		cDto.setSeatnum(cldto.getSeatnum()); // 보낸사람 좌석번호
		

		int cnt = service.chatAdd(cDto);

		if (cnt > 0) {
			//System.out.println("메시지 등록 성공");
		} else {
			//System.out.println("메시지 등록 실패");
		}

		redirect.addAttribute("cfrom", cldto.getId());

		return "redirect:/clientChat.do";
	}
	
	//메시지 읽음 처리
	@RequestMapping("/msgCheckOk.do") 
	public String chatCheckOk(String cfrom){
		int cnt = service.msgCheckOK(cfrom);
  
		if (cnt > 0) {
			//System.out.println("메시지 읽음처리 성공");
		} else {
			//System.out.println("메시지 읽음처리 실패");
		}
  
		return "redirect:/adminDashboard.do";
	}
	
	//관리자 메시지 보내는 폼 이동
	@RequestMapping("/adminChat.do") 
	public String adminChat(String cto,Model model){
		List<ChatDTO> msgList = service.msgList();
		
		System.out.println("회원 ID: "+cto);
		
		model.addAttribute("id", cto);
		model.addAttribute("list", msgList);
		
		int cnt = service.msgCheckOK(cto);
		
		if (cnt > 0) {
			//System.out.println("메시지 읽음처리 성공");
		} else {
			//System.out.println("메시지 읽음처리 실패");
		}
		
		return "admin/msg/adminChat";
	}
	
	// 관리자 -> client 메시지 보내기
	@RequestMapping("/adminChatSend.do")
	public String adminChatSend(ChatDTO cDto,String cto,HttpSession session, Model model, RedirectAttributes redirect) {
		List<SeatDTO> slist = seatService.occupyList();
		
		for(SeatDTO sdto : slist) {
			//System.out.println(sdto.toString());
			if(sdto.getSid().equals(cto)) {
				cDto.setSeatnum(sdto.getSeatnum());
				//System.out.println("받는사람: " + cto);
				//System.out.println("좌석번호: " + sdto.getSeatnum());
				break;
			}
		}
		int cnt = service.adminChatAdd(cDto);

		if (cnt > 0) {
			//System.out.println("관리자 메시지 등록 성공");
		} else {
			//System.out.println("관리자 메시지 등록 실패");
		}

		redirect.addAttribute("cto", cto);

		return "redirect:/adminChat.do";
	}
	
	//관리자 메시지 리스트 보기
	@RequestMapping("/adminMsgMain.do")
	public String adminMsgMain(Model model) {
		
		List<SeatDTO> sids = seatService.occupyList();
		//System.out.println(sids);
		List<ChatDTO> list = new ArrayList<ChatDTO>();
		
		for(SeatDTO sdto : sids) {
			//System.out.println(sdto.getSid());
			ChatDTO cdto = service.recentMsgList(sdto.getSid());
			if(cdto!=null) {
				//System.out.println(cdto);
				list.add(cdto);
			}
		}
		
		//System.out.println(list);

		TestComparator tc = new TestComparator();

		Collections.sort(list, tc); //오름차순
		Collections.reverse(list);//내림차순
		
		model.addAttribute("list", list);
		model.addAttribute("seatList",sids);

		return "admin/msg/adminMsgMain";
	}
	
	//관리자 id검색 메시지 리스트
	@RequestMapping("/adminChatSearch.do")
	public String adminChatSearch(String keyword,Model model) {
		List<ClientDTO> cldtos = clientService.clsearch(keyword);
		
		List<ChatDTO> list = new ArrayList<ChatDTO>();
		
		for(ClientDTO cldto : cldtos) {
			ChatDTO cdto = service.recentMsgList(cldto.getId());
			if(cdto!=null) {
					list.add(cdto);
				}
			}
			
		TestComparator tc = new TestComparator();

		Collections.sort(list, tc); //오름차순
		Collections.reverse(list);//내림차순
		
		model.addAttribute("list", list);
		
		return "admin/msg/adminMsgMain";
	}
	
	//관리자 id별 메시지 리스트 조회
	@RequestMapping("/adminChatIdList.do")
	public String adminChatIdList(Model model) {
		List<String> sids = clientService.clientIdList();
		
		List<ChatDTO> list = new ArrayList<ChatDTO>();
		
		for(String sid : sids) {
			ChatDTO cdto = service.recentMsgList(sid);
			if(cdto!=null) {
				list.add(cdto);
			}
		}
		TestComparator tc = new TestComparator();

		Collections.sort(list, tc); //오름차순
		Collections.reverse(list);//내림차순
		
		model.addAttribute("list", list);
		
		return "admin/msg/adminMsgMain";
	}
	
	//날짜정렬 비교 클래스
	static class TestComparator implements Comparator<ChatDTO>{
		@Override
		public int compare(ChatDTO o1, ChatDTO o2) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			Date day1 = null;
			Date day2 = null;
			
			try {
				day1 = format.parse(format.format(o1.getCdate()));
				day2 = format.parse(format.format(o2.getCdate()));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		
			int result = day1.compareTo(day2);
			
			return result;
		}
	}
	
   //회원 -> 관리자 안읽은 메시지 개수 조회
   @RequestMapping(value = "/ajaxadminCheckCount.do")
   @ResponseBody
   public String ajaxadminCheckCount() {

      int totalCnt = service.noCheckCount();
      //System.out.println(totalCnt);
      String cnt =String.valueOf(totalCnt);
      
      return cnt;
   } 
   
   //관리자 -> 회원 안읽은 메시지 개수 조회
   @RequestMapping(value = "/ajaxclientCheckCount.do")
   @ResponseBody
   public String ajaxclientCheckCount(HttpSession session) {
      ClientDTO cldto = (ClientDTO) session.getAttribute("cllogdto");
            
      int totalCnt = service.clientnoCheckCount(cldto.getId());
      String cnt =String.valueOf(totalCnt);
      
      return cnt;
   }
}
