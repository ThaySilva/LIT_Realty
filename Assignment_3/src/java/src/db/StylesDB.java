/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.db;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import src.entities.Styles;

/**
 *
 * @author Thaynara Silva
 */
public class StylesDB {
    
    public static List<Styles> getAllStyles() {
        EntityManager em = null;
        TypedQuery query = null;
        List<Styles> propertyStyles = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Styles.findAll", Styles.class);
            propertyStyles = query.getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyStyles;
    }
}
