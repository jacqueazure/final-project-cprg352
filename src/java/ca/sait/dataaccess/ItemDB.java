/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.dataaccess;

import ca.sait.models.Item;
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

/**
 *
 * @author Arcto
 */
public class ItemDB {

    public Vector<Item> getAll(User user) {
        Connection conn = ConnectionPool.getInstance().getConnection();
        Vector<Item> items = new Vector();
        
        try {

            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT category_name, item_name, price \n"
                    + "FROM user\n"
                    + "JOIN item\n"
                    + "ON user.email = item.owner\n"
                    + "JOIN category\n"
                    + "ON item.category = category.category_id"
                    + "WHERE email = \"" + user.getEmail() + "\"");

            while(rs.next()) {
                String category_name = rs.getString(1);
            }

            conn.close();

            return items;

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

    public List<Item> getAll() {
        EntityManagerFactory emFactory = DBUtil.getEmFactory();

        EntityManager em = emFactory.createEntityManager();

        return em.createNamedQuery("Item.findAll", Item.class).getResultList();
    }
}
