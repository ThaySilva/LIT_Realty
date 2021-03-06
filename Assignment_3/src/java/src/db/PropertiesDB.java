/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.db;

import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import src.entities.Properties;
import src.entities.PropertiesHasVendorsAndAgents;

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
            if(size==n){
                n=n-7;
            }
            if(size-n<7){
                int sub = size-n;
                n=n-sub;
            }
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
    
    public static List<Properties> getPropertiesIndexSearch(String location, String style, String priceRange){
        EntityManager em = null;
        TypedQuery query = null;
        List<Properties> propertyList = null;
        List<Properties> update = new ArrayList<>();
        String priceMin = null;
        String priceMax = null;
        int styleId = 0;
        
        switch(priceRange){
            case "bellow75000":
                priceMin = null;
                priceMax = "75000";
                break;
            case "75000To250000":
                priceMin = "75000";
                priceMax = "250000";
                break;
            case "250000To425000":
                priceMin = "250000";
                priceMax = "425000";
                break;
            case "425000To600000":
                priceMin = "425000";
                priceMax = "600000";
                break;
            case "over600000":
                priceMin = "600000";
                priceMax = null;
                break;
            default:
                break;
        }
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            
            if(location.equals("All")){
                query = em.createNamedQuery("Properties.findAll", Properties.class);
                propertyList = query.getResultList();
            } else {
                query = em.createNamedQuery("Properties.findByCity", Properties.class);
                query.setParameter("city", location);
                propertyList = query.getResultList();
            }
            
            if(!priceRange.equals("All")){
                if(priceMin == null){
                    for(Properties p : propertyList){
                        if(!(p.getPrice() <= Double.parseDouble(priceMax))){
                            update.add(p);
                        }
                    }
                } else if(priceMax == null) {
                    for(Properties p : propertyList){
                        if(!(p.getPrice() >= Double.parseDouble(priceMin))){
                            update.add(p);
                        }
                    }
                } else {
                    for(Properties p : propertyList){
                        if(!(p.getPrice() >= Double.parseDouble(priceMin) && p.getPrice() <= Double.parseDouble(priceMax))){
                            update.add(p);
                        }
                    }
                }
                propertyList.removeAll(update);
            }
            
            if(!style.equals("All")){
                styleId = Integer.parseInt(style);
                
                for(Properties p : propertyList){
                    if(!(p.getStyleId().equals(styleId))){
                        update.add(p);
                    }
                }
                propertyList.removeAll(update);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyList;
    }
    
    public static List<Properties> getPropertiesRefinedSearch(String location, String style, String priceRange, String footageRange, String bedrooms){
        EntityManager em = null;
        TypedQuery query = null;
        List<Properties> propertyList = null;
        List<Properties> update = new ArrayList<>();
        String priceMin = null;
        String priceMax = null;
        String minFootage = null;
        String maxFootage = null;
        int styleId = 0;
        int bedroomsNum = 0;
        
        switch(priceRange){
            case "bellow75000":
                priceMin = null;
                priceMax = "75000";
                break;
            case "75000To250000":
                priceMin = "75000";
                priceMax = "250000";
                break;
            case "250000To425000":
                priceMin = "250000";
                priceMax = "425000";
                break;
            case "425000To600000":
                priceMin = "425000";
                priceMax = "600000";
                break;
            case "over600000":
                priceMin = "600000";
                priceMax = null;
                break;
            default:
                break;
        }
        
        switch(footageRange){
            case "under1000":
                minFootage = null;
                maxFootage = "1000";
                break;
            case "1000To2000":
                minFootage = "1000";
                maxFootage = "2000";
                break;
            case "2000To3000":
                minFootage = "2000";
                maxFootage = "3000";
                break;
            case "3000To5000":
                minFootage = "3000";
                maxFootage = "5000";
                break;
            case "over5000":
                minFootage = "5000";
                maxFootage = null;
                break;
            default:
                break;
        }
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            
            if(location.equals("All")){
                query = em.createNamedQuery("Properties.findAll", Properties.class);
                propertyList = query.getResultList();
            } else {
                query = em.createNamedQuery("Properties.findByCity", Properties.class);
                query.setParameter("city", location);
                propertyList = query.getResultList();
            }
            
            if(!priceRange.equals("All")){
                if(priceMin == null){
                    for(Properties p : propertyList){
                        if(!(p.getPrice() <= Double.parseDouble(priceMax))){
                            update.add(p);
                        }
                    }
                } else if(priceMax == null) {
                    for(Properties p : propertyList){
                        if(!(p.getPrice() >= Double.parseDouble(priceMin))){
                            update.add(p);
                        }
                    }
                } else {
                    for(Properties p : propertyList){
                        if(!(p.getPrice() >= Double.parseDouble(priceMin) && p.getPrice() <= Double.parseDouble(priceMax))){
                            update.add(p);
                        }
                    }
                }
                propertyList.removeAll(update);
            }
            
            if(!footageRange.equals("All")){
                if(minFootage == null){
                    for(Properties p : propertyList){
                        if(!(p.getSquarefeet() <= Integer.parseInt(maxFootage))){
                            update.add(p);
                        }
                    }
                } else if(maxFootage == null) {
                    for(Properties p : propertyList){
                        if(!(p.getSquarefeet() >= Integer.parseInt(minFootage))){
                            update.add(p);
                        }
                    }
                } else {
                    for(Properties p : propertyList){
                        if(!(p.getSquarefeet() >= Integer.parseInt(minFootage) && p.getSquarefeet() <= Integer.parseInt(maxFootage))){
                            update.add(p);
                        }
                    }
                }
                propertyList.removeAll(update);
            }
            
            if(!bedrooms.equals("All")){
                if(bedrooms.equals("4+")){
                    for(Properties p : propertyList){
                        if(!(p.getBedrooms() >= 4)){
                            update.add(p);
                        }
                    }
                } else {
                    bedroomsNum = Integer.parseInt(bedrooms);

                    for(Properties p : propertyList){
                        if(!(p.getBedrooms() == bedroomsNum)){
                            update.add(p);
                        }
                    }
                }
                propertyList.removeAll(update);
            }
            
            if(!style.equals("All")){
                styleId = Integer.parseInt(style);
                
                for(Properties p : propertyList){
                    if(!(p.getStyleId().equals(styleId))){
                        update.add(p);
                    }
                }
                propertyList.removeAll(update);
            }
            
            
        } catch (Exception ex){
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyList;
    }
    
    public static Properties getPropertyByID(int id){
        EntityManager em = null;
        TypedQuery query = null;
        Properties property = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findById", Properties.class);
            query.setParameter("id", id);
            property = (Properties) query.getSingleResult();
        } catch (Exception ex){
            System.out.println(ex);
        } finally {
            em.close();
        }
        return property;
    }
    
    public static List<Properties> getSimilarProperties(String city, int id) {
        EntityManager em = null;
        TypedQuery query = null;
        List<Properties> propertyList = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findSimilar", Properties.class);
            query.setParameter("city", city);
            query.setParameter("id", id);
            propertyList = query.setMaxResults(4).getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyList;
    }
    
    public static void updatePropertiesViews(int id) {
        EntityManager em = null;
        TypedQuery query = null;
        EntityTransaction trans = null;
        Properties property = null;
        int views = 0;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findById", Properties.class);
            query.setParameter("id", id);
            property = (Properties) query.getSingleResult();
            views = property.getViews() + 1;
            property.setViews(views);
            trans = em.getTransaction();
            trans.begin();
            em.merge(property);
            trans.commit();
        } catch (Exception ex) {
            System.out.println();
        } finally {
            em.close();
        }
    }
    
    public static List<Properties> getFiveProperties(int id) {
        EntityManager em = null;
        TypedQuery query = null;
        List<Properties> propertyList = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findByAgentId", Properties.class);
            query.setParameter("agentId", id);
            propertyList = query.setMaxResults(5).getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyList;
    }
    
    public static List<Properties> getRandomFive(){
        EntityManager em = null;
        TypedQuery query = null;
        List<Properties> propertyList = null;
        Random rand = new Random();
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findAll", Properties.class);
            int size = query.getResultList().size();
            int n = rand.nextInt(size) + 1;
            if(size==n){
                n=n-5;
            }
            if(size-n<5){
                int sub = size-n;
                n=n-sub;
            }
            propertyList = query.setFirstResult(n).setMaxResults(5).getResultList();
        } catch (Exception ex){
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyList;
    }
    
    public static List<Properties> getPropertiesByAgent(int id){
        EntityManager em = null;
        TypedQuery query = null;
        List<Properties> propertyList = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findByAgentId", Properties.class);
            query.setParameter("agentId", id);
            propertyList = query.getResultList();
        } catch (Exception ex){
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyList;
    }
    
    public static int getPropertyID(){
        EntityManager em = null;
        TypedQuery query = null;
        Properties property = null;
        int newId = 0;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findLastID", Properties.class);
            property = (Properties) query.setMaxResults(1).getSingleResult();
            newId = property.getId() + 1;
        } catch (Exception ex) {
            System.out.println(ex);
        } finally{
            em.close();
        }
        
        return newId;
    }
    
    public static int getListingNum() {
        EntityManager em = null;
        TypedQuery query = null;
        Properties property = null;
        int newListing = 0;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findLastID", Properties.class);
            property = (Properties) query.setMaxResults(1).getSingleResult();
            newListing = property.getListingNum() + 1;
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return newListing;
    }
    
    public static void addProperty(Properties property) {
        EntityManager em = null;
        EntityTransaction trans = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            trans = em.getTransaction();
            trans.begin();
            em.persist(property);
            trans.commit();
            PropertiesHasVendorsAndAgentsDB.addRelation(property.getId(), property.getAgentId(), property.getVendorId());
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
    }
    
    public static void updatePropertyDetails(Properties property){
        EntityManager em = null;
        TypedQuery query = null;
        EntityTransaction trans = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            trans = em.getTransaction();
            trans.begin();
            em.merge(property);
            trans.commit();
        } catch (Exception ex){
            System.out.println(ex);
        } finally {
            em.close();
        }
    }
    
    public static void deleteProperty(Properties property){
        EntityManager em = null;
        EntityTransaction trans = null;
        PropertiesHasVendorsAndAgents relation = PropertiesHasVendorsAndAgentsDB.getRelation(property.getId(),property.getAgentId(), property.getVendorId());
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            trans = em.getTransaction();
            trans.begin();
            em.remove(em.merge(property));
            trans.commit();
            PropertiesHasVendorsAndAgentsDB.deleteRelation(relation);
        } catch (Exception ex){
            System.out.println(ex);
        } finally {
            em.close();
        }
    }
    
    public static List<Properties> getOldestProperties(){
        EntityManager em = null;
        TypedQuery query = null;
        List<Properties> propertyList = null;
        
        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findOldest", Properties.class);
            propertyList = query.setMaxResults(10).getResultList();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        
        return propertyList;
    }
}
