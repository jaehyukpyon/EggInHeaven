package com.naver.myhome4.domain;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix="cook")
public class Cooksavefolder {

	private String cooksavefolder;
	private String cooksendfile;
	private String cooksavepath;
	
	public String getCooksavefolder() {
		return cooksavefolder;
	}
	public void setCooksavefolder(String cooksavefolder) {
		this.cooksavefolder = cooksavefolder;
	}
	public String getCooksendfile() {
		return cooksendfile;
	}
	public void setCooksendfile(String cooksendfile) {
		this.cooksendfile = cooksendfile;
	}
	public String getCooksavepath() {
		return cooksavepath;
	}
	public void setCooksavepath(String cooksavepath) {
		this.cooksavepath = cooksavepath;
	}
	
}
