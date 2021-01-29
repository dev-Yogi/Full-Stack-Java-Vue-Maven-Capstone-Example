package org.aim.carpentry.revenuetype;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/revenuetypes")

public class RevenueTypeController {
    
    @Autowired
    private RevenueTypeRepository revenueTypeRepository;

    @GetMapping
    public Iterable<RevenueType> getAllRevenueTypes() {
        return revenueTypeRepository.findAll();
    }

}