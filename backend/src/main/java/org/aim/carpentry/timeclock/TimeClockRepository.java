package org.aim.carpentry.timeclock;

import org.springframework.data.repository.CrudRepository;

public interface TimeClockRepository extends CrudRepository<TimeClock, Integer>{
    
}