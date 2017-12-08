/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.db;

import java.time.Duration;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import src.entities.Properties;

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
    
    public static List<Properties> getNewestAdded() {
        EntityManager em = null;
        TypedQuery query = null;
        List<Properties> propertyList = null;
        
        Instant now = Instant.now();
        Instant sevenDaysBefore = now.minus(Duration.ofDays(7));
        Date earliestDate = Date.from(sevenDaysBefore);
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findRecentlyAdded", Properties.class);
            query.setParameter("dateAdded", earliestDate);
            propertyList = query.setMaxResults(4).getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyList;
    }
    
    public static List<Properties> getRandomSeven() {
        EntityManager em = null;
        TypedQuery query = null;
        List<Properties> propertyList = null;
        Random rand = new Random();
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findAll", Properties.class);
            int size = query.getResultList().size();
            int n = rand.nextInt(size) + 1;
            propertyList = query.setFirstResult(n).setMaxResults(7).getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyList;
    }
    
    public static List<Properties> getMostPopular() {
        EntityManager em = null;
        TypedQuery query = null;
        List<Properties> propertyList = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findMostPopular", Properties.class);
            propertyList = query.setMaxResults(5).getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyList;
    }
    
    public static List<Properties> getAllProperties() {
        EntityManager em = null;
        TypedQuery query = null;
        List<Properties> propertyList = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findAll", Properties.class);
            propertyList = query.getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyList;
    }
}
