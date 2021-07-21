/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.edu.fpt.entities;

import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
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
        SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG", "FPT");
        
        byte[] salt = new byte[16]; // Create array for salt
        secureRandom.nextBytes(salt); // Get a random salt
        return salt;
    }
}
