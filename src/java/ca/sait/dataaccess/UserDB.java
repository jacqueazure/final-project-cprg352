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
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

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
    
    
    public boolean createUser(User user) {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();

        EntityManager em = emFactory.createEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();

            return true;
        } catch (Exception ex) {
            em.getTransaction().rollback();

            return false;
        } finally {
            em.close();
        }

    }

    public void deleteUser(User user) {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();

        EntityManager em = emFactory.createEntityManager();

        EntityTransaction trans = em.getTransaction();

        User ref = em.find(User.class, user.getEmail());

        try {
            trans.begin();
            em.remove(ref);
            trans.commit();

        } catch (Exception ex) {
            trans.rollback();
        } finally {
            em.close();
        }

    }

    public void updateUser(User user) {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();
        EntityManager em = emFactory.createEntityManager();
        User ref = em.find(User.class, user.getEmail());

        ref.setActive(user.getActive());
        ref.setFirstName(user.getFirstName());
        ref.setLastName(user.getLastName());
        ref.setRole(user.getRole());
        
        EntityTransaction trans = em.getTransaction();
        
        try {
            trans.begin();
            em.persist(ref);
            trans.commit();

        } catch (Exception ex) {
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public List<User> getAll() {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();

        EntityManager em = emFactory.createEntityManager();

        return em.createNamedQuery("User.findAll", User.class).getResultList();
    }
}
