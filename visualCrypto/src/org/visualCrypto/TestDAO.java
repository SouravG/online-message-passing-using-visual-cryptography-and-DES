package org.visualCrypto;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.File;
import java.util.List;
import java.util.Iterator;
/**
 * Servlet implementation class TestDAO
 */
public class TestDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestDAO() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	   
		        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		 
		        if (isMultipart) {
		            FileItemFactory factory = new DiskFileItemFactory();
		            ServletFileUpload upload = new ServletFileUpload(factory);
		 
		            try {
		                List items = upload.parseRequest(request);
		                Iterator iterator = items.iterator();
		                while (iterator.hasNext()) {
		                    FileItem item = (FileItem) iterator.next();
		 
		                    if (!item.isFormField()) {
		                        String fileName = item.getName();
		 
		                        String root = getServletContext().getRealPath("/");
		                        File path = new File(root + "/uploads");
		                        if (!path.exists()) {
		                            boolean status = path.mkdirs();
		                        }
		  
		                        File uploadedFile = new File("f:" + "/" + fileName);
		                        System.out.println(uploadedFile.getAbsolutePath());
		                        item.write(uploadedFile);
		                    }
		                }
		            } catch (FileUploadException e) {
		                e.printStackTrace();
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		        }
		    
		
		
		
	}

}
