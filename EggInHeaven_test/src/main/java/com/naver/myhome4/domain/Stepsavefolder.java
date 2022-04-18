package com.naver.myhome4.domain;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix="step")
public class Stepsavefolder {

	private String stepsavefolder;
	private String stepsendfile;
	private String stepsavepath;
	
	public String getStepsavefolder() {
		return stepsavefolder;
	}
	public void setStepsavefolder(String stepsavefolder) {
		this.stepsavefolder = stepsavefolder;
	}
	public String getStepsendfile() {
		return stepsendfile;
	}
	public void setStepsendfile(String stepsendfile) {
		this.stepsendfile = stepsendfile;
	}
	public String getStepsavepath() {
		return stepsavepath;
	}
	public void setStepsavepath(String stepsavepath) {
		this.stepsavepath = stepsavepath;
	}
	
}
