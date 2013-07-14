package org.visualCrypto;

import javax.mail.*;
import javax.mail.internet.*;

import java.util.*;
 
public class SendMailExample
{
 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////        
    public static void mail(String email,String message,String username)
    {
    
                String[] to={email};
       String fullMessage="Hello "+username+"\n"+"\n"+"\n"+"Your Activation code is= "+message+" "+"\n"+"\n"+"You can login to your account. Paste the Activation code in the login page"+"\n"+"Thank You."+"\n"+"The Encrustation Team."+"\n"+""+"\n"+""+"\n"+"from Encrustation.com Copyright © 2012 encrustation.com - All rights reserved "+"\n \n"+"This is a post-only mailing. Replies to this message are not monitored or answered. ";       
                //This is for google
                        SendMailExample.sendMail("noreply.encrustation@gamil.com"," gijocmtgpgxxpqhk ","smtp.gmail.com","465","true","true",true,"javax.net.ssl.SSLSocketFactory","false",to,"Encrustation Account Activition Code",fullMessage);             
    }
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public static void sendPassword(String email,String password ,String username)
    {
    
                String[] to={email};
       String fullMessage="Hello "+username+"\n"+"\n"+"\n"+"Your Password is=  "+password+" "+"\n"+"\n"+"You can login to your account. Use this Password in the login page"+"\n"+"Thank You."+"\n"+"The Encrustation Team."+"\n"+""+"\n"+""+"\n"+"From Encrustation.com Copyright © 2012 encrustation.com - All rights reserved   "+"\n \n"+"This is a post-only mailing. Replies to this message are not monitored or answered.  ";       
                //This is for google
                        SendMailExample.sendMail("noreply.encrustation@gamil.com"," gijocmtgpgxxpqhk ","smtp.gmail.com","465","true","true",true,"javax.net.ssl.SSLSocketFactory","false",to,"Encrustation Account Password Recovery",fullMessage);             
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public static void changeLoginConfirmationEmail(String email ,String username,String ipAddr,String Os,String Country,String Browser)
    {
    
                String[] to={email};
       String fullMessage="Hi "+username+"\n"+"\n"+"\n"+"We detected a login into your account from an unrecognized device "+"\n The client description is\n\n"+"IP Address : "+ipAddr+"\n Browser : "+Browser+"\n Operating System : "+Os+"\n Country : "+Country+"\n \n If this was you, please disregard this email.\n If this wasn't you, please change your password, as someone else may be accessing it.\n \n Thank You."+"\n"+"The Encrustation Team."+"\n"+""+"\n"+""+"\n"+"From Encrustation.com Copyright © 2012 encrustation.com - All rights reserved   "+"\n \n"+"This is a post-only mailing. Replies to this message are not monitored or answered.  ";       
                //This is for google
                        SendMailExample.sendMail("noreply.encrustation@gamil.com"," gijocmtgpgxxpqhk ","smtp.gmail.com","465","true","true",true,"javax.net.ssl.SSLSocketFactory","false",to,"Encrustation login from an unknown device",fullMessage);             
    }  
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
        public synchronized static boolean sendMail(String userName,String passWord,String host,String port,String starttls,String auth,boolean debug,String socketFactoryClass,String fallback,String[] to,String subject,String text){
                Properties props = new Properties();
                //Properties props=System.getProperties();
     
        props.put("mail.smtp.host", host);
                if(!"".equals(port))
        props.put("mail.smtp.port", port);
                if(!"".equals(starttls))
        props.put("mail.smtp.starttls.enable",starttls);
        props.put("mail.smtp.auth", auth);
                if(debug){
                props.put("mail.smtp.debug", "true");
                }else{
                props.put("mail.smtp.debug", "false");         
                }
                if(!"".equals(port))
        props.put("mail.smtp.socketFactory.port", port);
                if(!"".equals(socketFactoryClass))
        props.put("mail.smtp.socketFactory.class",socketFactoryClass);
                if(!"".equals(fallback))
        props.put("mail.smtp.socketFactory.fallback", fallback);
 
        try
        {
                        Session session = Session.getDefaultInstance(props, new GMailAuthenticator("noreply.encrustation", "  gijocmtgpgxxpqhk  "));
            session.setDebug(debug);
            MimeMessage msg = new MimeMessage(session);
            msg.setText(text);
           
            msg.setSubject(subject);
            msg.setFrom(new InternetAddress("noreply.encrustation@gmail.com"));
                        for(int i=0;i<to.length;i++){
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to[i]));
                        }
                      
            msg.saveChanges();
                        Transport transport = session.getTransport("smtp");
                        transport.connect(host, userName, passWord);
                        transport.sendMessage(msg, msg.getAllRecipients());
                        transport.close();
                        return true;
        }
        catch (Exception mex)
        {
            mex.printStackTrace();
                        return false;
        }
        }
 
}





class GMailAuthenticator extends Authenticator {
     String user;
     String pw;
     public GMailAuthenticator (String username, String password)
     {
        super();
        this.user = username;
        this.pw = password;
     }
    public PasswordAuthentication getPasswordAuthentication()
    {
       return new PasswordAuthentication(user, pw);
    }
}