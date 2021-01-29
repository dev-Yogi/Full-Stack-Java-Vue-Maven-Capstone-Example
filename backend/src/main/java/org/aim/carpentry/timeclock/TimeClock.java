package org.aim.carpentry.timeclock;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.aim.carpentry.project.Project;
import org.aim.carpentry.tasks.Task;

@Entity
@Table(name = "timeclock")
public class TimeClock {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "time_id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name="project_id")
    private Project project;

    @ManyToOne
    @JoinColumn(name="task_id")
    private Task task;

    @Column(name = "time_logged")
    private String timelogged;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public String getTimelogged() {
        return timelogged;
    }

    public void setTimelogged(String timelogged) {
        this.timelogged = timelogged;
    }
    
    

    
    }

