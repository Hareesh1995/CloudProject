<%@ page import="javax.servlet.*,javax.servlet.http.*,java.sql.*"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,java.security.SecureRandom,java.security.Security"%>
<%@ page import = "java.security.KeyFactory,java.security.spec.X509EncodedKeySpec,java.security.PublicKey,java.security.PrivateKey"%>
<%@ page import = "javax.crypto.SecretKey,javax.crypto.spec.SecretKeySpec,java.security.spec.PKCS8EncodedKeySpec,java.util.Base64,javax.crypto.Cipher"%>

<%
String msg;
BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
msg=br.readLine();
   
    byte[] input = msg.getBytes();
    Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
    SecureRandom random = new SecureRandom();
    KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");

    generator.initialize(1024, random);

    KeyPair pair = generator.generateKeyPair();
    PublicKey pubKey = pair.getPublic();
    PrivateKey privKey = pair.getPrivate();
	
	
	// FOR ENCRYPTION
	// Converting the key to string  and again string to key format
				byte encoded[] = pubKey.getEncoded();
				String encodedKey = Base64.getEncoder().encodeToString(encoded);
				
			//	System.out.println("\n\n Public key : "+encodedKey);
			//  System.out.println("\n\nEnter ur public key");


			//  byte[] decodedKey = Base64.getDecoder().decode(encodedKey);
			//  PublicKey pbk = KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(decodedKey));


    cipher.init(Cipher.ENCRYPT_MODE,pubKey,random);
	String ciphtxt=Base64.getEncoder().encodeToString(cipher.doFinal(msg.getBytes("UTF-8")));

	System.out.println("\n\ncipher: " + ciphtxt);
	
	
// FOR DECRYPTION 
  
				byte encodedp[] = privKey.getEncoded();
				String encodedpKey = Base64.getEncoder().encodeToString(encodedp);
				
				System.out.println("\n\n Private key : "+encodedpKey);
  
  
		byte[] decodedpKey = Base64.getDecoder().decode(encodedpKey);
  
		PrivateKey prk = KeyFactory.getInstance("RSA").generatePrivate(new PKCS8EncodedKeySpec(decodedpKey));

		cipher.init(Cipher.DECRYPT_MODE, prk);

String dectxt=new String(cipher.doFinal(Base64.getDecoder().decode(ciphtxt)));
System.out.println("\n\ndecipher: " + dectxt);

  }
}


%>