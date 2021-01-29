package org.aim.carpentry.woodtype;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/woodtypes")

public class WoodTypeController {
    
    @Autowired
    private WoodTypeRepository woodTypeRepository;

    @GetMapping
    public Iterable<WoodType> getAllWoodTypes() {
        return woodTypeRepository.findAll();
    }

}