package org.aim.carpentry.expensetype;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/expensetypes")

public class ExpenseTypeController {
    
    @Autowired
    private ExpenseTypeRepository expenseTypeRepository;

    @GetMapping
    public Iterable<ExpenseType> getAllExpenseTypes() {
        return expenseTypeRepository.findAll();
    }

}