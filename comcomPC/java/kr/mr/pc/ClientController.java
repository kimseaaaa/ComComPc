package kr.mr.pc;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.mr.model.AdminDTO;
import kr.mr.model.ClientDTO;
import kr.mr.model.ClientVisitDTO;
import kr.mr.service.ClientService;
import kr.mr.service.ClientVisitService;

@Controller
public class ClientController {
	@Autowired
	private ClientService service;
	
	@Autowired
	private ClientVisitService cvservice;

	
	// 회원전체리스트
	@RequestMapping("/adminClientList.do")
	public String clientAll(Model model) {
		
		List<ClientDTO> clientlist = service.clgetList();
		
		model.addAttribute("clientlist", clientlist);
		
		return "admin/member/adminClientList";
	}

	
	
	@RequestMapping("/clientLogin.do")
	public String clientLogin() {
		return "client/info/clientLogin";
	}
	
	@RequestMapping("/clientLoginOk.do")
	public String clientLoginOk(ClientDTO cldto, Model model, HttpSession session) {
		
		ClientDTO clDto = service.clientLogin(cldto);
		String viewpage = null;
		String msg = null;
		if(clDto==null) {
			viewpage = "client/info/clientLogin";
			msg = "로그인 실패";
		}else {
			viewpage = "client/charge/clientFront";
			msg = "로그인 성공";
			
			//로그인 시점 저장
			ClientVisitDTO cvdto = new ClientVisitDTO(); 
			cvdto.setCvid(clDto.getId());
			cvdto.setSeatnum(clDto.getSeatnum());
			cvservice.loginPoint(cvdto);
			
			///회원 로그인시 좌석번호 72넣어주기(다해)
			//  - 주문 전달을 위해 임의로 넣어줌 (추후 삭제 필요)
			clDto.setSeatnum(30);
			service.seat72(clDto);
			//////////////////////////////
			
			session.setAttribute("cllogdto", clDto);
		}
		model.addAttribute("msg",msg);
		
		return viewpage;
	}
	
	@RequestMapping("/clientMain.do")
	public String clientMain() {
		return "client/clientMain";
	}
	
	@RequestMapping("/clientJoin.do")
	public String clientJoin() {
		return "client/info/clientJoin";
	}
	
	@RequestMapping("/clientJoinOk.do")
	public String clientJoinOk(ClientDTO cldto) {
		// 파라미터를 수집해서
		// dto 셋팅해서 인자로 넘겨줘야한다.
		// 이과정을 스프링에서 다처리해준다.
		// DTO를 통해서 자동으로 파라미터를 모아서 만들어준다.
		
		int cnt = service.clinsert(cldto);
		
		return "redirect:clientLogin.do";
	}

	
	//삭제
	@RequestMapping("/adminClientDel.do")
	public String cldelete(String id) {
		
		service.cldelete(id);
		
		
		return "redirect:/adminClientList.do";
	}
	
	 // adminClientList에서의 수정버튼
   @RequestMapping("/adminClientView.do")
   public String clviewpage(String msg,String id, Model model,RedirectAttributes redirect) {
      
      ClientDTO cldto =  service.getclient(id);
      model.addAttribute("cldto", cldto);
      model.addAttribute("msg", msg);
      
      return "admin/member/adminClientInfo";
   }
	
	//수정
	@RequestMapping(value="/adminClientMod.do", method=RequestMethod.POST)
	public String clupdate(ClientDTO cldto, HttpServletRequest request,
			Model model) throws IOException{
		
		service.clupdate(cldto);
		
		return "redirect:/adminClientList.do";
//		return "admin/member/adminClientInfo";
	}
	
	// , method=RequestMethod.POST
	
	
	//// 마이페이지 (회원)
	@RequestMapping("/clientInfo.do")
	public String clientInfo(HttpSession session, String msg, Model model) {
		
		
		ClientDTO cldto = (ClientDTO) session.getAttribute("cllogdto");
		model.addAttribute("cldto", cldto);
		
		return "client/info/clientInfo";
	}


	
	//마이페이지 수정
	@RequestMapping(value="/clientMod.do", method=RequestMethod.POST)
	public String myupdate(HttpSession session, ClientDTO cldto, HttpServletRequest request,
			Model model) throws IOException{
		
		
		session.setAttribute("cllogdto", cldto);
		return "redirect:/clientMain.do";
		
	}
	
	// 검색
	@RequestMapping("/adminClientSearch.do")
	public String clsearch(Model model,String keyword ) {
      /* System.out.println("검색 단어: "+keyword); */
      
      List<ClientDTO> clientlist = service.clsearch(keyword);
      model.addAttribute("clientlist",clientlist);
      
      return "admin/member/adminClientList";
   }
	
   //비밀번호 초기화
   @RequestMapping(value="/adminPwReset.do")
      public String clreset(ClientDTO cldto, HttpServletRequest request,
            Model model,RedirectAttributes redirect) throws IOException{
      
      String msg = null;
      
      int cnt = service.clreset(cldto);
      
      if(cnt>0) {
         msg = "비밀번호 초기화 성공";
      }else{
         msg = "비밀번호 초기화 실패";
      }

      String id = cldto.getId();
      redirect.addAttribute("id", id);
      redirect.addAttribute("msg", msg);
      
      return "redirect:/adminClientView.do";
   }
   
	@RequestMapping("/clientLogout.do")
	public String clientLogout(HttpSession session) {
		
		//로그아웃시점 저장
		ClientDTO cldto = (ClientDTO)session.getAttribute("cllogdto");
		String cvcode = cvservice.logoutnullcode(cldto.getId());
		
		System.out.println("cvcode : "+cvcode);
		
		cvservice.logoutPoint(cvcode);
		
		session.invalidate();
		return "client/info/clientLogin";
	}
	
   @RequestMapping("/clientidcheck.do")
   public String clientidchek(HttpServletRequest request,HttpServletResponse response,String id, Model model) {
      ClientDTO cldto =  service.getclient(id);
      
      int n;
      
      System.out.println("입력된 아이디: "+id);
      
      if(cldto==null) {
         System.out.println("사용가능한 아이디!!");
         n = 1;
      }else {
         System.out.println("사용불가능한 아이디!!");
         n = 0;
      }
      
      try {
         response.getWriter().print(n);
      } catch (IOException e) {
         e.printStackTrace();
      }
      return null;
   }
	   
	

}




