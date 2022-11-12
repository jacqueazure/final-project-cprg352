/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ca.sait.services;

import ca.sait.dataaccess.RoleDB;
import ca.sait.models.Role;
import java.util.Vector;

/**
 *
 * @author Arcto
 */
public class RoleService {
    public Vector<Role> getAll() {
        RoleDB roleDb = new RoleDB();
        
        return (Vector)roleDb.getAll();
    }
}
