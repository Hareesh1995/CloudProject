
<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,java.security.SecureRandom,java.security.Security,java.security.KeyFactory,java.security.spec.X509EncodedKeySpec,java.security.PublicKey,java.security.PrivateKey,javax.crypto.SecretKey,javax.crypto.spec.SecretKeySpec,java.security.spec.PKCS8EncodedKeySpec,java.util.Base64,java.io.*,javax.crypto.Cipher"%>

<%


String msg,enckey;
msg=request.getParameter("datas");
enckey=request.getParameter("urkey");
   
    byte[] input = msg.getBytes();
 	
	
	Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
  SecureRandom random = new SecureRandom();
  //  KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");

   // generator.initialize(1024, random);

    //KeyPair pair = generator.generateKeyPair();
   // PublicKey pubKey; 
  //  PrivateKey privKey; 
	
	
	
	
	// FOR ENCRYPTION

byte[] decodedKey = Base64.getDecoder().decode(enckey);

PublicKey pbk = KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(decodedKey));

    cipher.init(Cipher.ENCRYPT_MODE,pbk,random);
	String ciphtxt=Base64.getEncoder().encodeToString(cipher.doFinal(msg.getBytes("UTF-8")));
 //	out.println("\n\ncipher: " + ciphtxt);
	
	
	// CODE FOR FILING THE DATA
	
	BufferedWriter fs=new BufferedWriter(new FileWriter("G:/mydoc.txt",true));

	fs.write(ciphtxt);

	fs.flush();

	fs.close();
	
	RequestDispatcher rd=null;
	rd=request.getRequestDispatcher("/dataupload.jsp");
	rd.forward(request,response);
	
%>