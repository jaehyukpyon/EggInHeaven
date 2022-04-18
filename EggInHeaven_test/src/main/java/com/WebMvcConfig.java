package com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.naver.myhome4.domain.CookSaveFolder;
import com.naver.myhome4.domain.MySaveFolder2;
import com.naver.myhome4.domain.ProfileSaveFolder;
import com.naver.myhome4.domain.StepSaveFolder;
import com.naver.myhome4.domain.JayPath;
import com.naver.myhome4.domain.MySaveFolder;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Autowired
	private MySaveFolder2 mysavefolder;
	
	@Autowired
	private CookSaveFolder cooksavefolder;
	
	@Autowired
	private StepSaveFolder stepsavefolder;
	
	@Autowired
	private ProfileSaveFolder profilesavefolder;
  
  @Autowired
	private JayPath jayPath;
	
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		// url mapping "/"로 접속하면 "/member/login"으로 이동
		registry.addViewController("/").setViewName("forward:/member/login");
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		 registry.addResourceHandler("/resources/**").addResourceLocations("classpath:/static/");
	     registry.addResourceHandler("/upload/**")
	     	.addResourceLocations(mysavefolder.getSavepath());
	     registry.addResourceHandler("/cook/**")
	     	.addResourceLocations(cooksavefolder.getCooksavepath());
	     registry.addResourceHandler("/step/**")
	     	.addResourceLocations(stepsavefolder.getStepsavepath());
	     registry.addResourceHandler("/profile/**")
	     	.addResourceLocations(profilesavefolder.getProfilesavepath());
    
    
    registry.addResourceHandler("/jayStep/**").addResourceLocations(jayPath.getStepPath());
		registry.addResourceHandler("/jayCook/**").addResourceLocations(jayPath.getCookPath());
	}
	
}
