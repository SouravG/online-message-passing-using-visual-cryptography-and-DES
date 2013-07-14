package org.visualCrypto;



import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
public static Connection getConnection() throws Exception{
	
//this static method use for building mysql database connection
	String driverName="com.mysql.jdbc.Driver";
	Class.forName(driverName);
	String url="jdbc:mysql://127.12.133.131:3306/crypto";
	String uid="root";
	String pwd="java";
	Connection con = DriverManager.getConnection(url, uid, pwd);
	return con;
}

}
