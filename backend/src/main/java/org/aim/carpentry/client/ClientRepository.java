package org.aim.carpentry.client;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface ClientRepository extends CrudRepository<Client, Integer>{
 
    @Query(value="select c.* from clients c where c.client_first_name like %?1% OR c.client_last_name like %?1%",
    nativeQuery = true)
    Iterable<Client> search(@Param("keyword") String keyword);
}