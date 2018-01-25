/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.db;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import src.entities.Garagetypes;

/**
 *
 * @author Thaynara Silva
 */
public class GaragetypesDB {
    
    public static Garagetypes getGarageByID(int id){
        EntityManager em = null;
        TypedQuery query = null;
        Garagetypes propertyGarage = null;
        
        try{
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Garagetypes.findByGarageId", Garagetypes.class);
            query.setParameter("garageId", id);
            propertyGarage = (Garagetypes) query.getSingleResult();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyGarage;
    }
    
    public static List<Garagetypes> getAllGarageTypes(){
        EntityManager em = null;
        TypedQuery query = null;
        List<Garagetypes> typeList = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Garagetypes.findAll", Garagetypes.class);
            typeList = query.getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return typeList;
    }
}
