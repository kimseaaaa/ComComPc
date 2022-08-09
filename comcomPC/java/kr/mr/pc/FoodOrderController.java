package kr.mr.pc;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.mr.model.ClientDTO;
import kr.mr.model.FoodOrderDTO;
import kr.mr.service.FoodOrderService;

@Controller
public class FoodOrderController {
	
	@Autowired
	private FoodOrderService foservice;
	
	@RequestMapping(value = "/ajaxcartadd.do", method = RequestMethod.POST, produces = "application/json; charset=utf8" )
	@ResponseBody
	public Map<Integer, FoodOrderDTO> ajaxcartadd(String orderfoodcode, HttpSession session) {
		
		ClientDTO cldto = (ClientDTO)session.getAttribute("cllogdto");
		int fcode = Integer.parseInt(orderfoodcode);
		foservice.cartadd(fcode, cldto);
		System.out.println(foservice.getfocart());
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
	
	@RequestMapping("/clientFoodPay.do")
	public String clientFoodPay(RedirectAttributes redirect) {
		String viewpage=null;
		String msg=null;
		if(foservice.getfocart()==null || foservice.getfocart().size()==0) {
			viewpage="redirect:/clientFoodMain.do";
			msg="장바구니에 제품이 없습니다.";
			redirect.addAttribute("msg", msg);
		}else {
			viewpage = "client/food/clientFoodPay";
		}
		return viewpage;
	}
	
	@RequestMapping("/clientFoodPayOk.do")
	public String clientFoodPayOk (HttpSession session) {
		
		ClientDTO cldto = (ClientDTO)session.getAttribute("cllogdto");
		
		//db저장
		foservice.cartInsert(cldto);
		
		////카트 초기화
		foservice.newcart();
		
		return "redirect:/clientFoodMain.do";
	}
	
	//////////////어드민//////////////////////
	
	//미처리 주문수 표시
	@RequestMapping(value = "/ajaxFoodOrderCnt.do")
	@ResponseBody
	public String ajaxFoodOrderCnt() {
		int fcode =foservice.folist().size();
		String cnt =String.valueOf(fcode);
		return cnt;
	} 
	
	//주문 전달완료처리
	@RequestMapping("/adminOrderOk.do")
	public String adminOrderOk(String fodcode,String l) {
		System.out.println("fodcode : "+fodcode);
		int okfodcode = Integer.parseInt(fodcode);
		foservice.orderOk(okfodcode);
		String viewpage = null;
		if(l==null) {
			viewpage="redirect:/adminDashboard.do";
			
		}else {
			viewpage= "redirect:/adminFoodOrder.do";
		}
		return viewpage;
	}
	
	@RequestMapping("/adminFoodOrder.do")
	public String adminFoodOrderlist(Model model) {
		
		///미처리 주문
		List<FoodOrderDTO> folist = foservice.folist();
		model.addAttribute("folist",folist);
		
		/////처리완료된 주문
		List<FoodOrderDTO> endfolist =  foservice.endfolist();
		model.addAttribute("endfolist",endfolist);
		
		return "admin/food/adminFoodOrde";
	}
	
	//주문 좌석번호 혹은 아이디 검색
	@RequestMapping("/adminOrderSearch.do")
	public String adminOrderSearch(String ordersearch, Model model) {
		List<FoodOrderDTO> searchlist =new ArrayList<FoodOrderDTO>();
		try {
			//좌석번호로 검색
			int seatnum = Integer.parseInt(ordersearch);
			searchlist = foservice.seatnumSFOList(seatnum);
			
		} catch (NumberFormatException e) {
			//아이디로 검색
			searchlist = foservice.idSFOList(ordersearch);
		}
		
		model.addAttribute("endfolist",searchlist);
		
		return "admin/food/adminFoodOrde";
	}
	
	
	

}
