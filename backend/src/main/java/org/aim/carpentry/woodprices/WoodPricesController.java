package org.aim.carpentry.woodprices;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/woodprices")

public class WoodPricesController {
    
    @Autowired
    private WoodPricesRepository woodPricesRepository;

    @GetMapping
    public Iterable<WoodPrices> getAllWoodPrices() {
        return woodPricesRepository.findAll();
    }

}