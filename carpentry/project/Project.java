package org.aim.carpentry.project;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "projects")
public class Project {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "project_id")
    private Integer id;

    @Column(name = "project_code")
    private String projectCode;

    @Column(name = "project_desc")
    private String projectDescription;

    @Column(name = "status_id")
    private Integer statusId;

    @Column(name = "client_id")
    private Integer clientId;

    @Column(name = "client_project_number")
    private Integer clientProjectNumber;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode;
    }

    public String getProjectDescription() {
        return projectDescription;
    }

    public void setProjectDescription(String projectDescription) {
        this.projectDescription = projectDescription;
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public Integer getClientProjectNumber() {
        return clientProjectNumber;
    }

    public void setClientProjectNumber(Integer clientProjectNumber) {
        this.clientProjectNumber = clientProjectNumber;
    }


    
}