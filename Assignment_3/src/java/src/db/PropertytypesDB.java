/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.db;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import src.entities.Propertytypes;

/**
 *
 * @author Thaynara Silva
 */
public class PropertytypesDB {
    
    public static List<Propertytypes> getAllTypes() {
        EntityManager em = null;
        TypedQuery query = null;
        List<Propertytypes> typeList = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Propertytypes.findAll", Propertytypes.class);
            typeList = query.getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return typeList;
    }
    
    public static Propertytypes getTypeByID(int id) {
        EntityManager em = null;
        TypedQuery query = null;
        Propertytypes propertyType = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Propertytypes.findByTypeId", Propertytypes.class);
            query.setParameter("typeId", id);
            propertyType = (Propertytypes) query.getSingleResult();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyType;
    }
}
