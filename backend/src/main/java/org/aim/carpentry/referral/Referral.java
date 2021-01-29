package org.aim.carpentry.referral;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "referrals")
public class Referral {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "referral_id")
    private Integer id;

    @Column(name = "referral_type")
    private String referral;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getReferral() {
        return referral;
    }

    public void setReferral(String referral) {
        this.referral = referral;
    }

}