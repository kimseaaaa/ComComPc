package kr.mr.pc;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.mr.model.SeatDTO;
import kr.mr.service.SeatService;

@Controller
public class SeatController {
	
	@Autowired
	private SeatService service;
	
	//좌석 전체 리스트
	@RequestMapping("/adminSeat.do")
	public String list(Model model) {
		List<SeatDTO> listseat = service.listseat();
		model.addAttribute("listseat", listseat);
		return "admin/adminSeat";
	}
	
	//고장여부 변경
	@RequestMapping(value="/adminGameFix.do", method=RequestMethod.GET)
	public String update(SeatDTO sdto, HttpServletRequest request,
			Model model) throws IOException{
		service.fixseat(sdto);
		return "redirect:/adminSeat.do";
	}
	@RequestMapping(value="/adminGameFixOk.do", method=RequestMethod.GET)
	public String update2(SeatDTO sdto, HttpServletRequest request,
			Model model) throws IOException{
		service.fixseatOk(sdto);
		return "redirect:/adminSeat.do";
	}
	
	// 사이드바에서 점유좌석 수 
	@RequestMapping("/ajaxSeatCnt.do")
	@ResponseBody
	public String ajaxSeatCnt() {
      String cnt =String.valueOf(service.ajaxSeatCnt());
      return cnt;
	}

}
