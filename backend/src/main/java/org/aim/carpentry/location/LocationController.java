package org.aim.carpentry.location;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/locations")

public class LocationController {
    
    @Autowired
    private LocationRepository locationRepository;

    @GetMapping
    public Iterable<Location> getAllLocations() {
        return locationRepository.findAll();
    }

}