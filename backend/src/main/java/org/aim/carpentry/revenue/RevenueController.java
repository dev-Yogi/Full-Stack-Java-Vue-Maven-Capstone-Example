package org.aim.carpentry.revenue;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(path = "/api/revenues")

public class RevenueController {
    
    @Autowired
    private RevenueRepository revenueRepository;

    @GetMapping(path = "")
    public @ResponseBody Iterable<Revenue> getAllRevenues() {
        return revenueRepository.findAll();
    }

    @GetMapping(path = "/{id}")
    public @ResponseBody Revenue getRevenue(@PathVariable (value = "id") Integer id) {
        Optional<Revenue> revenue = revenueRepository.findById(id);
        return revenue.get();
    }

    @GetMapping(path = "/project/{id}")
    public @ResponseBody Iterable<Revenue> getRevenueByProjectId(@PathVariable (value = "id") Integer id) {
        Iterable<Revenue> revenues = revenueRepository.findByProjectId(id);
        return revenues;
    }

    @PostMapping(path = "/")
    public @ResponseBody String createExpense(@RequestBody Revenue revenue) {
        revenueRepository.save(revenue);
        return "Saved";
    }

    @PutMapping(path = "/{id}")
    public @ResponseBody String updateRevenue(@PathVariable(value = "id") Integer id, @RequestBody Revenue revenueDetails) {
        Optional<Revenue> optionalRevenue = revenueRepository.findById(id);
        Revenue revenue = optionalRevenue.get();

        revenue.setTransactionDate(revenueDetails.getTransactionDate());
        revenue.setTransactionDesc(revenueDetails.getTransactionDesc());
        revenue.setLocation(revenueDetails.getLocation());
        revenue.setRevenuetype(revenueDetails.getRevenuetype());
        revenue.setTransactionAmount(revenueDetails.getTransactionAmount());
        revenue.setProject(revenueDetails.getProject());
        revenueRepository.save(revenue);

        return "Updated";
    }

    @DeleteMapping(path = "/{id}")
    public @ResponseBody String deleteExpense(@PathVariable(value = "id") Integer id) {
        revenueRepository.deleteById(id);
        return "Deleted";
    }
}