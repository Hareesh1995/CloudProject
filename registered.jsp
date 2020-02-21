<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,java.security.SecureRandom,java.security.Security,java.security.KeyFactory,java.security.spec.X509EncodedKeySpec,java.security.PublicKey,java.security.PrivateKey,javax.crypto.SecretKey,javax.crypto.spec.SecretKeySpec,java.security.spec.PKCS8EncodedKeySpec,java.util.Base64,java.io.*,javax.crypto.Cipher"%>

<%

    Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
    SecureRandom random = new SecureRandom();
    KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");

    generator.initialize(1024, random);

    KeyPair pair = generator.generateKeyPair();
    PublicKey pubKey = pair.getPublic();
    PrivateKey privKey = pair.getPrivate();
	
	
    // FOR ENCRYPTION
	// Converting the keys to strings  and_ again strings to keys format
				byte encoded[] = pubKey.getEncoded();
				String encodedKey = Base64.getEncoder().encodeToString(encoded);
	
// FOR DECRYPTION 
  
  byte encodedp[] = privKey.getEncoded();
  String encodedpKey = Base64.getEncoder().encodeToString(encodedp);
				
%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="styl.css">
<title>SKERA</title>
</head>
<body>
<table border="0" width="100%" height="100%" bgcolor="#FEF0C9">
<tr align="center" height="15%" bgcolor="#7755C9">
<td><h1>STRONG KEY ORIENTATION FLEXIBLE AUDITING FOR SECURE CLOUD STORAGE</h1></td></tr>
<tr><td width="50%" align="center">

<table  border="0" width="70%" align="center">
<tr><td><h3>You are registered user. Your keys are</h3></td></tr>
<tr><td width="100%"><b>Sender KEY </b></td></tr>
<tr><td><% out.println(encodedKey); %></td></tr>
<tr><td width="100%"><b>TPA KEY</b></td></tr>
<tr><td><% out.println(encodedpKey); %></td></tr>
<tr><td><b>Your Secret key is : </b></td></tr><tr>
<td><b><% out.println(session.getAttribute("seccod").toString()); %></b></td></tr>
<tr><td>Keep them secure.<br/><a href="index.html">CONTINUE</a></td></tr>
</table>
    </td></tr>
<tr align="center" height="15%" bgcolor="#7755C9">
<td><h1>&nbsp;</h1></td></tr></table>
</body>
</html>