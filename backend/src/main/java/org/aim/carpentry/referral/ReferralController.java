package org.aim.carpentry.referral;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/referrals")

public class ReferralController {
    
    @Autowired
    private ReferralRepository referralRepository;

    @GetMapping
    public Iterable<Referral> getAllReferrals() {
        return referralRepository.findAll();
    }

}