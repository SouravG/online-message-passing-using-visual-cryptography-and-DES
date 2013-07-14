package org.visualCrypto;

import java.util.UUID;

public class GenerateUUID_Bean {
public static String getUnoByUUID(){
	String uno=null;
	uno=UUID.randomUUID().toString();
	System.out.println(uno+"\2 hello world!\2");
	return uno;
}
public static void main(String[] args) {
GenerateUUID_Bean.getUnoByUUID();	
}
}
