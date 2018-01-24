/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.db;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import src.entities.Userroles;

/**
 *
 * @author Thaynara Silva
 */
public class UserrolesDB {
    
    public static Userroles getUserRoleByID(int id) {
        EntityManager em = null;
        TypedQuery query = null;
        Userroles role = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Userroles.findByUserID", Userroles.class);
            query.setParameter("userID", id);
            role = (Userroles) query.getSingleResult();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return role;
    }
}
