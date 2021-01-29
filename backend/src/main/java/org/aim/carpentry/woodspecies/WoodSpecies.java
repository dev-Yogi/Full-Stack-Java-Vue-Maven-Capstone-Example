package org.aim.carpentry.woodspecies;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "wood_species")
public class WoodSpecies {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "wood_species_id")
    private Integer id;

    @Column(name = "wood_species")
    private String woodType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWoodType() {
        return woodType;
    }

    public void setWoodType(String woodType) {
        this.woodType = woodType;
    }

    }

