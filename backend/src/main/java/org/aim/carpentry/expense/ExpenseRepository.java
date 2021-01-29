package org.aim.carpentry.expense;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface ExpenseRepository extends CrudRepository<Expense, Integer>{
    @Query(value="select e.* from expenses e where e.project_id=?1",
    nativeQuery = true)
    Iterable<Expense> findByProjectId(@Param("projectId") Integer projectId);
}