package com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.naver.myhome4.domain.MySaveFolder;
import com.naver.myhome4.domain.MySaveFolder2;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Autowired
	   private MySaveFolder2 mysavefolder;
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		// url mapping "/"로 접속하면 "/member/login"으로 이동
		//registry.addViewController("/").setViewName("forward:/member/login");
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		 registry.addResourceHandler("/resources/**").addResourceLocations("classpath:/static/");
	        registry.addResourceHandler("/upload/**").addResourceLocations(mysavefolder.getSavepath());
	        //.addResourceLocations("file:///C:/upload/");
	    }
	
}
