package kr.mr.pc;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.mr.model.FoodDTO;
import kr.mr.model.FoodOrderDTO;
import kr.mr.service.FoodOrderService;
import kr.mr.service.FoodService;

@Controller
public class FoodController {
	
	@Autowired
	private FoodService service;
	
	@Autowired
	private FoodOrderService foservice;
	
	//메뉴 전체 리스트 조회
	@RequestMapping("/adminFoodList.do")
	public String FoodList(Model model,RedirectAttributes redirect,String msg) {
		List<FoodDTO> list = service.FoodList();
		model.addAttribute("list",list);
		model.addAttribute("msg", msg);
		
		return "admin/food/adminFoodList";
	}
	
	//메뉴 추가 폼 이동
	@RequestMapping("/adminFoodAdd.do")
	public String FoodAdd(){
		return "admin/food/adminFoodAdd";
	}
	
	//메뉴 추가
	@RequestMapping("/adminFoodAddOk.do")
	public String FoodAddOk(FoodDTO fDto, MultipartHttpServletRequest multipartRequest,
			HttpServletRequest request, Model model,RedirectAttributes redirect) throws IOException {
		
		String msg = null;
		
		String UPLOAD_DIR = "FoodImg";
		String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;

		MultipartFile fimg = multipartRequest.getFile("file");//파일 정보를 얻어온다
		/* System.out.println("파일 이미지:"+fimg); */
		
		//실제 업로드된 파일명
		String originalName= fimg.getOriginalFilename();
		fDto.setFimg(originalName);
		/* System.out.println("업로드된 파일명: "+originalName ); */
		
		File file = new File(uploadPath +"\\" + fimg); 
			
		if(fimg.getSize() !=0 ) { //업로드를 한 경우
			if(!file.exists()) { //해당파일의 경로가 있는지 확인하기, 처음 한번만 실행
				if(file.getParentFile().mkdirs()) { 
					file.createNewFile(); // 임시로 파일 생성
					/* System.out.println("파일 생성"); */
				}
			}
			File uploadFile = new File(uploadPath+"\\"+originalName);
			
			//중복처리
			if(uploadFile.exists()) {
				originalName = System.currentTimeMillis()+"_"+originalName;
				uploadFile = new File(uploadPath+"\\"+originalName);
			}
			// 실제파일 업로드
			fimg.transferTo(uploadFile);
			/* System.out.println("파일 업로드 완료!"); */
		}
		int cnt = service.FoodAdd(fDto);
		
		/* System.out.println("메뉴 추가 현황:" + cnt); */
		
		if(cnt > 0) {
			msg="메뉴 등록 성공";
		}else {
			msg="메뉴 등록 실패";
		}
		redirect.addAttribute("msg", msg);
	
		return "redirect:/adminFoodList.do";
	}	
	
	//메뉴 삭제
	@RequestMapping("/adminFoodDel.do")
	public String FoodDel(String fimg,int fcode, Model model,HttpServletRequest request,RedirectAttributes redirect) throws IOException{
		
		String msg = null;
		
		String UPLOAD_DIR = "FoodImg";
		String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		String originalName = fimg;
		/* System.out.println("올라간 파일 명: "+originalName); */
		File uploadFile = new File(uploadPath+"\\"+originalName);
		if(uploadFile.exists()) {
			uploadFile.delete();
			/* System.out.println(uploadFile+"삭제완료!!!!!!!"); */
		}else {
			/* System.out.println("파일 이미지 없음!!!!"); */
		}
		
		int cnt = service.FoodDelete(fcode);
		/* System.out.println(fcode); */
		/* System.out.println("메뉴 삭제 현황:" + cnt); */

		if(cnt > 0) {
			msg="메뉴 삭제 성공";
		}else {
			msg="메뉴 삭제 실패";
		}
		redirect.addAttribute("msg", msg);
	
		return "redirect:/adminFoodList.do";
	}
	
	//메뉴 정보 조회 폼 이동
	@RequestMapping("/adminFoodView.do")
	public String FoodView(int fcode,Model model,RedirectAttributes redirect,String msg) {
		
		FoodDTO fDto =service.FoodView(fcode);
		/* System.out.println(fDto.toString()); */
		
		model.addAttribute("fDto",fDto);
		model.addAttribute("msg", msg);
		
		return "admin/food/adminFoodView";
	}
	
	//메뉴 정보 수정
	@RequestMapping("/adminFoodMod.do")
	public String FoodMod( RedirectAttributes redirect,
	    FoodDTO fDto, MultipartHttpServletRequest multipartRequest,
	    HttpServletRequest request, Model model ) throws IOException {
		
	    String msg = null;

	    String UPLOAD_DIR = "FoodImg";
	    String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;

	    MultipartFile fimg = multipartRequest.getFile("file");
		/*System.out.println("변경된 파일 이미지:"+fimg); */

	    //파일 수정 안했을때
	    if(fimg == null || fimg.isEmpty()) { 
	        String oldFile = request.getParameter("oldFile");
			/*System.out.println("원본 파일 이미지:"+oldFile); */
	        fDto.setFimg(oldFile);
	    }else {//파일 변경 했을 때 실행
	        //실제 업로드된 파일명
	        String originalName= fimg.getOriginalFilename();
	        fDto.setFimg(originalName);
	        
	        if(fimg.getSize() !=0 ) {//업로드를 한 경우
	            File uploadFile = new File(uploadPath+"\\"+originalName);

	            //중복처리
	            if(uploadFile.exists()) {
	                originalName = System.currentTimeMillis()+"_"+originalName;
	                uploadFile = new File(uploadPath+"\\"+originalName);
	            }
	            // 실제파일 업로드
	            fimg.transferTo(uploadFile);
				/* System.out.println("파일 업로드 완료!"); */
	        }
	    }

	    int cnt = service.FoodUpdate(fDto);
	    int fcode = fDto.getFcode();

		/* System.out.println("메뉴 수정 현황:" + cnt); */

	    if(cnt > 0) {
	        msg="메뉴 수정 성공";
	    }else {
	        msg="메뉴 수정 실패";
	    }
	    
	    redirect.addAttribute("fcode",fcode);
	    redirect.addAttribute("msg", msg);

	    return "redirect:/adminFoodView.do";
	}
	
	//메뉴 검색 리스트
	@RequestMapping("/adminFoodSearch.do")
	public String FoodSearch(Model model,String keyword ) {
		/* System.out.println("검색 단어: "+keyword); */
		
		List<FoodDTO> list = service.FoodSearchList(keyword);
		model.addAttribute("list",list);
		
		return "admin/food/adminFoodList";
	}
	
	//Best 메뉴 리스트
	@RequestMapping("/amdinFoodBest.do")
	public String FoodSearch(Model model) {
		
		List<FoodDTO> list = service.FoodBestList();
		model.addAttribute("list",list);
		
		return "admin/food/adminFoodList";
	}
	
	//메뉴 메인 페이지 리스트
		@RequestMapping("/clientFoodMain.do")
		public String adminSeat(Model model) {
			List<FoodDTO> list = service.FoodList();
			model.addAttribute("MenuList",list);
			Map<Integer,FoodOrderDTO> focart=foservice.getfocart();
			if(focart!=null) {
				model.addAttribute("focart",focart);
			}
			return "client/clientFoodMain";
		}

}
