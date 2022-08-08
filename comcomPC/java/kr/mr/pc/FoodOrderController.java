package kr.mr.pc;


import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.mr.model.ClientDTO;
import kr.mr.model.FoodOrderDTO;
import kr.mr.service.FoodOrderService;

@Controller
public class FoodOrderController {
	
	@Autowired
	private FoodOrderService foservice;
	
	@RequestMapping(value = "/ajaxcartadd.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<Integer, FoodOrderDTO> ajaxcartadd(String orderfoodcode, HttpSession session) {
		
		ClientDTO cldto = (ClientDTO)session.getAttribute("cllogdto");
		int fcode = Integer.parseInt(orderfoodcode);
		foservice.cartadd(fcode, cldto);
		return foservice.getfocart();
	
	}
	
	@RequestMapping(value = "/ajaxCartMinus.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<Integer, FoodOrderDTO> ajaxCartMinus(String orderfoodcode, HttpSession session) {
		ClientDTO cldto = (ClientDTO)session.getAttribute("cllogdto");
		int fcode = Integer.parseInt(orderfoodcode);
		foservice.cartminus(fcode, cldto);
	
		return foservice.getfocart();
	} 
	
	@RequestMapping(value = "/ajaxCartDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<Integer, FoodOrderDTO> ajaxCartDelete(String orderfoodcode) {
		int fcode = Integer.parseInt(orderfoodcode);
		foservice.cartdelete(fcode);
	
		return foservice.getfocart();
	}

}
