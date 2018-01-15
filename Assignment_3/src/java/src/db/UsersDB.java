/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.db;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import src.entities.Users;

/**
 *
 * @author Thaynara Silva
 */
public class UsersDB {
    
    public static Users getUserByUsername(String username) {
        EntityManager em = null;
        TypedQuery query = null;
        Users user = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Users.findByUsername", Users.class);
            query.setParameter("username", username);
            user = (Users) query.getSingleResult();
        } catch (Exception ex){
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return user;
    }
}
