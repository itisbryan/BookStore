
import vn.edu.fpt.entities.Password;
import vn.edu.fpt.utils.enums.DigestType;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Khoi Nguyen
 */
public class Main {
    public static void main(String[] args) {
        Password password = new Password("3141592654,Nguyen", DigestType.SHA1);
        System.out.println(password.getSecuredPassword());
    }
}
