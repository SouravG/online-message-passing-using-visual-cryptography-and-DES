package org.visualCrypto;

import java.io.File;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;



public class test1 {
public static void SendMail(String To, String toName, String fromUser, File File1, File File2, String key) throws MessagingException {

    String host = "smtp.gmail.com"; //change host here
    String Password = " pwd"; //change password here
    String from = "noreply.------------@gamil.com";//change email address here
String userID =""//change uid here
    String toAddress = To;
    File filename = File1;
    File filename1 = File2;
    // Get system properties
    Properties props = System.getProperties();
    props.put("mail.smtp.host", host);
    props.put("mail.smtps.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    Session session = Session.getDefaultInstance(props, new GMailAuthenticator(userID, Password));

    MimeMessage message = new MimeMessage(session);

    message.setFrom(new InternetAddress(from));

    message.setRecipients(Message.RecipientType.TO, toAddress);

    message.setSubject("Encrustation Encrypted Message.");

    BodyPart messageBodyPart = new MimeBodyPart();
    String fullMessage="Hello "+toName+"\n"+"\n"+"\n"+" I send you 2 encrypted images and a key"+"\n"+"\n"+"Key="+key+"\n"+"\n"+"Please login to your account and upload images with key to view my message"+"\n"+"Thank You."+"\n"+"From "+fromUser+"\n"+""+"\n"+""+"\n"+"From Encrustation.com Copyright © 2012 encrustation.com - All rights reserved "+"\n \n"+"This is a post-only mailing. Replies to this message are not monitored or answered.";       

    messageBodyPart.setText(fullMessage);

    Multipart multipart = new MimeMultipart();

    multipart.addBodyPart(messageBodyPart);

    messageBodyPart = new MimeBodyPart();

    DataSource source = new FileDataSource(filename);

    messageBodyPart.setDataHandler(new DataHandler(source));

    messageBodyPart.setFileName("1st Encrypted Image.png");

    multipart.addBodyPart(messageBodyPart);

    message.setContent(multipart);
    
    ///////////////////////////////////////////////////////////////
   

    messageBodyPart = new MimeBodyPart();

    DataSource source1 = new FileDataSource(filename1);

    messageBodyPart.setDataHandler(new DataHandler(source1));

    messageBodyPart.setFileName("2nd Encrypted Image.png");

    multipart.addBodyPart(messageBodyPart);

    message.setContent(multipart);
    

    try {
        Transport tr = session.getTransport("smtps");
        tr.connect(host, from, Password);
        tr.sendMessage(message, message.getAllRecipients());
        System.out.println("Mail Sent Successfully");
        tr.close();

    } catch (SendFailedException sfe) {

        System.out.println(sfe);
    }

}

public static void main(String[] args) throws MessagingException{
}

}
