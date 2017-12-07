/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.db;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author Thaynara Silva
 */
public class PropertiesDB {
    
    public static List<String> getAllCities() {
        EntityManager em = null;
        TypedQuery query = null;
        List<String> cityList = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findUniqueCities", String.class);
            cityList = query.getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return cityList;
    }
}
