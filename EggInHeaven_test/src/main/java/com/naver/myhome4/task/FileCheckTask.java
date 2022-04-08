package com.naver.myhome4.task;



import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.naver.myhome4.domain.MySaveFolder;
import com.naver.myhome4.service.CommunityService;

@Service
@EnableScheduling // 아래의 클래스를 스케줄링 목적으로 사용하겠다고 명시합니다. @Configuration과 같이 사용해야합니다.
@Configuration	// 이 어노테이션을 사용하지않으면 스케줄링이 동작하지 않습니다.
public class FileCheckTask {

	
	private static final Logger logger = LoggerFactory.getLogger(FileCheckTask.class);
	

	@Autowired
	private MySaveFolder mysavefolder2;
	
	@Autowired
	private CommunityService communityService;
	

	// cron 사용법
	// seconds(초:0~59) minutes(분0~59) hours(시: 0~23) day(일:1~31)
	// months(달:1~12) day of week(요일:0~6) year(optional)
	//				           초  분  시  일  달  요일 
	//@Scheduled(cron = "0 35 * * * *")
	@Scheduled(cron = "0 41 * * * *")
	public void checkFiles() throws Exception {
		String saveFolder = mysavefolder2.getSavefolder();
	
		logger.info("CheckFiles");
		List<String> deleteFileList = communityService.getDeleteFileList();
		// for(String filename : deleteFileList) {
		for(int i = 0; i < deleteFileList.size(); i++) {
			String filename = deleteFileList.get(i);
			File file = new File(saveFolder + filename);
			if(file.exists()) {
				if(file.delete()) {
				logger.info(file.getPath() + " 삭제 되었습니다.");
				communityService.deleteFileList(filename);
			}
			
		} else {
			logger.info(file.getPath() + " 파일이 존재하지 않습니다.");
		}
		
	}
}

	
}
