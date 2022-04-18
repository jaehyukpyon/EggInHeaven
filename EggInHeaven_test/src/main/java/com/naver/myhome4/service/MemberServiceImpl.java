package com.naver.myhome4.service;



import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naver.myhome4.domain.MailVO;
import com.naver.myhome4.domain.Member;
import com.naver.myhome4.domain.TempKey;

@Service
public class MemberServiceImpl implements MemberService {
	

	@Autowired
	private com.naver.myhome4.mybatis.mapper.MemberMapper dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;


	@Override
	public int insert(Member m) throws Exception {
		
		int result = dao.insert(m);
		
		String key = new TempKey().getKey(50,false);
		dao.createAuthKey(m.getEmail(), key);
		MailVO sendMail = new MailVO(mailSender);
		sendMail.setSubject("[Egg in heaven 회원가입 인증메일 입니다.]");//메일 제목
		sendMail.setText(
				"<h1>메일인증</h1><br/>" +
				m.getId() + "님 <br/>" +
				"Egg in heaven에 가입해 주셔서 감사합니다. <br/>" +
				"아래 [이메일 인증 확인]을 눌러주세요."+
				"<a href='http://localhost:8088/myhome4/member/registerEmail?email=" +
				m.getEmail() + "&key=" + key + "&id=" + m.getId() +
				"' target='_blenk'>이메일 인증 확인</a>"
			);
		sendMail.setFrom("fpdl1gkgk@naver.com", "egg in heaven");
		sendMail.setTo(m.getEmail());
		sendMail.send();
		
		return result;
	}

	@Override
	public int isId(String id) {
		Member member = dao.isId(id);
		return (member == null) ? -1 : 1 ;
	}

	@Override
	public Member member_info(String id) {
		
		return dao.isId(id);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int update(Member m) {
		return dao.update(m);
	}


	@Override
	public void memberAuth(String email,String key,String id) throws Exception {
		
		dao.memberAuth(email,key,id);
	}

	//비밀번호찾기 아이디 체크
	@Override
	public Member checkId(String id) {
		return dao.isId(id);
	}

	//새로운 비밀번호 전송
	@Override
	public int newPW(Member m) throws Exception {
		
		//난수 생성(사용자에게 보냄)
		String memberKey = new TempKey().getKey(6, false);
		//암호화(DB저장)
		String memberPw = passwordEncoder.encode(memberKey);
		m.setPassword(memberPw);
		
		int result = dao.newPW(m.getPassword(),m.getEmail(),m.getId());
		
		MailVO sendMail = new MailVO(mailSender);
		sendMail.setSubject("[egg in heaven 임시 비밀번호 입니다.]"); //메일제목
		sendMail.setText(
				"<h1>임시비밀번호 발급</h1>" +
						"<br/>"+m.getId()+"님 "+
						"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
						"<br/>임시비밀번호 :   <h2>"+memberKey+"</h2>"+
						"<br/>로그인 후 비밀번호 변경을 해주세요."+
						"<a href='http://localhost:8088/myhome4/member/login"+
						">로그인 페이지</a>");
		sendMail.setFrom("fpdl1gkgk@naver.com", "egg in heaven");
		sendMail.setTo(m.getEmail());
		sendMail.send();
		
		return result;
	}





	
	
}
