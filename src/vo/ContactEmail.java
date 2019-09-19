package vo;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class ContactEmail {

    public void send(String subject, String name, String body, String email) {

        final String username = "rootLake12";
        final String password = "Lakeroot12";
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
            message.setFrom(new InternetAddress("eudstage@edustage.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse("rnjs8657@naver.com")
            );
            message.setSubject(subject);
            message.setText("이름 : " + name + "\n" + "보낸 사람 : "+ email + "\n" + "본문 : "+body);

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}
