/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.db;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import src.entities.Administrators;

/**
 *
 * @author Thaynara Silva
 */
public class AdministratorsDB {
    
    public static Administrators getAdminByID(int id) {
        EntityManager em = null;
        TypedQuery query = null;
        Administrators admin = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Administrators.findByAdminID", Administrators.class);
            query.setParameter("adminID", id);
            admin = (Administrators) query.getSingleResult();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return admin;
    }
    
    public static void updateAdminDetails(Administrators admin) {
        EntityManager em = null;
        TypedQuery query = null;
        EntityTransaction trans = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            trans = em.getTransaction();
            trans.begin();
            em.merge(admin);
            trans.commit();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
    }
}
