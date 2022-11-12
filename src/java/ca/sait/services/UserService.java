/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.services;

import ca.sait.dataaccess.UserDB;
import ca.sait.models.User;

/**
 *
 * @author J.Pointer
 */
public class UserService {
    public UserService() {
        
    }
    
    public User getUser(String userEmail, String userPassword) {
        UserDB userDb = new UserDB();
        
        return userDb.getUser(userEmail, userPassword);
    }
}
