package action.notice;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import vo.ActionForward;

public class ContactEmailAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String email = request.getParameter("email");
		String body = request.getParameter("message");
		
		final String username = "rootLake12"; //구글 아이디 
        final String password = "Lakeroot12"; //구글 비밀번호 
        Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        
        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("eudstage12@edustage.com")); 
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse("rnjs8657@naver.com") // 이메일을 받을 주소 입력. Ex.상담 담당자 이메일 주소.
            );
            message.setSubject(subject);
            message.setText("이름 : " + name + "\n" + "보낸 사람 : "+ email + "\n" + "본문 : "+body);

            Transport.send(message);

            System.out.println("Done");
            
            response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
            out.println("<script>");
			out.println("alert('이메일 발송 완료')");
			out.println("</script>");
			
			
			forward.setPath("contactSuccess.jsp");
			forward.setRedirect(false);
        } catch (MessagingException e) {
            e.printStackTrace();
            
        }
		
		return forward;
	}
}
