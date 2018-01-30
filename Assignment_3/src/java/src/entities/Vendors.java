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
@Table(name = "vendors")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Vendors.findAll", query = "SELECT v FROM Vendors v")
    , @NamedQuery(name = "Vendors.findByVendorID", query = "SELECT v FROM Vendors v WHERE v.vendorID = :vendorID")
    , @NamedQuery(name = "Vendors.findByName", query = "SELECT v FROM Vendors v WHERE v.name = :name")
    , @NamedQuery(name = "Vendors.findByPhone", query = "SELECT v FROM Vendors v WHERE v.phone = :phone")
    , @NamedQuery(name = "Vendors.findByAddress", query = "SELECT v FROM Vendors v WHERE v.address = :address")
    , @NamedQuery(name = "Vendors.findByCounty", query = "SELECT v FROM Vendors v WHERE v.county = :county")
    , @NamedQuery(name = "Vendors.findByEmail", query = "SELECT v FROM Vendors v WHERE v.email = :email")
    , @NamedQuery(name = "Vendors.findLastID", query = "SELECT v FROM Vendors v ORDER BY v.vendorID DESC")})
public class Vendors implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "vendorID")
    private Integer vendorID;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Column(name = "phone")
    private String phone;
    @Basic(optional = false)
    @Column(name = "address")
    private String address;
    @Basic(optional = false)
    @Column(name = "county")
    private String county;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;

    public Vendors() {
    }

    public Vendors(Integer vendorID) {
        this.vendorID = vendorID;
    }

    public Vendors(Integer vendorID, String name, String phone, String address, String county, String email) {
        this.vendorID = vendorID;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.county = county;
        this.email = email;
    }

    public Integer getVendorID() {
        return vendorID;
    }

    public void setVendorID(Integer vendorID) {
        this.vendorID = vendorID;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
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
        hash += (vendorID != null ? vendorID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Vendors)) {
            return false;
        }
        Vendors other = (Vendors) object;
        if ((this.vendorID == null && other.vendorID != null) || (this.vendorID != null && !this.vendorID.equals(other.vendorID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "src.entities.Vendors[ vendorID=" + vendorID + " ]";
    }
    
}
