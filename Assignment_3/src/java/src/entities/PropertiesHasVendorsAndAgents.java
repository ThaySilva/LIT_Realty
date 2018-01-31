/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Thaynara Silva
 */
@Entity
@Table(name = "properties_has_vendors_and_agents")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PropertiesHasVendorsAndAgents.findAll", query = "SELECT p FROM PropertiesHasVendorsAndAgents p")
    , @NamedQuery(name = "PropertiesHasVendorsAndAgents.findByPropertyId", query = "SELECT p FROM PropertiesHasVendorsAndAgents p WHERE p.propertyId = :propertyId")
    , @NamedQuery(name = "PropertiesHasVendorsAndAgents.findByAgentId", query = "SELECT p FROM PropertiesHasVendorsAndAgents p WHERE p.agentId = :agentId")
    , @NamedQuery(name = "PropertiesHasVendorsAndAgents.findByVendorId", query = "SELECT p FROM PropertiesHasVendorsAndAgents p WHERE p.vendorId = :vendorId")
    , @NamedQuery(name = "PropertiesHasVendorsAndAgents.findUniqueVendors", query = "SELECT DISTINCT p From PropertiesHasVendorsAndAgents p WHERE p.agentId = :agentId")
    , @NamedQuery(name = "PropertiesHasVendorsAndAgents.findRelation", query = "SELECT p FROM PropertiesHasVendorsAndAgents p WHERE p.propertyId = :propertyId AND p.agentId = :agentId AND p.vendorId = :vendorId")})
public class PropertiesHasVendorsAndAgents implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "propertyId")
    private Integer propertyId;
    @Basic(optional = false)
    @Column(name = "agentId")
    private int agentId;
    @Basic(optional = false)
    @Column(name = "vendorId")
    private int vendorId;

    public PropertiesHasVendorsAndAgents() {
    }

    public PropertiesHasVendorsAndAgents(Integer propertyId) {
        this.propertyId = propertyId;
    }

    public PropertiesHasVendorsAndAgents(Integer propertyId, int agentId, int vendorId) {
        this.propertyId = propertyId;
        this.agentId = agentId;
        this.vendorId = vendorId;
    }

    public Integer getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(Integer propertyId) {
        this.propertyId = propertyId;
    }

    public int getAgentId() {
        return agentId;
    }

    public void setAgentId(int agentId) {
        this.agentId = agentId;
    }

    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (propertyId != null ? propertyId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PropertiesHasVendorsAndAgents)) {
            return false;
        }
        PropertiesHasVendorsAndAgents other = (PropertiesHasVendorsAndAgents) object;
        if ((this.propertyId == null && other.propertyId != null) || (this.propertyId != null && !this.propertyId.equals(other.propertyId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "src.entities.PropertiesHasVendorsAndAgents[ propertyId=" + propertyId + " ]";
    }
    
}
