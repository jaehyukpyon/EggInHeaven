package com.naver.security;

import java.util.ArrayList;
import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.Member;
import com.naver.myhome4.mybatis.mapper.MemberMapper;


// @Service
public class CustomUserDetailsService implements UserDetailsService {
	
	/*
	 * 1. UserDetailsService interface는 DB에서 user 정보를 불러오는 loadUserByUsername()이 존재. 
	 *    이를 구현하는 클래스는 DB에서 유저의 정보를 가져와서 UserDetails type으로 return 해 주는 작업을 함.
	 * 
	 * 2. UserDetails는 인터페이스로 Security에서 사용자의 정보를 담는 interface.
	 * 
	 * 3. UserDetails 인터페이스를 구현한 클래스는 실제로 사용자의 정보와 사용자가 가진 권한의 정보를 처리하여 반환하게 된다.
	 *    예) UserDetails user = new User(username, users.getPassword(), roles);
	 */

	private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);
	
	@Autowired
	private MemberMapper dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("username은 로그인 시 입력한 값: {}", username);
		
		Member users = dao.isId(username);
		if (users == null) {
			logger.info("Username: {} not found...", username);
			throw new UsernameNotFoundException("username: " + username + " not found exception...");
		}
		int auth = users.getMember_auth();
		logger.info("auth="+ auth);
		boolean isEnabled = false;
		if(auth == 1) {
			isEnabled = true;
		}
		
		// GrantedAuthority: 인증 개체에 부여된 권한을 나타내기 위한 인터페이스로 이를 구현한 구현체는 생성자에 권한을 문자열로 넣어주면 ok
		// SimpleGrantedAuthority: GrantedAuthority의 구현체.
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		
		roles.add(new SimpleGrantedAuthority("ROLE_MEMBER"));
		
		//return new User(username, users.getPassword(), roles);
		return new User(username, users.getPassword(),isEnabled, true, true, true, roles);
		/*
		 * public User(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) 
		 */
	}

}
