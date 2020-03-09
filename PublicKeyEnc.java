package PKE;
import java.io.*;
importjava.security.KeyFactory;
importjava.security.KeyPair;
importjava.security.KeyPairGenerator;
importjava.security.PrivateKey;
importjava.security.PublicKey;
importjava.security.Security;
importjava.security.spec.EncodedKeySpec;
import java.security.spec.PKCS8EncodedKeySpec;
importjava.sql.Connection;
importjava.sql.DriverManager;
importjava.sql.PreparedStatement;
importjava.sql.ResultSet;
importjava.sql.Statement;
importjavax.crypto.Cipher;
importjavax.crypto.CipherInputStream;
importjavax.crypto.CipherOutputStream;
public class PublicKeyEnc
 {
public static PrivateKeyprivKey;
public static PublicKeypubKey;
public static Cipher cipher;
public static void keygen() throws Exception {
try{
KeyPairGeneratorkpg = KeyPairGenerator.getInstance("RSA");
cipher = Cipher.getInstance("RSA");
kpg.initialize(1024);
KeyPairkeyPair = kpg.generateKeyPair();
privKey = keyPair.getPrivate();
pubKey = keyPair.getPublic();
}catch(Exception e){}
}
// Encrypt
public static byte[] encrypt(String filedata) throws Exception{
keygen();
cipher.init(Cipher.ENCRYPT_MODE, pubKey);
byte[] ciphertext= cipher.doFinal(filedata.getBytes());
//System.out.println("enc="+new String(ciphertext));
returnciphertext;
}
// Decrypt
public static byte[] decrypt(byte[] ciphertext,PrivateKeyprivKey) throws Exception{
byte b[]=null;
cipher.init(Cipher.DECRYPT_MODE, privKey);
byte[] plaintext= cipher.doFinal(ciphertext);
//System.out.println("dec="+new String(plaintext));
return plaintext;
 } 
public static PrivateKeygetPriKey(){
returnprivKey;
}
public static void main(String a[]) throws Exception{
byte e[]=encrypt("RAAC: Robust and Auditable Access Control With Multiple Attribute Authorities for Public Cloud StorageAttribute-Based Storage Supporting Secure Deduplication of Key Aggregate searchable encryption for Online Data Sharing on the CloudTAFC: Time and Attribute Factors Combined Access Control for Time-Sensitive Data in Public Cloud");
byte d[]=decrypt(e,getPriKey());
System.out.println(new String(d));
}
    }
