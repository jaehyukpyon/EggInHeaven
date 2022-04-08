package com.naver.myhome4.task;

import java.io.File;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

import com.naver.myhome4.domain.MailVO;
import com.naver.myhome4.domain.MySaveFolder;

@Component
public class SendMail {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private MySaveFolder mysavefolder;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SendMail.class);
	
	public void sendMail(MailVO vo) {
		
		String sendfile = mysavefolder.getSendfile();
		
		MimeMessagePreparator mPreparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				/*
				 * MimeMessage: 이 클래스의 MIME 스타일 이메일 메시지를 나타낸다.
				 * MIME (Multipurpose Internet Mail Extensions)는 
				 * 전자 우편을 위한 인터넷 표준 포멧
				 */
				
				/*
				 * MimeMessageHelper를 이요하면 첨부 파일이나 특수 문자 인코딩으로 작업할 때 전달된
				 *  MimeMessage를 채우는 데 편리.
				 */
				
				// 두 번째 인자 true는 멀티 파트 메시지를 사용하겠다는 의미
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(vo.getForm());
				helper.setTo(vo.getTo());
				helper.setSubject(vo.getSubject());
				
				/*
				 * 1. 문자로만 전송하는 경우 두 번째 인자는 html을 사용하겠다는 뜻
				 * helper.setText(vo.getContent(), true);
				 * 
				 * 2. 이미지를 내장해서 보내는 경우
				 * cid(content id)
				 */
				String content = "<img src='cid:Home' />" + vo.getContent();
				helper.setText(content, true);
				
				FileSystemResource file = new FileSystemResource(new File(sendfile));
				
				// addInline 메서드의 첫 번째 메서드에는 cid(content id)를 지정.
				helper.addInline("Home", file);
				
				// 3. 파일을 첨부해서 보내는 경우
				// 첫 번째 인자: 첨부될 파일의 이름
				// 두 번째 인자: 첨부파일
				helper.addAttachment("congratulations.png", file);
			
			}
		};
		
		mailSender.send(mPreparator);
		LOGGER.info("메일을 전송했습니다.");		
	}

}
