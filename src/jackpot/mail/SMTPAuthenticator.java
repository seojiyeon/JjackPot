package jackpot.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/*
 * SMTP 서버에 로그인하기 위한 인증정보를 담고 있는 클래스 
 */
public class SMTPAuthenticator extends Authenticator {
	public PasswordAuthentication getPasswordAuthentication() {
		/*
		 * Gmail 혹은 네이버 이메일 이용 가능.
		 * Gmail의 경우 아이디만 입력하면 된다.
		 */
		return new PasswordAuthentication("minyk1102", "kk753951!!");
	}
}
