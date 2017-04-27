package com.cozel.intranet;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class Aes256 {
	
	/** 암호화 키 16자리 */
	public static String key = "fe8025947de7cd71";
	
    public static void main(String[] args) {
    	
    	  String message = "12345678901234567890";
    	
        try {
        	
            String encrypt = encrypt(message);
            System.out.println("origin str = " + message);
            System.out.println("encrypt str = " + encrypt);
            
            String decrypt = decrypt(encrypt);
            System.out.println("decrypt str = " + decrypt);
           
        } catch (Exception e) {
            e.printStackTrace();
        }
       
    }

    /**
     * hex to byte[] : 16진수 문자열을 바이트 배열로 변환한다.
     *
     * @param hex    hex string
     * @return
     */
    public static byte[] hexToByteArray(String hex) {
    	
        if (hex == null || hex.length() == 0) {
            return null;
        }

        byte[] ba = new byte[hex.length() / 2];
        
        for (int i = 0; i < ba.length; i++) {
            ba[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
        }
        
        return ba;
    }

    /**
     * byte[] to hex : unsigned byte(바이트) 배열을 16진수 문자열로 바꾼다.
     *
     * @param ba        byte[]
     * @return
     */
    public static String byteArrayToHex(byte[] ba) {
    	
        if (ba == null || ba.length == 0) {
            return null;
        }

        StringBuffer sb = new StringBuffer(ba.length * 2);
        String hexNumber;
        
        for (int x = 0; x < ba.length; x++) {
            hexNumber = "0" + Integer.toHexString(0xff & ba[x]);
            sb.append(hexNumber.substring(hexNumber.length() - 2));
        }
        
        return sb.toString();
    }


    /**
     * AES 방식의 암호화
     *
     * @param message 암호화 대상 문자열
     * @return String 암호화 된 문자열
     * @throws Exception
     */
    public static String encrypt(String message) throws Exception {

        // use key coss2
        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), "AES");

        // Instantiate the cipher
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);

        byte[] encrypted = cipher.doFinal(message.getBytes());
        byte[] base64Encoded = Base64.encodeBase64(encrypted);
        
        String originalString = new String(base64Encoded);
        
        return originalString;
    }
    
    /**
     * AES 방식의 복호화
     *
     * @param message 복호화 대상 문자열
     * @return String 복호화 된 문자열
     * @throws Exception
     */
    public static String decrypt(String encrypted) throws Exception {

        // use key coss2
        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), "AES");

        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        
        byte[] base64DEcoded = Base64.decodeBase64(encrypted);
        byte[] original = cipher.doFinal(base64DEcoded);
        
        String originalString = new String(original);
        
        return originalString;
    }
    
}