package com.naver.myhome4.mybatis.mapper;



import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome4.domain.Member;

public interface MemberMapper {
	public Member isId(String id);
	
	public int insert(Member m);
	
	//auth테이블에 키랑 이메일주소 저장
	public void createAuthKey(String email,String authKey) throws Exception;
	
	//이메일 인증 확인 처리(member테이블의 member_auth를 1로 변경)
	public void memberAuth(String email,String key, String id) throws Exception;
	
	//새 비밀번호 저장
	public int newPW(String password, String email, String id) throws Exception;
	
	//회원정보 수정
	public int update(Member m);
}
