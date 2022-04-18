package com.naver.myhome4.domain;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "jh")
public class JayPath {

	private String stepPath;
	private String cookPath;

	public String getStepPath() {
		return stepPath;
	}

	public String getCookPath() {
		return cookPath;
	}

	public void setStepPath(String stepPath) {
		this.stepPath = stepPath;
	}

	public void setCookPath(String cookPath) {
		this.cookPath = cookPath;
	}

}
