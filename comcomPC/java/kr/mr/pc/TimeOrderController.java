package kr.mr.pc;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.mr.model.AdminDTO;
import kr.mr.model.ClientDTO;
import kr.mr.model.ClientVisitDTO;
import kr.mr.model.TimeOrderDTO;
import kr.mr.service.ClientService;
import kr.mr.service.ClientVisitService;
import kr.mr.service.TimeOrderService;

@Controller
public class TimeOrderController {
	@Autowired
	private TimeOrderService service;
	
	@Autowired
	private ClientService clservice;
	

	@Autowired
	private ClientVisitService cvservice;
	
	// 결제하기
	@RequestMapping("/clientPayOk.do")
	public String clientLoginOk(String pre,String money, TimeOrderDTO todto, Model model, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		
		todto.setTodid(id);
		System.out.println("[/clientPayOk.do] id : " + id);
		
		todto.setTodpri(Integer.valueOf(money));
		System.out.println("[/clientPayOk.do] money : " + money);
		System.out.println("[/clientPayOk.do] todto : " + todto);
		
		try {
			
			// timeorder 테이블에 데이터 저장
			service.timeinsert(todto);
			
			// client 테이블에 mytime과 totpri 업데이트
			service.timeupdate(todto);

			ClientDTO dto = clservice.getclient(id);
			session.setAttribute("cllogdto", dto);
			session.setAttribute("timefront", dto.getMytime());
			model.addAttribute("timefront",clservice.format00( dto.getMytime()));
			
			service.puyMyTime(dto.getMytime());
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		String viewpage =null;
		
		
		if (pre==null) {
			viewpage = "redirect:clientMain.do";
		}else {
			viewpage = "redirect:clientFront.do";
		}
		String msg = "성공!!!!!!!";

		System.out.println(msg);
		model.addAttribute("msg",msg);
		return viewpage;
	}
	
	
   //회원의 남은 시간 표시 
   @RequestMapping("/ajaxRemainingTime.do")
   @ResponseBody
   public String ajaxRemainingTime(HttpSession session){
	   
	   System.out.println("111111");
	   
	   ClientDTO cldto = (ClientDTO) session.getAttribute("cllogdto");
	   String cvcode = cvservice.logoutnullcode(cldto.getId());
	   ClientVisitDTO cvdto = cvservice.loginTime(cvcode);
	   
	   //로그인 시점
	   Date loginTime = cvdto.getCvlogin(); 
	   
	   //현제시간
	   Date now = new Date();
	   
	   long diff = now.getTime() - loginTime.getTime();
	   int min = (int) (diff / 60000);
	   
	   int time = cldto.getMytime()-min;
	   
	   service.puyMyTime(time);
	   
	   String remainingtime= clservice.format00(time);
	   
	   System.out.println(remainingtime);
	   
	   return remainingtime;
	   
   }
	

	

}
