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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "propertytypes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Propertytypes.findAll", query = "SELECT p FROM Propertytypes p")
    , @NamedQuery(name = "Propertytypes.findByTypeId", query = "SELECT p FROM Propertytypes p WHERE p.typeId = :typeId")
    , @NamedQuery(name = "Propertytypes.findByTypeName", query = "SELECT p FROM Propertytypes p WHERE p.typeName = :typeName")})
public class Propertytypes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "typeId")
    private Integer typeId;
    @Column(name = "typeName")
    private String typeName;

    public Propertytypes() {
    }

    public Propertytypes(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (typeId != null ? typeId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Propertytypes)) {
            return false;
        }
        Propertytypes other = (Propertytypes) object;
        if ((this.typeId == null && other.typeId != null) || (this.typeId != null && !this.typeId.equals(other.typeId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "src.entities.Propertytypes[ typeId=" + typeId + " ]";
    }
    
}