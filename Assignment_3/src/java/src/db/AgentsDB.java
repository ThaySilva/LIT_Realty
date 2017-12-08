/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.db;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import src.entities.Agents;

/**
 *
 * @author Thaynara Silva
 */
public class AgentsDB {
    
    public static List<Agents> getAll() {
        EntityManager em = null;
        TypedQuery query = null;
        List<Agents> agentsList = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Agents.findAll", Agents.class);
            agentsList = query.getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return agentsList;
    }
}
