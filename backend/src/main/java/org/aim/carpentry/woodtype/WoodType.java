package org.aim.carpentry.woodtype;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.aim.carpentry.woodspecies.WoodSpecies;

@Entity
@Table(name = "wood_types")
public class WoodType {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "wood_type_id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "wood_species_id", nullable = false)
    private WoodSpecies woodspecies;

    @Column(name = "variety")
    private String woodVariety;

    @Column(name = "thickness_of_wood")
    private String woodThickness;

    @Column(name = "size")
    private String woodSize;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    

    public String getWoodVariety() {
        return woodVariety;
    }

    public void setWoodVariety(String woodVariety) {
        this.woodVariety = woodVariety;
    }

    public String getWoodThickness() {
        return woodThickness;
    }

    public void setWoodThickness(String woodThickness) {
        this.woodThickness = woodThickness;
    }

    public String getWoodSize() {
        return woodSize;
    }

    public void setWoodSize(String woodSize) {
        this.woodSize = woodSize;
    }

    public WoodSpecies getWoodspecies() {
        return woodspecies;
    }

    public void setWoodspecies(WoodSpecies woodspecies) {
        this.woodspecies = woodspecies;
    }


    }

