package com.naver.myhome4.domain;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix="commu")
                /*application.properties에서 설정한 내용중 my로 시작하는 키에 대한 값을 필드에 주입한다.
                 * my.savefolder=c:/upload/
                   my.sendfile=C:/Users/AREUM/Desktop/image/11.png
                 */
public class MySaveFolder2 {
	 private String savepath;
	
	 
	public String getSavepath() {
		return savepath;
	}
	public void setSavepath(String savepath) {
		this.savepath = savepath;
	}
	

}
