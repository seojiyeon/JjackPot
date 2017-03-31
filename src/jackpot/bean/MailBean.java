package jackpot.bean;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jackpot.mail.SMTPAuthenticator;

@Controller
public class MailBean {
	@RequestMapping("/sendMail.jp")
	public String sendMail() {
		
		return "/mail/sendMail";
	}
	
	@RequestMapping("/sendMailPro.jp")
	public String sendMailPro(HttpServletRequest request) {
		// 파라미터 받아오기 - DI를 이용하면 삭제 가능
		String mail_send = request.getParameter("mail_send");
		String mail_rec = request.getParameter("mail_rec");
		String mail_title = request.getParameter("mail_title");
		String mail_content = request.getParameter("mail_content");
		
		//메일 발송을 위한 정보 설정
		
		Properties p = new Properties(); // 정보를 담기위한 객체
		
		//SMTP 서버의 계정 설정
		//네이버인 경우 네이버 아이디, 구글인 경우 메일 주소 설정
		p.put("mail.smtp.user", "minyk1102@gmail.com");
		
		//SMTP 서버 정보 설정
		// 네이버일 경우 smtp.naver.com, 구글일 경우 smtp.gmail.com
		p.put("mail.smtp.host", "smtp.gmail.com");
		
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try {
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(p, auth);
			
			// 메일을 전송할때 상세한 상황을 콘솔에 출력
			session.setDebug(true);
			
			// 메일의 내용을 담기 위한 객체
			MimeMessage msg = new MimeMessage(session);
			
			// 제목 설정
			msg.setSubject(mail_title);
			
			// 보내는 사람의 메일주소
			Address fromAddr = new InternetAddress(mail_send);
			msg.setFrom(fromAddr);
			
			// 받는 사람의 메일주소
			Address toAddr = new InternetAddress(mail_rec);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			
			
			// 메시지 본문의 내용과 형식, 캐릭터 셋 설정
			msg.setContent(mail_content, "text/html;charset=UTF-8");
			
			
			// 발송하기
			Transport.send(msg);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "/mail/sendMailPro";
	}
}