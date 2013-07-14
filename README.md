online-message-passing-using-visual-cryptography-and-DES
========================================================

how to run:

steps

1. create a schema in mysql.

2. import userdata.sql file to the schema.

3. change database url,username,password in src/org/visualCrypto/DatabaseUtil.java file.

4. copy the full path of the \visualCrypto\WebContent\userImages  folder.

5. using this path update file11 and file22 variables in src/org/visualCrypto/EmailTheImages.java file.

eg.


String file11="paste_here/visualCrypto/WebContent/userImages/"+fromUserEmail+"/encr1.png";

String file22="paste_here/visualCrypto/WebContent/userImages/"+fromUserEmail+"/encr2.png";


6. again paste the path in serverPath variable in src/org/visualCrypto/DecryptionSecond.java file and \visualCrypto\WebContent\test2.jsp
eg.

 in  DecryptionSecond.java 

String serverPath="paste_here/visualCrypto/WebContent/userImages"+user;


in  test2.jsp file

String serverPath="paste_here/visualCrypto/WebContent/userImages/"+email;


paste that in appropriate place , do not add spaces ..


7.change email host,port,userid,password in src/org/visualCrypto/test1.java file and in src/org/visualCrypto/SendMailExample.java file

8.run in a web server .
