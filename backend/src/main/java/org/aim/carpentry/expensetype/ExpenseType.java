package org.aim.carpentry.expensetype;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "expense_types")
public class ExpenseType {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "expense_type_id")
    private Integer id;

    @Column(name = "expense_type")
    private String expensetype;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

	public String getExpensetype() {
		return expensetype;
	}

	public void setExpensetype(String expensetype) {
		this.expensetype = expensetype;
	}

    
    }

