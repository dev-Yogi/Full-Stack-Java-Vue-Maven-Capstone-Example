package org.aim.carpentry.revenuetype;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "revenue_types")
public class RevenueType {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "revenue_type_id")
    private Integer id;

    @Column(name = "revenue_type")
    private String revenuetype;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRevenuetype() {
        return revenuetype;
    }

    public void setRevenuetype(String revenuetype) {
        this.revenuetype = revenuetype;
    }

	

    
    }

