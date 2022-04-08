package com.naver.myhome4.controller;

import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome4.domain.Community;
import com.naver.myhome4.domain.MySaveFolder;
import com.naver.myhome4.domain.MySaveFolder2;

import com.naver.myhome4.service.CommentService;
import com.naver.myhome4.service.CommunityService;

import org.springframework.util.FileCopyUtils;




@Controller
@RequestMapping(value="community")
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@Autowired
	private CommunityService communityService;
	
	
	  @Autowired private CommentService commentService;
	  
	  @Autowired private MySaveFolder mysavefolder;
	 
	
	//글쓰기
	@GetMapping(value="/write")
	//@RequestMapping(value="/write",method="RequestMethod.GET)
	public String commu_write() {
		
		return "community/commu_write";
	}
	
	//글목록
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView commuList(
									@RequestParam(value="page", defaultValue="1", required=false) int page,
			                         ModelAndView mv,
			                         @RequestParam(value="search_field", defaultValue = "", required = false) String index,
			             			 @RequestParam(value="search_word", defaultValue = "", required = false) String search_word 
			                         ) {
		
		int limit = 10; // 한 화면에 출력할 레코드 갯수
		
		int listcount = communityService.getListCount(index, search_word); // 총 리스트 수 받아옴
		
		// 총 페이지 수
		int maxpage = (listcount + limit - 1) /limit;
		
		// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
		int startpage = ((page-1) / 10) * 10 + 1;
		
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
		int endpage = startpage + 10 -1;
		
		if(endpage > maxpage)
			endpage=maxpage;
		
		List<Community> commulist = communityService.getCommuList(index, search_word, page, limit); // 리스트를 받아옴
		
		mv.setViewName("community/commu_list");
		mv.addObject("page", page);
		mv.addObject("maxpage",maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage",endpage);
		mv.addObject("listcount",listcount);
		mv.addObject("commulist",commulist);
		mv.addObject("limit",limit);
		mv.addObject("search_field", index);
		mv.addObject("search_word", search_word);
		
		return mv;
	}
	
	//내가 쓴 글목록
		@RequestMapping(value="/mylist", method=RequestMethod.GET)
		public ModelAndView mycommuList(
										@RequestParam(value="page", defaultValue="1", required=false) int page,
										ModelAndView mv) {
			
			int limit = 10; // 한 화면에 출력할 레코드 갯수
			
			int listcount = communityService.getMyListCount(); // 총 리스트 수 받아옴
			
			// 총 페이지 수
			int maxpage = (listcount + limit - 1) /limit;
			
			// 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
			int startpage = ((page-1) / 10) * 10 + 1;
			
			// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
			int endpage = startpage + 10 -1;
			
			if(endpage > maxpage)
				endpage=maxpage;
			
			List<Community> commulist = communityService.getMyCommuList(page, limit); // 리스트를 받아옴
			
			mv.setViewName("community/commu_mylist");
			mv.addObject("page", page);
			mv.addObject("maxpage",maxpage);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage",endpage);
			mv.addObject("listcount",listcount);
			mv.addObject("commulist",commulist);
			mv.addObject("limit",limit);
			
			return mv;
		}
	
	
	@PostMapping("/add")
	   //@RequestMapping(value="/add",method=RequestMethod.POST)
	   public String add(Community community, HttpServletRequest request)
	         throws Exception {
	      
	      MultipartFile uploadfile = community.getUploadfile();

	      if (!uploadfile.isEmpty()) {
	         String fileName = uploadfile.getOriginalFilename();//원래 파일명
	        
	         //변경
	         String saveFolder = mysavefolder.getSavefolder();
	         
	         String fileDBName = fileDBName(fileName, saveFolder);//파일이름 중복 방지위해 변경
	         logger.info("fileDBName1 = " + fileDBName);

	         // transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
	         uploadfile.transferTo(new File(saveFolder + fileDBName));
	         logger.info("fileDBName = " + saveFolder + fileDBName);
	         // 바뀐 파일명으로 저장
	         community.setCommu_img(fileDBName);
	      }

	      communityService.insertCommunity(community); // 저장메서드 호출
	      logger.info(community.toString());
	      return "redirect:list";
	   }

	private String fileDBName(String fileName, String saveFolder) {
	      // 새로운 폴더 이름 : 오늘 년+월+일
	      Calendar c = Calendar.getInstance();
	      int year = c.get(Calendar.YEAR); // 오늘 년도 구합니다.
	      int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구합니다.
	      int date = c.get(Calendar.DATE); // 오늘 일 구합니다.

	      String homedir = saveFolder + year + "-" + month + "-" + date;
	      logger.info(homedir);
	      File path1 = new File(homedir);
	      if (!(path1.exists())) {  //homedir 경로의 폴더가 존재하는지 확인합니다.
	    	  logger.info("디렉토리 만들어요");
	         path1.mkdir();// 새로운 폴더를 생성
	      }

	      // 난수를 구합니다.
	      Random r = new Random();
	      int random = r.nextInt(100000000);

	      /**** 확장자 구하기 시작 ****/
	      int index = fileName.lastIndexOf(".");
	      // 문자열에서 특정 문자열의 위치 값(index)를 반환합니다.
	      // indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
	      // lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
	      // (파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
	      logger.info("index = " + index);

	      String fileExtension = fileName.substring(index + 1);
	      logger.info("fileExtension = " + fileExtension);
	      /**** 확장자 구하기 끝 ***/

	      // 새로운 파일명
	      String refileName = "bbs" + year + month + date + random + "." + fileExtension;
	      logger.info("refileName3 = " + refileName);

	      // 오라클 디비에 저장될 파일 명
	      //String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
	      String fileDBName = File.separator + year + "-" + month + "-" + date + File.separator + refileName;
	      logger.info("fileDBName4 = " + fileDBName);
	      return fileDBName;
	      
	   }
	
	@GetMapping("/detail")
	public ModelAndView Detail(
			int num, ModelAndView mv,
			HttpServletRequest request,
			@RequestHeader(value="referer") String beforeURL)
			//String beforeURL = request.getHeader("referer"); 의미로
		    //어느 주소에서 detail로 이동했는지 header의 정보 중에서 "referer"를 통해 알 수 있습니다.
	{
		logger.info("referer: " + beforeURL);
		if(beforeURL.endsWith("list")) { //myhome4/board/member/list 에서 제목을 클릭한 경우만 조회수가 증가하도록 합니다.
			communityService.setReadCountUpdate(num);
		}
		
		Community community = communityService.getDetail(num);
		//board=null; //error 페이지 이동 확인하고자 임의로 지정합니다.
		if(community == null) {
			logger.info("상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "상세보기 실패입니다.");
		} else {
			logger.info("상세보기 성공");
			int count = commentService.getListCount(num);
			mv.setViewName("community/commu_view");
			mv.addObject("count", count);
			mv.addObject("commudata", community);
		}
		return mv;
	}
	 
	
	
	@GetMapping("/modifyView")
	public ModelAndView CommunityModifyView(int num,
			ModelAndView mv,
			HttpServletRequest request
			) {
		Community commudata = communityService.getDetail(num);
		
		// 글 내용 불러오기 실패한 경우
		if (commudata == null) {
			logger.info("수정보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "수정보기 실패입니다.");
			return mv;
		}
		logger.info("(수정)상세보기 성공");
		// 수정 폼 페이지로 이동할 때 원문 글 내용을 보여주기 때문에 boarddata 객체를
		// ModelAndView 객체에 저장합니다.
		mv.addObject("commudata", commudata);
		// 글 수정 폼 페이지로 이동하기 위해 경로를 설정합니다.
		mv.setViewName("community/commu_modify");
		return mv;
	}
	
	@PostMapping("/modifyAction")
	public String CommunityModifyAction(
			Community commudata,
			String check, Model mv, 
			HttpServletRequest request,
			RedirectAttributes rattr
			) throws Exception {
		boolean usercheck =
				communityService.isCommunityWriter(commudata.getCommu_num(), commudata.getCommu_pass());
		String url="";
		// 비밀번호가 다른경우
		if (usercheck == false) {
			rattr.addFlashAttribute("result", "passFail");
			rattr.addAttribute("num", commudata.getCommu_num());
			return "redirect:modifyView";
		}
		
		MultipartFile uploadfile = commudata.getUploadfile();
		//변경
        String saveFolder = mysavefolder.getSavefolder();
		
		if (check != null && !check.equals("")) {
			logger.info("기존파일 그대로 사용합니다.");
			commudata.setCommu_img(check);
		}else {
			
			//답변글의 경우 파일 첨부에 대한 기능이 없다
			// 만약 답변글을 수정할 경우
			//<input type="file" id="upfile" name="uploadfile" > 엘리먼트가 존재하지 않아
			//private Multipartfile uploadfile; 에서 uploadfile은 null 입니다.
			if (uploadfile!=null && !uploadfile.isEmpty()) {
				logger.info("파일 변경되었습니다.");
				
				String fileName = uploadfile.getOriginalFilename(); //원래 파일명
				//commudata.setBOARD_ORIGINAL(fileName);
				
				String fileDBName = fileDBName(fileName, saveFolder);
				//transferTo(File path) : 업로드한 파일의 매개변수의 경로에 저장합니다.
				uploadfile.transferTo(new File(saveFolder + fileDBName));
				//바뀐 파일명으로 저장
				commudata.setCommu_img(fileDBName);
				
			}else {	//파일 선택하지 않은 경우
				logger.info("선택한 파일이 없습니다.");
				// <input type="hidden" name="BOARD_FILE" value="${boarddata.BOARD_FILE}">
				//위 태그에 값이 있다면 ""로 값을 변경합니다.
				commudata.setCommu_img(""); //""로 초기화 합니다.
				//boarddata.setBOARD_ORIGINAL(""); //""로 초기화
 			}
		}
		
		// DAO에서 수정 메서드 호출하여 수정합니다.
		int result = communityService.communityModify(commudata);
		
		//수정에 실패한 경우
		if (result == 0) {
			logger.info("게시판 수정 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "게시판 수정 실패");
			url="error/error";
		}else {
			logger.info("게시판 수정 완료");
			// 수정한 글 내용을 보여주기 위해 글 내용 보기 보기 페이지로 이동하기위해 경로를 설정합니다.
			url = "redirect:detail";
			rattr.addAttribute("num", commudata.getCommu_num());
		}
		return url;
	}
	
	@PostMapping("/delete")
	public String CommunityDeleteAction(String commu_pass, int num, Model mv,
										 HttpServletRequest request,
										 RedirectAttributes rattr
			) {
		//비밀번호 확인작업
		boolean usercheck = communityService.isCommunityWriter(num, commu_pass);
		
		//비번이 다른경우
		if (usercheck == false) {
			logger.info("비밀번호가 다릅니다.");
			rattr.addFlashAttribute("result", "passFail");
			rattr.addAttribute("num", num);
			return "redirect:detail";
		}
		
		// 비밀번호가 일치하는 경우
		int result = communityService.communityDelete(num);
		
		//삭제 실패한 경우
		if (result == 0) {
			logger.info("게시판 삭제 실패");
			mv.addAttribute("url", request.getRequestURL());
			mv.addAttribute("message", "삭제 실패");
			return "error/error";
		}
		
		logger.info("게시판 삭제 성공");
		rattr.addFlashAttribute("result", "deleteSuccess");
		return "redirect:list";
	}
	
}


