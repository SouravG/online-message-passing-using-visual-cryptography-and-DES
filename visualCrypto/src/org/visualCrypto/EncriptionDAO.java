package org.visualCrypto;

import java.awt.image.BufferedImage;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;



/**
 * Servlet implementation class EncriptionDAO
 */
public class EncriptionDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public EncriptionDAO() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			//to get the content type information from JSP Request Header
			String contentType = request.getContentType();
			//here we are checking the content type is not equal to Null and as well as the passed data from mulitpart/form-data is greater than or equal to 0
			if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
		 		DataInputStream in = new DataInputStream(request.getInputStream());
				//we are taking the length of Content type data
				int formDataLength = request.getContentLength();
				byte dataBytes[] = new byte[formDataLength];
				int byteRead = 0;
				int totalBytesRead = 0;
				//this loop converting the uploaded file into byte code
				while (totalBytesRead < formDataLength) {
					byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
					totalBytesRead += byteRead;
					}

				String file = new String(dataBytes);
				//for saving the file name
				String saveFile = file.substring(file.indexOf("filename=\"") + 10);
				saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
				saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
				int lastIndex = contentType.lastIndexOf("=");
				String boundary = contentType.substring(lastIndex + 1,contentType.length());
				int pos;
				//extracting the index of file 
				pos = file.indexOf("filename=\"");
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;
				int boundaryLocation = file.indexOf(boundary, pos) - 4;
				int startPos = ((file.substring(0, pos)).getBytes()).length;
				int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

				// creating a new file with the same name and writing the content in new file
				FileOutputStream fileOut = new FileOutputStream("c:/images/source.png");
				fileOut.write(dataBytes, startPos, (endPos - startPos));
				fileOut.flush();
				fileOut.close();


			
				 RequestDispatcher rd=request.getRequestDispatcher("crypting.jsp");
				}
			File srcFile=new File("c:/images/source.png");
			BufferedImage imgFile;
			String result="encryption done";
				imgFile = ImageIO.read(srcFile);
				BufferedImage imgKey=Crypting.generateKey(imgFile.getWidth(),imgFile.getHeight());
				File outputKey=new File("c:/images/encr1.png");
				ImageIO.write(imgKey, "png", outputKey);
		///////////////////////////////////////////////////////////////////////
				BufferedImage imgSrc=Crypting.loadAndCheckSource(srcFile, imgKey.getWidth()/2, imgKey.getHeight()/2, true);
				
				if (imgSrc == null) {
					result="Image is not fit for encryption";				
				}			
				BufferedImage enrfile=Crypting.encryptImage(imgKey, imgSrc);
				File outputEncr=new File("c:/images/encr2.png");
				ImageIO.write(enrfile, "png", outputEncr);
				
				
				RequestDispatcher rd=request.getRequestDispatcher("crypting.jsp");
			//	out.println("<h3>"+result+"</h3>");
				//rd.include(request, response);
			
		




}}
