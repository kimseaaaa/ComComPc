package kr.mr.pc;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.mr.model.AdminDTO;
import kr.mr.model.ClientDTO;
import kr.mr.model.GameDTO;
import kr.mr.service.AdminService;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("/adminSeat.do")
	public String adminSeat() {
		return "admin/adminSeat";
	}
	
	@RequestMapping("/adminSetting.do")
	public String adminSetting() {
		return "admin/adminSalesChart";
	}
	
	@RequestMapping("/adminDashboard.do")
	public String adminDashboard() {
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
			viewpage = "admin/adminDashboard";
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
