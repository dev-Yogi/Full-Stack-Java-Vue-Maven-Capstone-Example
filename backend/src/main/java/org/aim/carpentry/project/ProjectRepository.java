package org.aim.carpentry.project;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface ProjectRepository extends CrudRepository<Project, Integer>{
    @Transactional
    @Modifying(clearAutomatically = true)
    @Query("UPDATE Project p SET p.status.id = :statusId WHERE p.id = :id")
    int updateStatus(@Param("id") int id, @Param("statusId") Integer statusId);
}