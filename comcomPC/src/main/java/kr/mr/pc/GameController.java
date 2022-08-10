package kr.mr.pc;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.mr.model.GameDTO;
import kr.mr.service.GameService;

@Controller
public class GameController {
	
	@Autowired
	private GameService service;
	
	//게임 전체 리스트
	@RequestMapping("/adminGameList.do")
	public String list(Model model) {
		
		List<GameDTO> gamelist = service.getList();
		
		model.addAttribute("gamelist", gamelist);
		
		return "admin/game/adminGameList";
	}
	
	//게임 추가 페이지이동
	@RequestMapping("/adminGameAdd.do")
	public String insertpage(GameDTO gdto) {
		
		return "admin/game/adminGameAdd";
	}
	
	
	//게임 추가
	@RequestMapping(value="/adminGameAddOk.do", method=RequestMethod.POST)
	public String insert(GameDTO gdto , HttpServletRequest request,
			Model model) throws IOException{
		System.out.println("1111111");
		

		/*for(int i=1; i<=20; i++) {
			GameDTO dto = new GameDTO();
			dto.setGimg("test"+i+".png");
			dto.setGname("test");
			dto.setGcat("RPG");
			dto.setGfee("무료");
			dto.setGcomp("test");	
			service.insert(dto);
		}*/
		
		
		String viewpage = null;
		String msg = null;
		
		//////////////이미지추가///////////////////
		String UPLOAD_DIR = "gameimg";
		
		String uploadPath = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		System.out.println("uploadPath : "+uploadPath);	
		
		MultipartFile filegimg= gdto.getFilegimg();
		String filename = gdto.getGimg();
		String originalName = System. currentTimeMillis()+filegimg.getOriginalFilename();
		System.out.println("originalName : "+originalName);
		
		File file = new File(uploadPath + "\\" + filename);
		
		if(!file.exists()) { // 경로가 있는지 확인하기, 처음 한번만 실행 
			if(file.getParentFile().mkdirs()) { // uploadPath에 지정된 폴더생성
				file.createNewFile(); //임시로 파일 생성
			}
		}
		
		// 실제 파일 업로드
		File uploadFile = (new File(uploadPath+"\\"+originalName));
		
		//중복처리
		if(uploadFile.exists()) {
			originalName = System. currentTimeMillis()+"_"+originalName;
			uploadFile = new File(uploadPath+"\\"+originalName);
		}
		
		filegimg.transferTo(uploadFile);
		///////////////////////////////////////
		
		gdto.setGimg(originalName);
		
		int cnt = service.insert(gdto);
		System.out.println(gdto.toString());
		
		if(cnt > 0) {
			msg="등록성공";
			viewpage="redirect:/adminGameList.do";
			
		}else {
			msg="등록실패";
			viewpage="admin/game/adminGameAdd";
		}
		
		
		model.addAttribute("msg", msg);
		return viewpage;
	}
	
	//게임 삭제
	@RequestMapping("/adminGameDel.do")
	public String delete(Integer gcode) {
		
		service.delete(gcode);
		
		
		return "redirect:/adminGameList.do";
	}

}
