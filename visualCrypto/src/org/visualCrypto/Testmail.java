package org.visualCrypto;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.*;
public class Testmail
{
public synchronized static void sendEmaih(String To, String toName, String fromUser, String File1, String File2, String key) throws Exception
{
    String host = "smtp.gmail.com";//host name
    String from = "noreply.encrustation@gamil.com";//sender id
    String to = To;//reciever id
    String pass = " gijocmtgpgxxpqhk ";//sender's password
    String fileAttachment = File1;
    String fileAttachment1 = File2;//file name for attachment
    //system properties
    System.out.println(to+fileAttachment+fileAttachment1+key+toName+fromUser);
    Properties prop = System.getProperties();
    // Setup mail server properties
    prop.put("mail.smtp.host", host);
    prop.put("mail.smtp.starttls.enable", "true");
    prop.put("mail.smtp.host", host);
    prop.put("mail.smtp.user", from);
    prop.put("mail.smtp.password", pass);
    prop.put("mail.smtp.port", "587");
    prop.put("mail.smtp.auth", "true");
    prop.put("mail.smtp.socketFactory.port", "465");
    prop.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
    prop.put("mail.smtp.socketFactory.fallback", false);
    prop.put("mail.smtp.debug", "true");
    //session
    Session session = Session.getInstance(prop, new GMailAuthenticator("noreply.encrustation", "  gijocmtgpgxxpqhk  "));
    session.setDebug(true);
    // Define message
    MimeMessage message = new MimeMessage(session);
    message.setFrom(new InternetAddress(from));
    message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
    message.setSubject("Encrustation secret images");
    // create the message part
    MimeBodyPart messageBodyPart = new MimeBodyPart();
    //message body
    String fullMessage="Hello "+toName+"\n"+"\n"+"\n"+" I send you 2 encrypted images and a key"+"\n"+"\n"+"Key="+key+"\n"+"\n"+"Please login to your account and upload images with key to view my message"+"\n"+"Thank You."+"\n"+"From "+fromUser+"\n"+""+"\n"+""+"\n"+"From Encrustation.com Copyright © 2012 encrustation.com - All rights reserved "+"\n \n"+"This is a post-only mailing. Replies to this message are not monitored or answered.";       
System.out.println(fullMessage);
    messageBodyPart.setText(fullMessage);
    Multipart multipart = new MimeMultipart();
    multipart.addBodyPart(messageBodyPart);
    //attachment
    messageBodyPart = new MimeBodyPart();
    DataSource source = new FileDataSource(fileAttachment);
    messageBodyPart.setDataHandler(new DataHandler(source));
    messageBodyPart.setFileName(fileAttachment);
    multipart.addBodyPart(messageBodyPart);
    message.setContent(multipart);
    
    messageBodyPart = new MimeBodyPart();
    DataSource source1 = new FileDataSource(fileAttachment1);
    messageBodyPart.setDataHandler(new DataHandler(source1));
    messageBodyPart.setFileName(fileAttachment);
    multipart.addBodyPart(messageBodyPart);
    message.setContent(multipart);
    //send message to reciever
    Transport transport = session.getTransport("smtp");
    transport.connect(host, from, pass);
    transport.sendMessage(message, message.getAllRecipients());
    transport.close();
}
}