package org.visualCrypto;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.SecretKey;

public class DES_EncryptAndDecrypt {
	public static SecretKey imageEcryp(SecretKey key , String path, String outputPath)throws Exception {
		//---------------------Encription code----------------------------------------------------------------------  
		    	
		    	
		    	Cipher cipher=Cipher.getInstance("DES");
	
		    	cipher.init(Cipher.ENCRYPT_MODE, key);
		    	CipherInputStream cipherIn=new CipherInputStream(new FileInputStream(new File(path)), cipher);
		    	FileOutputStream fos=new FileOutputStream(new File(outputPath));
		    	int i;
		    	while((i=cipherIn.read())!=-1){
		    	fos.write(i);
		    	}
		    	
		    	return key;
		    }
	
	public static void imageDecrip(SecretKey key1 , String path, String outputPath)throws Exception {
	
		
		Cipher cipher=Cipher.getInstance("DES");
	cipher.init(Cipher.DECRYPT_MODE, key1);
	CipherInputStream cipherIn1=new CipherInputStream(new FileInputStream(new File(path)), cipher);
	FileOutputStream fos1=new FileOutputStream(new File(outputPath));
	int j;
	while((j=cipherIn1.read())!=-1){
	fos1.write(j);
	}
}
	
}
