package kr.mr.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.mr.mapper.GameNewMapper;
import kr.mr.mapper.GameRankMapper;
import kr.mr.model.GameNewDTO;
import kr.mr.model.GameRankDTO;

@Service
public class CrawlServiceImpl implements CrawlService{
	
    @Autowired 
    private GameNewMapper gnmapper;
    
    @Autowired 
    private GameRankMapper grmMapper;
    
    private WebDriver driver;
    private static final String url = "https://www.thelog.co.kr/index.do";
	
	
	@Override
	public List<List> crawlList() {
		List<List> allList= new ArrayList<List>();
    	if(grnlist().get(0) == null || grnlist().get(0).size()==0
    			||grnlist().get(1) == null || grnlist().get(1).size()==0) {
    		
    		insert(allgrnlist().get(1),allgrnlist().get(0));
    		allList = grnlist();
    	}else {
    		allList =grnlist();
    		GameRankDTO grdto = (GameRankDTO) allList.get(1).get(0) ;
    		GameNewDTO gndto = (GameNewDTO) allList.get(0).get(0) ;
    		
    		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
    		
    		Date now = new Date(); 
    		Date grupdate = grdto.getGrupdate();
    		Date gnupdate = gndto.getGnupdate();
    		if(!format.format(now).equals(format.format(grupdate)) || !format.format(now).equals(format.format(gnupdate))){
    			alldelete();
//    			insert(allgrlist(),allgninsert());
    			insert(allgrnlist().get(1),allgrnlist().get(0));
    			allList = grnlist();
    		}
    	}
    	return allList;
	}
	
	//db에서 전체리스트 가져오기
    private List<List> grnlist(){
    	List<List> grnlist = new ArrayList<List>();
    	
    	
			 
		 List<GameNewDTO> gnlist = gnmapper.getgamenewList(); 
		 grnlist.add(gnlist); 
	 
	
		List<GameRankDTO> grlist = grmMapper.getgamerankList();
		grnlist.add(grlist);
    		
		
    	return grnlist;
    }
    
    
    //db전체 삭제
    private void alldelete() {
    	gnmapper.gamenewdelete();
    	grmMapper.gamerankdelete();
    }
    
    
    //db 등록(크롤링)
//    private List<GameRankDTO> allgrlist(){
    private List<List> allgrnlist(){
    	System.setProperty("webdriver.chrome.driver", "/chromedriver/chromedriver.exe");
    	//크롬 드라이버 셋팅 (드라이버 설치한 경로 입력)

        ChromeOptions chromeOptions = new ChromeOptions();
        chromeOptions.addArguments("--headless");
        chromeOptions.addArguments("--no-sandbox");
        driver = new ChromeDriver(chromeOptions);
        
        List<List> allgrnlist= new ArrayList<List>();
        
        List<GameRankDTO> grlist= new ArrayList<GameRankDTO>();
        List<GameNewDTO> gnlist = new ArrayList<GameNewDTO>();
        
        Date now = new Date();
        try {
        	driver.get(url);    //브라우저에서 url로 이동한다.
            Thread.sleep(1000); //브라우저 로딩될때까지 잠시 기다린다.
           //gameranklist등록////////////////////////////////////////
            gnlist = crgnlist();
            allgrnlist.add(gnlist);
            
          //gameranklist등록////////////////////////////////////////
            grlist= crgrlist();
            allgrnlist.add(grlist);
            
            
		} catch (InterruptedException e) {
            e.printStackTrace();
        }
        
        driver.close();	//탭 닫기
        driver.quit();	//브라우저 닫기
        
        return allgrnlist;
    }
    
    //db 등록(크롤링)
    private List<GameNewDTO> allgninsert(){
    	System.setProperty("webdriver.chrome.driver", "/chromedriver/chromedriver.exe");
    	//크롬 드라이버 셋팅 (드라이버 설치한 경로 입력)

        ChromeOptions chromeOptions = new ChromeOptions();
        chromeOptions.addArguments("--headless");
        chromeOptions.addArguments("--no-sandbox");
        driver = new ChromeDriver(chromeOptions);
        
        List<GameNewDTO> gnlist = new ArrayList<GameNewDTO>();
        Date now = new Date();
        try {
        	driver.get(url);    //브라우저에서 url로 이동한다.
            Thread.sleep(1000); //브라우저 로딩될때까지 잠시 기다린다.
    	    
    	  //gameranklist등록////////////////////////////////////////
            gnlist = crgnlist();
		} catch (InterruptedException e) {
            e.printStackTrace();
        }
        
        driver.close();	//탭 닫기
        driver.quit();	//브라우저 닫기
        
        return gnlist;
    }
    
    private List<GameRankDTO> crgrlist(){
    	List<GameRankDTO> grlist = new ArrayList<GameRankDTO>();
    	List<WebElement> grelements = driver.findElements(By.xpath("//*[@id=\"game_rank\"]/tr/td"));
	    
	    GameRankDTO grdto = new GameRankDTO();
	    
	    int i =1;
	    for(WebElement element : grelements) {
	    	String elestr = element.getAttribute("innerText");
	    	if(i%4==1) {
	    		String[] strl = elestr.split("\\s");
	    		grdto.setRanking(Integer.parseInt(strl[0]));
	    		
	    		if(!strl[1].equals("동일")) {
	    			grdto.setGrstat(strl[1].substring(0,strl[1].length()-1));
	    			grdto.setGrgap(Integer.parseInt(strl[1].substring(strl[1].length()-1)));
	    			
	    		}else {
	    			grdto.setGrstat(strl[1]);
	    			grdto.setGrgap(0);
	    		}
	    	}else if(i%4==2) {
	    		grdto.setGrname(elestr);
	    	}else if(i%4==3) {
	    		grdto.setGrcomp(elestr);
	    	}else if(i%4==0) {
	    		grdto.setGrshare(elestr);
	    		grlist.add(grdto);
	    		grdto= new GameRankDTO();
	    		
	    	}//if끝
	    	i++;
	    }//for문 끝
    	return grlist;
    	
    }
    
    private List<GameNewDTO> crgnlist(){
    	List<GameNewDTO> gnlist = new ArrayList<GameNewDTO>();
	    List<WebElement> elements = driver.findElements(By.xpath("//*[@id=\"new_game_rank\"]/tr/td"));
	    
	    GameNewDTO gndto = new GameNewDTO();
	    
	    int i =1;
	    for(WebElement element : elements) {
	    	String elestr = element.getAttribute("innerText");
	    	if(i%3==1) {
	    		gndto.setGnrelease(elestr);
	    	}else if(i%3==2) {
	    		gndto.setGnname(elestr);

	    	}else if(i%3==0) {
	    		gndto.setGnshare(elestr);
	    		gnlist.add(gndto);
	    		gndto = new GameNewDTO();
	    	}
	    	i++;
	    }
	    return gnlist;
    }
    
    //db등록
    private void insert(List<GameRankDTO> grlist, List<GameNewDTO> gnlist){
    	for(GameRankDTO grgrdto : grlist) {
    		grmMapper.gamerankinsert(grgrdto);
        }
        
        for(GameNewDTO gngndto : gnlist) {
    		gnmapper.gamenewinsert(gngndto);
        }
    	
    }

}
