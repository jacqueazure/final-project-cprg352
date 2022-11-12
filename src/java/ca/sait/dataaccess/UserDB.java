/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.dataaccess;

import ca.sait.models.Role;
import ca.sait.models.User;
import ca.sait.services.RoleService;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Arcto
 */
public class UserDB {

    public UserDB() {

    }

    public User getUser(String userEmail, String userPassword) {
        Connection conn = ConnectionPool.getInstance().getConnection();

        try {

            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM user WHERE email = \"" + userEmail + "\" AND password = \"" + userPassword + "\"");
            
            rs.next();
            boolean userActive = (rs.getInt(2) == 1) ? true : false;
            String userFirstName = rs.getString(3);
            String userLastName = rs.getString(4);
            int role = rs.getInt(6);

            Role userRole = null;
            
            RoleService roleService = new RoleService();
            
            Vector<Role> roles = roleService.getAll();

            for (int i = 0; i < roles.size(); i++) {
                if (role == roles.get(i).getRoleId()) {
                    userRole = roles.get(i);
                }
            }

            User user = new User(userEmail, userActive, userFirstName, userLastName, userPassword);
            
            user.setRole(userRole);

            conn.close();
            
            return user;

        } catch (SQLException ex) {
            ex.printStackTrace();
            try {
                conn.close();
            } catch (SQLException ex1) {
                Logger.getLogger(UserDB.class.getName()).log(Level.SEVERE, null, ex1);
                return null;
            }
            
            return null;
        }
    }
}
