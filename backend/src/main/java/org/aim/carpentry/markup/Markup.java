package org.aim.carpentry.markup;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.aim.carpentry.referral.Referral;

@Entity
@Table(name = "markup")
public class Markup {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "markup_id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "referral_id", nullable = false)
    private Referral referral;

    @Column(name = "markup")
    private String markup;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMarkup() {
        return markup;
    }

    public void setMarkup(String markup) {
        this.markup = markup;
    }

    

}