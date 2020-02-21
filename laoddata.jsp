<%@ page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*,java.security.MessageDigest"%>
<%@ page import="java.security.NoSuchAlgorithmException,java.security.SecureRandom"%>

<%

String fil=request.getParameter("filep");
String sk=request.getParameter("seckey");
	File file = new File("G://"+fil);
	String s=""+file.lastModified();	
//	out.println("Before Format : " + file.lastModified());
  //  	out.println("\n\n file path : " + s);
 String h1skey="",hskey=s+sk;
 
  try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] bytes = md.digest(hskey.getBytes());
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            h1skey = sb.toString();
        }
        catch(NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
 //out.println("\n\nhashed : "+h1skey);
 
 // CODE FOR FILING THE DATA
	
	BufferedWriter fs=new BufferedWriter(new FileWriter("G:/hashed.txt",false));

	fs.write(h1skey);

	fs.flush();

	fs.close();

%>

<html>
<head>
<title>SKERA</title>
</head>
<body>
<table border="0" width="100%" height="100%" bgcolor="#FEF0C9">
<tr align="center" height="15%" bgcolor="#7755C9">
<td colspan="3"><h1>STRONG KEY ORIENTATION FLEXIBLE AUDITING FOR SECURE CLOUD STORAGE</h1></td></tr>
<tr><td width="25%"></td>
<td width="*" align="center">
KEY IS SUCCESSFULLY UPLOADED TO THE TPA.
</td>
<td width="25%"></td></tr>
<tr align="center" height="15%" bgcolor="#7755C9">
<td colspan="3"><h1>&nbsp;</h1></td></tr></table>
</body>
</html>
<%

	RequestDispatcher rd=null;
	rd=request.getRequestDispatcher("/index.html");
	rd.forward(request,response);

%>

