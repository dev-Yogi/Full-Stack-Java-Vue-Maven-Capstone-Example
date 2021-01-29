package org.aim.carpentry.revenue;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface RevenueRepository extends CrudRepository<Revenue, Integer>{
    @Query(value="select r.* from revenues r where r.project_id=?1",
    nativeQuery = true)
    Iterable<Revenue> findByProjectId(@Param("projectId") Integer projectId);
}