/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.db;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import src.entities.Vendors;

/**
 *
 * @author Thaynara Silva
 */
public class VendorsDB {
    
    public static List<Vendors> getFiveVendors(int id) {
        EntityManager em = null;
        TypedQuery query = null;
        List<Integer> idList = null;
        Vendors vendor = null;
        List<Vendors> vendorList = new ArrayList<>();
        
        try {
            idList = PropertiesHasVendorsAndAgentsDB.getFiveRelevantAgents(id);
            em = DBUtil.getEmf().createEntityManager();
            for(Integer i : idList){
                query = em.createNamedQuery("Vendors.findByVendorID", Vendors.class);
                query.setParameter("vendorID", i);
                vendor = (Vendors) query.getSingleResult();
                vendorList.add(vendor);
            }
        } catch (Exception ex){
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return vendorList;
    }
    
    public static List<Vendors> getAllVendors(){
        EntityManager em = null;
        TypedQuery query = null;
        List<Vendors> vendorList = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Vendors.findAll", Vendors.class);
            vendorList = query.getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return vendorList;
    }
    
    public static List<Vendors> getRandomFive() {
        EntityManager em = null;
        TypedQuery query = null;
        List<Vendors> vendorsList = null;
        Random rand = new Random();
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Vendors.findAll", Vendors.class);
            int size = query.getResultList().size();
            int n = rand.nextInt(size) + 1;
            if(size==n){
                n=n-5;
            }
            if(size-n<5){
                int sub = size-n;
                n=n-sub;
            }
            vendorsList = query.setFirstResult(n).setMaxResults(5).getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return vendorsList;
    }
}
