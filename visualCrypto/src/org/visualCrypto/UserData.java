package org.visualCrypto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class UserData {
String name,password,email;
int phone;
public static void saveUserData(String name, String password, String dob, String sex, String country, String email, int phone) {
	
	PreparedStatement pstmt=null;
	Connection con=null;
	try {
		con=DatabaseUtil.getConnection();
	String qr="insert into userData(uno,name,password,dob,sex,country,email,phone,active) values(?,?,?,?,?,?,?,?,?)";
		pstmt=con.prepareStatement(qr,PreparedStatement.RETURN_GENERATED_KEYS);
		pstmt.setString(1, GenerateUUID_Bean.getUnoByUUID());
		pstmt.setString(2, name);
		pstmt.setString(3, password);
		pstmt.setString(4, dob);
		pstmt.setString(5, sex);
		pstmt.setString(6, country);
		pstmt.setString(7, email);
		pstmt.setInt(8, phone);
		pstmt.setString(9, "not active");
		pstmt.executeUpdate();
		 
}catch (Exception e) {
	// TODO: handle exception
}
finally{
	try{
	pstmt.close();
	con.close();
	}
	catch (Exception e) {
		
	}
}	
}
public static String getAccStatus(String email, String password) {
	Connection con=null;
	PreparedStatement pstmt= null;
	ResultSet rs=null;
	String status="Sorry!!No account found, please Sign Up";
	try{
		con=DatabaseUtil.getConnection();
		String query = "select active from userData where email=? and password = ?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, email);
		pstmt.setString(2, password);
		rs=pstmt.executeQuery();
		if(rs.next()){
			 status=rs.getString(1);
			 	
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return status;
	
}
public static boolean updateAccStatus(String accountNo,String email) {
	Connection con=null;
	PreparedStatement pstmt= null;
	String uno=(accountNo);
	boolean status=false;
	try{
		con=DatabaseUtil.getConnection();
		String query = "update userData set active='active' where uno=? and email=?";
		//String query = "select active from userData where name=? and password = ?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, uno);
		pstmt.setString(2, email);
		int updateno=pstmt.executeUpdate();
		if(updateno==1){
			status=true;
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return status;
	
}
public static String getEmail(String email, String password) {
	Connection con=null;
	PreparedStatement pstmt= null;
	ResultSet rs=null;
	String UserName="Sorry!!No user found, please Sign Up";
	try{
		con=DatabaseUtil.getConnection();
		String query = "select email from userData where email=? and password = ?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, email);
		pstmt.setString(2, password);
		rs=pstmt.executeQuery();
		if(rs.next()){
			UserName=rs.getString(1);
			 	
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return UserName;
}
public static String checkEmail(String email) {
	Connection con=null;
	PreparedStatement pstmt= null;
	ResultSet rs=null;
	String Email="No email found";
	try{
		con=DatabaseUtil.getConnection();
		String query = "select email from userData where email=?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, email);
		rs=pstmt.executeQuery();
		if(rs.next()){
			Email=rs.getString(1);
			 	
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return Email;
}


public static String checkUser(String user) {
	Connection con=null;
	PreparedStatement pstmt= null;
	ResultSet rs=null;
	String user1="No user found";
	try{
		con=DatabaseUtil.getConnection();
		String query = "select name from userData where name=?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, user);
		rs=pstmt.executeQuery();
		if(rs.next()){
			user1=rs.getString(1);
			 	
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return user1;
}
public static String getUserNoByEmail(String email) {
	Connection con=null;
	PreparedStatement pstmt= null;
	ResultSet rs=null;
	String userno=null;
	try{
		con=DatabaseUtil.getConnection();
		String query = "select uno from userData where email=?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, email);
		rs=pstmt.executeQuery();
		if(rs.next()){
			userno=rs.getString(1);
			 	
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return userno;
}
////////////////////////////////////////////////////////////////////////////////////////////////////////
public static RecoveryPassBean getUserPasswordAndName(String email) {
	Connection con=null;
	PreparedStatement pstmt= null;
	ResultSet rs=null;
	
	RecoveryPassBean recov=null;
	try{
		con=DatabaseUtil.getConnection();
		String query = "select name,password from userData where email=?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, email);
		rs=pstmt.executeQuery();
		if(rs.next()){
		recov=new RecoveryPassBean();
			recov.setUsername(rs.getString(1));
			recov.setPassword(rs.getString(2));
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return recov;
}
public static String getUserNameFromEmail(String email) {
	Connection con=null;
	PreparedStatement pstmt= null;
	ResultSet rs=null;
	String UserName="Sorry!!No user found, please Sign Up";
	try{
		con=DatabaseUtil.getConnection();
		String query = "select name from userData where email=?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, email);
		
		rs=pstmt.executeQuery();
		if(rs.next()){
			UserName=rs.getString(1);
			 	
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return UserName;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
public static String getPasswordFromUserName(String username) {
	Connection con=null;
	PreparedStatement pstmt= null;
	ResultSet rs=null;
	String password=null;
	try{
		con=DatabaseUtil.getConnection();
		String query = "select passwor from userData where name=?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, username);
		
		rs=pstmt.executeQuery();
		if(rs.next()){
			password=rs.getString(1);
			 	
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return password;
}
public static RetriveByUnoBean getEmailAndPasswordByUno(String uno) {
	Connection con=null;
	PreparedStatement pstmt= null;
	ResultSet rs=null;
	
	RetriveByUnoBean retrv=null;
	try{
		con=DatabaseUtil.getConnection();
		String query = "select email,password from userData where uno=?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, uno);
		rs=pstmt.executeQuery();
		if(rs.next()){
		retrv=new RetriveByUnoBean();
			retrv.setEmail(rs.getString(1));
			retrv.setPassword(rs.getString(2));
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return retrv;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
public static String getUserNoByEmailAndPassword(String email,String pwd) {
	Connection con=null;
	PreparedStatement pstmt= null;
	ResultSet rs=null;
	String userno=null;
	try{
		con=DatabaseUtil.getConnection();
		String query = "select uno from userData where email=? and password = ?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, email);
		pstmt.setString(2, pwd);
		rs=pstmt.executeQuery();
		if(rs.next()){
			userno=rs.getString(1);
			 	
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return userno;
}
public static boolean updatePassword(String email,String oldPassword,String newPassword) {
	Connection con=null;
	PreparedStatement pstmt= null;
	
	boolean status=false;
	try{
		con=DatabaseUtil.getConnection();
		String query = "update userData set password=? where email=? and password = ?";
		//String query = "select active from userData where name=? and password = ?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, newPassword);
		pstmt.setString(2, email);
		pstmt.setString(3, oldPassword);
		int updateno=pstmt.executeUpdate();
		if(updateno==1){
			status=true;
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return status;
	
}
public static boolean updateDOB(String email,String dob,String Password) {
	Connection con=null;
	PreparedStatement pstmt= null;
	
	boolean status=false;
	try{
		con=DatabaseUtil.getConnection();
		String query = "update userData set dob=? where email=? and password = ?";
		//String query = "select active from userData where name=? and password = ?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, dob);
		pstmt.setString(2, email);
		pstmt.setString(3, Password);
		int updateno=pstmt.executeUpdate();
		if(updateno==1){
			status=true;
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return status;
	
}


////////////////////////////////////////////////////////////////////////////////////////////////////
public static boolean updateName(String email,String name,String Password) {
	Connection con=null;
	PreparedStatement pstmt= null;
	
	boolean status=false;
	try{
		con=DatabaseUtil.getConnection();
		String query = "update userData set name=? where email=? and password = ?";
		//String query = "select active from userData where name=? and password = ?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setString(3, Password);
		int updateno=pstmt.executeUpdate();
		if(updateno==1){
			status=true;
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return status;
	
}
public static boolean updateCountry(String email,String country,String Password) {
	Connection con=null;
	PreparedStatement pstmt= null;
	
	boolean status=false;
	try{
		con=DatabaseUtil.getConnection();
		String query = "update userData set country=? where email=? and password = ?";
		//String query = "select active from userData where name=? and password = ?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, country);
		pstmt.setString(2, email);
		pstmt.setString(3, Password);
		int updateno=pstmt.executeUpdate();
		if(updateno==1){
			status=true;
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return status;
	
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
public static boolean updateUnoByEmail(String email) {
	Connection con=null;
	PreparedStatement pstmt= null;
	
	boolean status=false;
	try{
		con=DatabaseUtil.getConnection();
		String query = "update userData set uno=? where email=?";
		//String query = "select active from userData where name=? and password = ?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1, GenerateUUID_Bean.getUnoByUUID());
		pstmt.setString(2, email);
	
		int updateno=pstmt.executeUpdate();
		if(updateno==1){
			status=true;
		}
		
	}
	catch (Exception e) {

		System.out.println("Unable to load the driver");
	
	}
	finally{
		try{
			
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	return status;
	
}


}
