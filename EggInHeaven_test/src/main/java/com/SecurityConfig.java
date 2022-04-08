package com;

import javax.annotation.security.PermitAll;

import org.aspectj.weaver.ast.And;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.session.HttpSessionEventPublisher;

import com.naver.security.CustomAccessDeniedHandler;
import com.naver.security.CustomUserDetailsService;
import com.naver.security.LoginFailHandler;
import com.naver.security.LoginSuccessHandler;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	// <security:http> 설정 부분
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests().antMatchers("/resources/**/**").permitAll()
				/*
				.antMatchers("/member/login").permitAll()
				.antMatchers("/member/join").permitAll()
				.antMatchers("/member/idcheck").permitAll()
				.antMatchers("/member/joinProcess").permitAll()
				.antMatchers("/member/list").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/member/info").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/**").access("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')");
				*/
				.antMatchers("/**").permitAll();
		
		http.formLogin().loginPage("/member/login")
			.loginProcessingUrl("/member/loginProcess")
			.usernameParameter("id")
			.passwordParameter("password")
			.successHandler(loginSuccessHandler())
			.failureHandler(loginFailHandler());
		
		http.logout()
			.logoutSuccessUrl("/member/login")
			.logoutUrl("/member/logout")
			.invalidateHttpSession(true)
			.deleteCookies("remember-me", "JSESSIONID")
			.clearAuthentication(true)
			.permitAll();		
		
		http.rememberMe().rememberMeParameter("remember-me")
			.rememberMeCookieName("remember-me")
			.tokenValiditySeconds(2419200);
		
		http.exceptionHandling().accessDeniedHandler(accessDeniedHandler());
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserService()).passwordEncoder(passwordEncoder());
	}
	
	// 로그인 성공 시 실행할 객체 생성
	@Bean
	public AuthenticationSuccessHandler loginSuccessHandler() {
		return new LoginSuccessHandler();
	}
	
	@Bean
	public UserDetailsService customUserService() {
		return new CustomUserDetailsService();
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public AccessDeniedHandler accessDeniedHandler() {
		return new CustomAccessDeniedHandler();
	}
	
	@Bean
	public AuthenticationFailureHandler loginFailHandler() {
		return new LoginFailHandler();
	}	
	
}