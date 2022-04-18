package com.naver.myhome4.domain;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "profile")
public class ProfileSaveFolder {
	private String profilesavepath;
	private String profilesavefolder;
	
	
	public String getProfilesavepath() {
		return profilesavepath;
	}
	public void setProfilesavepath(String profilesavepath) {
		this.profilesavepath = profilesavepath;
	}
	public String getProfilesavefolder() {
		return profilesavefolder;
	}
	public void setProfilesavefolder(String profilesavefolder) {
		this.profilesavefolder = profilesavefolder;
	}
	
	
	
}
