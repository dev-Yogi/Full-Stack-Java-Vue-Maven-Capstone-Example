package org.aim.carpentry.status;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/statuses")

public class StatusController {
    
    @Autowired
    private StatusRepository statusRepository;

    @GetMapping
    public Iterable<Status> getAllStatuses() {
        return statusRepository.findAll();
    }

}