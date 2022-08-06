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
		
		List<GameDTO> gamelist = service.getgameList();
		
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
		filegimg.transferTo(uploadFile);
		///////////////////////////////////////
		
		gdto.setGimg(originalName);
		
		int cnt = service.gameinsert(gdto);
		System.out.println(gdto.toString());
		
		if(cnt > 0) {
			msg="등록성공";
			viewpage="redirect:/adminGameList.do";
			
		}else {
			msg="등록실패";
			viewpage="admin/game/adminGameAdd";
		}
		
		
		/*for(int i=11; i<=50; i++) {
			GameDTO dto = new GameDTO();
			dto.setGimg("test"+i+".png");
			dto.setGname("test"+i);
			dto.setGcat("RPG");
			dto.setGfee("무료");
			dto.setGcomp("test"+i);	
			service.insert(dto);
		}
		viewpage="redirect:/adminGameList.do";
		*/
		model.addAttribute("msg", msg);
		return viewpage;
	}
	
	//게임 삭제
	@RequestMapping("/adminGameDel.do")
	public String delete(Integer gcode,String gimg, HttpServletRequest request) {
		
		service.gamedelete(gcode);
		
		String UPLOAD_DIR = "gameimg";
		
		String path = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		
		
		File file = new File(path + "\\" + gimg);
				
		if(file.exists()) { 
			file.delete();	
		}
		
		return "redirect:/adminGameList.do";
	}
	
	//게임 추가 페이지이동
	@RequestMapping("/adminGameView.do")
	public String viewpage(Integer gcode, Model model) {
		GameDTO gdto =  service.getgame(gcode);
		model.addAttribute("gdto", gdto);
		
		return "admin/game/adminGameView";
	}
	
	//게임 수정
	@RequestMapping(value="/adminGameMod.do", method=RequestMethod.POST)
	public String update(GameDTO gdto , HttpServletRequest request,
			Model model, String pregimg) throws IOException{
		
//		System.out.println(gdto.toString());
		
		//////////////이미지 수정//////////////
		System.out.println("pregimg : "+pregimg);
		//저장하고 지우기 !!!
		
		String UPLOAD_DIR = "gameimg";
		String path = request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		File file = new File(path + "\\" + gdto.getGimg());
		
		if(!file.exists()) { 
			/// 지우기////
			File delfile = new File(path + "\\" + pregimg);	
			if(delfile.exists()) { 
				delfile.delete();
			}
			
			//저장////
			MultipartFile filegimg= gdto.getFilegimg();
			String originalName = System. currentTimeMillis()+filegimg.getOriginalFilename();
			gdto.setGimg(originalName);
			System.out.println("originalName : "+originalName);
			
			
			
			// 실제 파일 업로드
			File uploadFile = (new File(path+"\\"+originalName));
			
			if(!uploadFile.exists()) { // 경로가 있는지 확인하기, 처음 한번만 실행 
				if(uploadFile.getParentFile().mkdirs()) { // uploadPath에 지정된 폴더생성
					uploadFile.createNewFile(); //임시로 파일 생성
				}
			}
			
			filegimg.transferTo(uploadFile);
		}
		///////////////////////////////////
		service.gameupdate(gdto);
		
		return "redirect:/adminGameList.do";
	}
	
	//게임 추가 페이지이동
	@RequestMapping("/adminGameSearch.do")
	public String adminGameSearch(String gname, Model model) {
		
		List<GameDTO> gamelist = service.gamesearch(gname);
		
		model.addAttribute("gamelist", gamelist);
		
		return "admin/game/adminGameList";
		
	}
	

}
