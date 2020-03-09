package PKE;
importit.unisa.dia.gas.jpbc.Element;
importit.unisa.dia.gas.plaf.jpbc.pairing.PairingFactory;
importjavax.crypto.Cipher;
importit.unisa.dia.gas.jpbc.*;
importjava.util.*;
public class BroadcastEncryption
{
Element g;
private Element broadcastkey;		
private Element publicKey;
private Element masterKey;	
private String secretkey;
Pairing pairing;
public Element getBroadcastKey(){
broadcastkey = pairing.getZr().newRandomElement().getImmutable();
returnthis.broadcastkey;
}
public Element getMasterKey(){
masterKey = pairing.getZr().newRandomElement().getImmutable();
returnmasterKey;
}
public Element getPublicKey(){
g = pairing.getG1().newRandomElement().getImmutable();
publicKey = g.powZn(masterKey).getImmutable();
returnpublicKey;
}
public Element getParam(){
return g;
}
public void setUp(){
pairing= PairingManager.defaultPairing;
getMasterKey();
getPublicKey();
getParam();
}
public String getSecretKey(String userid){
pairing= PairingManager.defaultPairing;
g = pairing.getG1().newRandomElement().getImmutable();
masterKey=getMasterKey();
secretkey = g.powZn(masterKey).getImmutable().toString()+Math.abs(userid.hashCode());
returnsecretkey;
}
}
