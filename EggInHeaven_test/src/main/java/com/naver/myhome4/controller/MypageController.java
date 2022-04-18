package com.naver.myhome4.controller;

import java.io.File;
import java.security.Principal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome4.domain.Community;
import com.naver.myhome4.domain.MainRecipe;
import com.naver.myhome4.domain.Member;
import com.naver.myhome4.domain.ProfileSaveFolder;
import com.naver.myhome4.service.MemberService;
import com.naver.myhome4.service.MypageService;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private ProfileSaveFolder profilesavefolder;
	
	@GetMapping(value = "/mypage")
	public ModelAndView mypage(ModelAndView mv) {
		

		mv.setViewName("member/mypage");
		
		return mv;
	}
	
	
	
	@ResponseBody
	@PostMapping(value = "/my_recipe")
	public Map<String,Object> myRecipe(
			@RequestParam(value = "id") String id
			){
		
		int mylistcount = mypageService.getMyListCount(id);//총 리스트 수 받아옴
		
		List<MainRecipe> myboardlist = mypageService.getMyList(id);
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("listcount", mylistcount);
		map.put("boardlist", myboardlist);
		
		return map;
		
	}
	
	@ResponseBody
	@PostMapping(value = "like_recipe")
	public Map<String,Object> likeRecipe(
			@RequestParam(value = "id") String id
			){
		
		int likelistcount = mypageService.getLikeListCount(id);//총 리스트 수 받아옴
		
		List<MainRecipe> likelist = mypageService.getLikeList(id);
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("listcount", likelistcount);
		map.put("boardlist", likelist);
		
		return map;
		
	}
	
	
	@ResponseBody
	@PostMapping(value = "my_commu")
	public Map<String,Object> myCommu(
			@RequestParam(value = "id") String id
			){
		
		int commucount = mypageService.getCommuListCount(id);//총 리스트 수 받아옴
		
		List<Community> commulist = mypageService.getCommuList(id);
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("listcount", commucount);
		map.put("boardlist", commulist);
		
		return map;
		
	}
	
	@GetMapping(value = "/mypage_info")
	public ModelAndView mypage_info(
			Principal principal,
			ModelAndView mv		
			) {
		String id = principal.getName();
		
		if(id==null) {
			mv.setViewName("redirect:login");
			logger.info("id is null");
			
		}else {
			Member m = memberService.member_info(id);
			
			mv.setViewName("member/mypage_info");
			mv.addObject("memberInfo",m);
			mv.addObject("Id",id);
		}

		return mv;
	}

	//수정 처리
	@PostMapping(value = "/updateProcess")
	public String updateProcess(
			String check,
			Member member, 
			Model model,									
			HttpServletRequest request,
			RedirectAttributes rattr) throws Exception{
			
		
		MultipartFile uploadfile = member.getUpload();
		//변경
		String saveFolder = profilesavefolder.getProfilesavefolder();
		System.out.println("파일이름" + saveFolder);
		System.out.println(check);
		
		
		if(check != null && !check.equals("") ) { //기본 파일 그대로 사용하는 경우
			logger.info("기존파일 그대로 사용합니다.");
			member.setProfile_img(check);

		} else {
			
			if (uploadfile != null && !uploadfile.isEmpty()) {
				logger.info("파일 변경되었습니다.");
				
				String fileName = uploadfile.getOriginalFilename();//원래 파일명
				String fileDBName = fileDBName(fileName, saveFolder);
				
				// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
				uploadfile.transferTo(new File(saveFolder + fileDBName));
				
				//바뀐 파일명으로 저장
				member.setProfile_img(fileDBName);
			}else {
				logger.info("선택한 파일 없습니다.");

				member.setProfile_img("");
			}
			
			
		}
		
		//비밀번호 암호화 추가
		String encPassword = passwordEncoder.encode(member.getPassword());
		logger.info(encPassword);
		member.setPassword(encPassword);
	
	
		int result = memberService.update(member);
		if (result == 1) {
			rattr.addFlashAttribute("result","updateSuccess");
			return "redirect:/main";
		} else {
			model.addAttribute("url",request.getRequestURL());
			model.addAttribute("message","정보 수정 실패");
			return "error/error";
		}
		
	}
	
	
	private String fileDBName(String fileName, String saveFolder) {
		//새로운 폴더 이름 : 오늘 년+월+일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); //오늘 년도 구합니다.
		int month = c.get(Calendar.MONTH) +1; //오늘 월 구합니다.
		int date = c.get(Calendar.DATE);//오늘 일 구합니다.
		
		String homedir = saveFolder + year + "-" + month + "-" + date;
		logger.info(homedir);
		File path1 = new File(homedir);
		if (!(path1.exists())) { //hemedir경로의 폴더가 존재하는지 확인합니다.
			path1.mkdir();//새로운 폴더 생성		
		}
		
		//난수를 구합니다.
		Random r = new Random();
		int random = r.nextInt(100000000);
		
		/*** 확장자 구하기 시작***/
		int index = fileName.lastIndexOf(".");
		//문자열에서 특정 문자열의 위치 값(index)를 반환합니다.
		//indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
		//lastIndexOf는 마지막으로 발견되는 문자열의index를 반환합니다.
		//(파일명에 점이 여러개 있는 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다..)
		logger.info("index = " + index);
		
		String fileExtension = fileName.substring(index + 1);
		logger.info("fileExtension = " + fileExtension);
		/** 확장자 구하기 끝 ***/
		
		//새로운 파일명
		String refileName = "egg" + year + month + date + random + "." + fileExtension;
		logger.info("refileName = " + refileName);
		
		//오라클 디비에 저장될 파일 명
		//String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		String fileDBName = File.separator + year + "-" + month + "-" 
							+ date + File.separator + refileName;
		logger.info("fileDBName = " + fileDBName);
		return fileDBName;
	}
	
	
	
}
