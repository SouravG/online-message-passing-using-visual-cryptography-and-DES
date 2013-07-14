package org.visualCrypto;
import java.io.File;
import java.io.FileInputStream;
//import java.io.IOException;
import java.io.InputStream;
import java.math.*;
import java.security.*;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;

import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
public class Keygen {

	/**
	 * @param args
	 */
	public static String key(File message){
		// TODO Auto-generated method stub
		//Connection con=null;
		//PreparedStatement pstmt= null;
		String keyword="Error!!Key Not Stored";
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			
			InputStream is = new FileInputStream(message);                
			byte[] buffer = new byte[8192];
			int read = 0;
			try {
			    while( (read = is.read(buffer)) > 0) {
			        digest.update(buffer, 0, read);
			    }       
			    byte[] md5sum = digest.digest();
			    BigInteger bigInt = new BigInteger(1, md5sum);
			    keyword = bigInt.toString(30);
			   
		/*    con=DatabaseUtil.getConnection();
			String qr="insert into keyData(message,keyword) values(?,?)";
				pstmt=con.prepareStatement(qr,PreparedStatement.RETURN_GENERATED_KEYS);
				pstmt.setString(1, "");
				pstmt.setString(2, keyword);
				pstmt.executeUpdate();
		    return keyword; 
	    }
	    catch(IOException e) {
	        throw new RuntimeException("Unable to process file for MD5", e);
	    }
	    finally {
	        try {
	            is.close();
	        }
	        catch(IOException e) {
	            throw new RuntimeException("Unable to close input stream for MD5 calculation", e);
	        }
	    } */     	
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
			catch (Exception e) {
				
			}
									
return keyword;
}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
public static SecretKey generateKey(String key)throws Exception{
    	
    	
    	//KeyGenerator keyGen=KeyGenerator.getInstance("DES");
    	//Key key=keyGen.generateKey();
    	//String key = "blahasdasdasdasdasdfasdasdasdasda";
        DESKeySpec dks = new DESKeySpec(key.getBytes());
        SecretKeyFactory skf = SecretKeyFactory.getInstance("DES");
        SecretKey desKey = skf.generateSecret(dks);
       
		return desKey;
    }

}