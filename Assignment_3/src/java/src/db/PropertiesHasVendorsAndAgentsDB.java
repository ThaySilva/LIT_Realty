/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.db;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import src.entities.PropertiesHasVendorsAndAgents;

/**
 *
 * @author Thaynara Silva
 */
public class PropertiesHasVendorsAndAgentsDB {
    
    public static List<Integer> getFiveRelevantAgents(int id){
        EntityManager em = null;
        TypedQuery query = null;
        List<PropertiesHasVendorsAndAgents> vendorsList = null;
        List<Integer> idList = new ArrayList<>();
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("PropertiesHasVendorsAndAgents.findUniqueVendors", PropertiesHasVendorsAndAgents.class);
            query.setParameter("agentId", id);
            vendorsList = query.setMaxResults(5).getResultList();
            
            for(PropertiesHasVendorsAndAgents v : vendorsList){
                idList.add(v.getVendorId());
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return idList;
    }
    
    public static List<Integer> getAllRelevantAgents(int id) {
        EntityManager em = null;
        TypedQuery query = null;
        List<PropertiesHasVendorsAndAgents> vendorsList = null;
        List<Integer> idList = new ArrayList<>();
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("PropertiesHasVendorsAndAgents.findUniqueVendors", PropertiesHasVendorsAndAgents.class);
            query.setParameter("agentId", id);
            vendorsList = query.getResultList();
            
            for(PropertiesHasVendorsAndAgents v : vendorsList){
                idList.add(v.getVendorId());
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return idList;
    }
    
    public static List<Integer> getVendorsPropertiesId(int id){
        EntityManager em = null;
        TypedQuery query = null;
        List<PropertiesHasVendorsAndAgents> list = null;
        List<Integer> idList = new ArrayList<>();
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("PropertiesHasVendorsAndAgents.findByVendorId", PropertiesHasVendorsAndAgents.class);
            query.setParameter("vendorId", id);
            list = query.getResultList();
            
            for(PropertiesHasVendorsAndAgents v : list) {
                idList.add(v.getPropertyId());
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return idList;
    }
}
