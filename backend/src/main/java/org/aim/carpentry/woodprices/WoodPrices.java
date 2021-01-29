package org.aim.carpentry.woodprices;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.aim.carpentry.location.Location;
import org.aim.carpentry.woodtype.WoodType;

@Entity
@Table(name = "wood_prices")
public class WoodPrices {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "wood_price_id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "wood_type_id", nullable = false)
    private WoodType woodtype;

    @Column(name = "price_per_unit")
    private BigDecimal pricePerUnit;

    @Column(name = "unit_type")
    private String unitType;

    @ManyToOne
    @JoinColumn(name = "location_id", nullable = false)
    private Location location;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUnitType() {
        return unitType;
    }

    public void setUnitType(String unitType) {
        this.unitType = unitType;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public BigDecimal getPricePerUnit() {
        return pricePerUnit;
    }

    public void setPricePerUnit(BigDecimal pricePerUnit) {
        this.pricePerUnit = pricePerUnit;
    }

    public WoodType getWoodtype() {
        return woodtype;
    }

    public void setWoodtype(WoodType woodtype) {
        this.woodtype = woodtype;
    }

    
}