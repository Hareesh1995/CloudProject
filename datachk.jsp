<%@ page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*,java.security.MessageDigest"%>
<%@ page import="java.security.NoSuchAlgorithmException,java.security.SecureRandom"%>

<%

String filv=request.getParameter("filevp");
String skv=request.getParameter("secvkey");
String hshver=request.getParameter("vfkey");
	File file = new File("G://"+filv);
	String sv=""+file.lastModified();	
//	out.println("Before Format : " + file.lastModified());
  //  	out.println("\n\n file path : " + s);
 String h2skey=null,hskeys=sv+skv;
 
  try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] bytes = md.digest(hskeys.getBytes());
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            h2skey = sb.toString();
        }
        catch(NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
//out.println("\n\nhashed : "+h2skey);
//out.println("\n\nhshver : "+hshver);

%>

<html>
<head>
<title>SKERA</title>
<link rel="stylesheet" type="text/css" href="styl.css">
</head>
<body>
<table border="0" width="100%" height="100%" bgcolor="#FEF0C9">
<tr align="center" height="15%" bgcolor="#7755C9">
<td colspan="3"><h1>STRONG KEY ORIENTATION FLEXIBLE AUDITING FOR SECURE CLOUD STORAGE</h1></td></tr>
<tr><td width="25%"></td>
<td width="*" align="center">
<%
 
 if(h2skey.equals(hshver))
 {
	 out.println("The file is Good and not modified"); 
 }
else
{
out.println("The file can not trusted and may have been modified");	
}	

%>
</td>
<td width="25%"></td></tr>
<tr align="center" height="15%" bgcolor="#7755C9">
<td colspan="3"><h1>&nbsp;</h1></td></tr></table>
</body>
</html>

 