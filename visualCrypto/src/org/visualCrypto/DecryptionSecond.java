package org.visualCrypto;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class DecryptionSecond
 */
public class DecryptionSecond extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DecryptionSecond() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd=null;
		HttpSession hs=request.getSession();
		String user=(String) hs.getAttribute("name");
		
		//String key ="";
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////--------CHANGE SERVER IMAGE PATH HERE--------//////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
String serverPath="F:/JEE/workspace/visualCrypto/WebContent/userImages"+user;//////////////////
//////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			 if (!isMultipart) {
			 } else {
				   FileItemFactory factory = new DiskFileItemFactory();
				   ServletFileUpload upload = new ServletFileUpload(factory);
				   List items = null;
				   try {
					   items = upload.parseRequest(request);
				   } catch (FileUploadException e) {
					   e.printStackTrace();
				   }
				   Iterator itr = items.iterator();
				 //  int count=0;
				   while (itr.hasNext()) {
				   FileItem item = (FileItem) itr.next();
				  // count++;
				   if (item.isFormField()) {
					  // String name = item.getFieldName();
		             //  String value = item.getString();
		             //  if(name.equals("key"))
		             //   {
		             //           key=value;
		              //        
		               //         }

					   
					   
					   
				   } else {
					   try {
						   String itemName = serverPath+"/decr2.png";
						    
						   File savedFile = new File(itemName);
						   item.write(savedFile); 
					   } catch (Exception e) {
						   e.printStackTrace();
					   }
				   }
				   }
			   }	

		//rd=request.getRequestDispatcher("decrypting.jsp?name="+user);
		//request.setAttribute("key", "Image Decrypted");
		
		//rd.include(request, response);
		

		//	rd=request.getRequestDispatcher("decrypting.jsp?name="+user);
		//	request.setAttribute("key", "Key not found Image not Decrypted");
		//	rd.include(request, response);
			
		
		
	

	}

}
