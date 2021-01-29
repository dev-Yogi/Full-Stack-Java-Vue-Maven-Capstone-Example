package org.aim.carpentry.markup;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/markup")

public class MarkupController {
    
    @Autowired
    private MarkupRepository markupRepository;

    @GetMapping
    public Iterable<Markup> getAllMarkups() {
        return markupRepository.findAll();
    }

}