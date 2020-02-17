package ch14.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MyMailSender {
	public static boolean sendMail(String sender,
								   String receiver,
								   String subject,
								   String content) {
		try {
			InternetAddress senderAddress = new InternetAddress(sender);
			InternetAddress receiverAddress = new InternetAddress(receiver);
			
			// new HashMap<String, PhoneBook>
			// java.util.Properties - <String, String> 의 Map 타입
			Properties props = new Properties();
			props.put("mail.smtp.host", "localhost");
			// javax.mail.Session
			Session mailSession = Session.getDefaultInstance(props, null);
			// -> session -> 내장객체(session) 아님 (메일 서버 접속)
			
			MimeMessage message =  new MimeMessage(mailSession);
			message.setHeader("content-type", "text/html; charset=utf-8"); 
			message.setFrom(senderAddress);										// 보내는 사람
			message.addRecipient(Message.RecipientType.TO, receiverAddress);	// 받는 사람
			message.setSubject(subject);
			message.setContent(content, "text/html; charset=utf-8");
			message.setSentDate(new Date()); // java.util.Date
			
			// javax.mail.Transport
			Transport transport = mailSession.getTransport("smtp");
			transport.connect("localhost", null, null); // 호스트, 아이디, 비번
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
