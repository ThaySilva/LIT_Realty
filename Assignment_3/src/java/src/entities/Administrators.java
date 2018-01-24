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
@Table(name = "administrators")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Administrators.findAll", query = "SELECT a FROM Administrators a")
    , @NamedQuery(name = "Administrators.findByAdminID", query = "SELECT a FROM Administrators a WHERE a.adminID = :adminID")
    , @NamedQuery(name = "Administrators.findByName", query = "SELECT a FROM Administrators a WHERE a.name = :name")
    , @NamedQuery(name = "Administrators.findByPhone", query = "SELECT a FROM Administrators a WHERE a.phone = :phone")
    , @NamedQuery(name = "Administrators.findByFax", query = "SELECT a FROM Administrators a WHERE a.fax = :fax")
    , @NamedQuery(name = "Administrators.findByEmail", query = "SELECT a FROM Administrators a WHERE a.email = :email")
    , @NamedQuery(name = "Administrators.updateByID", query = "UPDATE Administrators a SET a.name = :name, a.phone = :phone, a.fax = :fax, a.email = :email WHERE a.adminID = :adminID")})
public class Administrators implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "adminID")
    private Integer adminID;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "phone")
    private String phone;
    @Basic(optional = false)
    @Column(name = "fax")
    private String fax;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;

    public Administrators() {
    }

    public Administrators(Integer adminID) {
        this.adminID = adminID;
    }

    public Administrators(Integer adminID, String name, String phone, String fax, String email) {
        this.adminID = adminID;
        this.name = name;
        this.phone = phone;
        this.fax = fax;
        this.email = email;
    }

    public Integer getAdminID() {
        return adminID;
    }

    public void setAdminID(Integer adminID) {
        this.adminID = adminID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (adminID != null ? adminID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Administrators)) {
            return false;
        }
        Administrators other = (Administrators) object;
        if ((this.adminID == null && other.adminID != null) || (this.adminID != null && !this.adminID.equals(other.adminID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "src.entities.Administrators[ adminID=" + adminID + " ]";
    }
    
}
