package com.naver.myhome4.controller;



import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome4.domain.MailVO;
import com.naver.myhome4.domain.Member;
import com.naver.myhome4.service.MemberService;




@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	

	
	//로그인 폼 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv, @CookieValue(value = "remember-me", required = false) Cookie readCookie,
			HttpSession session, Principal principal) {
		if (readCookie != null) {
			logger.info("저장된 아이디 :" + principal.getName()); // principal.getName() : 로그인한 아이디 값을 알 수 있어요
			mv.setViewName("redirect:/main");

		} else {
			mv.setViewName("member/login");
			mv.addObject("loginfail", session.getAttribute("loginfail")); // 세션에 저장된 값을 한 번만 실행될 수 있도록 model에 저장하고
			mv.addObject("disabled", session.getAttribute("disabled"));
			session.removeAttribute("loginfail"); // 세션의 값은 제거합니다.
			session.removeAttribute("disabled");
		}
		return mv;
	}
	
	//회원가입 폼 이동
	
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public ModelAndView join(ModelAndView mv) {
		
		mv.setViewName("member/join");
		return mv;
	}
	
	
	//회원가입폼에서 아이디 검사
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public void idcheck(@RequestParam("id") String id,
								HttpServletResponse response) throws Exception {

			
		int result = memberservice.isId(id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	
	//회원가입 처리
	@RequestMapping(value = "/joinProcess", method = RequestMethod.POST)
	public String joinProcess(Member member,
			RedirectAttributes rattr,
			Model model,
			HttpServletRequest request) throws Exception {


		//비밀번호 암호화 추가
		String encPassword = passwordEncoder.encode(member.getPassword());
		logger.info(encPassword);
		member.setPassword(encPassword);
			
			
		int result = memberservice.insert(member);
			
			
		if(result == 1) {
			rattr.addFlashAttribute("result","joinSuccess");
			rattr.addFlashAttribute("memberEmail",member.getEmail());
			rattr.addFlashAttribute("memberId",member.getId());
			//인증 안내 페이지로 이동
			return "redirect:auth";
			
		}else { //회원가입 실패 시
			return "redirect:join";
		}
			
	}
	
	//인증 안내 페이지 이동
	
	@RequestMapping(value="/auth", method = RequestMethod.GET)
	public ModelAndView auth(ModelAndView mv) {
			
		mv.setViewName("member/auth");
		return mv;
	}
	
	
	//이메일 인증 페이지(메일로 보내진 링크)
	@RequestMapping(value="/registerEmail", method=RequestMethod.GET)
	public String emailConfirm(String email,String key,String id, Model model)throws Exception{
		
		memberservice.memberAuth(email,key,id);
		
		model.addAttribute("memberEmail",email);
		
		return "/member/registerEmail";
	}
	
	//비밀번호 찾기 페이지로 이동
	@GetMapping(value="/findPW")
	public String findPW() {
		return "/member/findPW";
	}
	
	
	//새로운 비밀번호 발급
	@PostMapping(value="/newPW")
	public String newPW(
			String id,
			RedirectAttributes rattr,
			Model model
			) throws Exception {
		logger.info("받아온ID=" + id);		
		
		Member m = memberservice.checkId(id);
		
		
		if(m != null && m.getMember_auth() == 1) {
			m.setId(id);
			logger.info("회원확인 후 비밀번호 전송");
			int result = memberservice.newPW(m);
			
			if(result == 1) {
				model.addAttribute("result","newPWSuccess");
				model.addAttribute("email",m.getEmail());

				logger.info("새 비밀번호 발급 성공");
				
				return "/member/login";
				
			}else {
				rattr.addFlashAttribute("result","newPWFail");
				logger.info("새 비밀번호 발급 실패");
				
				return "redirect:findPW";
			}
			
		}else {
			rattr.addFlashAttribute("result","findIdFail");
			return "redirect:findPW";
		}
		
	}

	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String loginout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
	
	
	
	
	
}	
	
	
	
	