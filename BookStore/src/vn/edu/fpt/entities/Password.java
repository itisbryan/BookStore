/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.edu.fpt.entities;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.util.logging.Level;
import java.util.logging.Logger;
import vn.edu.fpt.utils.enums.DigestType;

/**
 *
 * @author Khoi Nguyen
 */
public class Password {

    private String password;
    private DigestType digestType;

    public Password(String password, DigestType digestType) {
        this.password = password;
        this.digestType = digestType;
    }

    private byte[] getSalt() throws NoSuchAlgorithmException, NoSuchProviderException {
        SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG", "SUN");

        byte[] salt = new byte[16]; // Create array for salt
        secureRandom.nextBytes(salt); // Get a random salt
        return salt;
    }

    public String getSecuredPassword() {
        String securedPassword = null;
        try {
            // Get random salt
            byte[] salt = getSalt();
            
            MessageDigest messageDigest = MessageDigest.getInstance(digestType.label);
            messageDigest.update(salt); // Add salt to digest
            
            byte[] bytes = messageDigest.digest(this.password.getBytes());
            StringBuilder builder = new StringBuilder();
            
            for (int i = 0; i < bytes.length; i++) {
                builder.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            
            // Get completed hashed password in hex format
            securedPassword = builder.toString();
            
        } catch (NoSuchAlgorithmException | NoSuchProviderException ex) {
            Logger.getLogger(Password.class.getName()).log(Level.SEVERE, null, ex);
        }

        return securedPassword;
        
    }
}
