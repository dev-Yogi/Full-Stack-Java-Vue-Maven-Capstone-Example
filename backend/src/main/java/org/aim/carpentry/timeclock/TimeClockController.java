package org.aim.carpentry.timeclock;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/timeclock")

public class TimeClockController {
    
    @Autowired
    private TimeClockRepository timeClockRepository;

    @GetMapping
    public Iterable<TimeClock> getAllTimeClocks() {
        return timeClockRepository.findAll();
    }

}