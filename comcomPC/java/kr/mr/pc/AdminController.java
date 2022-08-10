package kr.mr.pc;


import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.mr.model.AdminDTO;
import kr.mr.model.ChatDTO;
import kr.mr.service.AdminService;
import kr.mr.service.ChatService;
import kr.mr.service.CrawlService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private CrawlService crawlservice;
	
	@Autowired 
	private ChatService chatservice;

	@RequestMapping("/adminSetting.do")
	public String adminSetting() {
		return "admin/adminSalesChart";
	}
	
	@RequestMapping("/adminDashboard.do")
	public String adminDashboard(Model model) {
		///////////크롤링/////////
		List<List> gamelist = crawlservice.crawlList();
		
		System.out.println("gamelist : "+gamelist);
		
		model.addAttribute("gamenew", gamelist.get(0));
		model.addAttribute("gamerank", gamelist.get(1));
		////////////////////////
		
		// ----- 메세지 목록 ----- //
		HashMap<String, Integer> msgMap = new HashMap<String, Integer>();
		
		List<Map<String, Object>> result = chatservice.msgDupl();System.out.println(result);
		
		for(Map<String, Object> map : result){
			int cnt = 0;
			String id = null;
			
			Iterator<String> keys = map.keySet().iterator();
			while(keys.hasNext()) {
				String key = keys.next();
				if(key.equals("COUNT(cfrom)")){
					cnt= Integer.parseInt(map.get(key).toString());
				}
				else if(key.equals("cfrom")) {
					id = (String)map.get(key);
				}
			}
			/* System.out.println("ID: "+id+", 값: "+cnt); */
			msgMap.put(id, cnt);
		}
		
		model.addAttribute("msgmap", msgMap);
		/* System.out.println(msgMap); */
		
		//최신메시지 조회
		List<ChatDTO> latestList = chatservice.latestList();
		model.addAttribute("latestMsg", latestList);

		return "admin/adminDashboard";
	}
	
	@RequestMapping("/adminLogin.do")
	public String adminLogin() {
		return "admin/adminLogin";
	}
	
	@RequestMapping("/adminLoginOk.do")
	public String adminLoginOk(AdminDTO adto, Model model, HttpSession session) {
		AdminDTO adDto = service.adminlogin(adto);
		String viewpage = null;
		String msg = null;
		if(adDto==null) {
			viewpage = "admin/adminLogin";
			msg = "로그인 실패";
		}else {
			viewpage = "redirect:/adminDashboard.do";
			msg = "로그인 성공";
			session.setAttribute("adlogdto", adDto);
		}
		System.out.println(msg);
		model.addAttribute("msg",msg);
		return viewpage;
	}
	
	@RequestMapping("/adminLogout.do")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "admin/adminLogin";
	}
	

}
