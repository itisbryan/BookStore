/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.edu.fpt.utils.enums;

/**
 *
 * @author Khoi Nguyen
 */
public enum DigestType {
    
    MD5("MD5"),
    SHA1("SHA-1"),
    SHA_256("SHA-256"),
    SHA_384("SHA-384"),
    SHA_512("SHA-512");
    
    public final String label;
    
    private DigestType(String label) {
        this.label = label;
    }
    
}
