package com.cozel.intranet;

import java.security.MessageDigest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class Sha256 {
	
	private static final Logger logger = LoggerFactory.getLogger(Sha256.class);
	
	public static void main(String[] args) throws Exception {
		String planText = "1234";
//		logger.info("암호화 전 패스워드 : {}", planText);
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(planText.getBytes());
            byte byteData[] = md.digest();

            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }

            StringBuffer hexString = new StringBuffer();
            for (int i=0;i<byteData.length;i++) {
                String hex=Integer.toHexString(0xff & byteData[i]);
                if(hex.length()==1){
                    hexString.append('0');
                }
                hexString.append(hex);
            }

//            logger.info("암호화 후 패스워드 : {}", hexString.toString());
            
            System.out.println(hexString.toString());
            logger.info("암호화 후 패스워드2 : {}", sb.toString());
		
    }
	
}
