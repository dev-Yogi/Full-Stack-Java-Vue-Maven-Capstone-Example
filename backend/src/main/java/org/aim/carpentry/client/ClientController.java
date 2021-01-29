package org.aim.carpentry.client;

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
@RequestMapping(path = "/api/clients")

public class ClientController {
    
    @Autowired
    private ClientRepository clientRepository;

    @GetMapping(path = "")
    public @ResponseBody Iterable<Client> getAllClients() {
        return clientRepository.findAll();
    }

    @GetMapping(path = "/{id}")
    public @ResponseBody Client getClient(@PathVariable (value = "id") Integer id) {
        Optional<Client> client = clientRepository.findById(id);
        return client.get();
    }

    @GetMapping(path = "/search/{keyword}")
    public @ResponseBody Iterable<Client> search(@PathVariable (value = "keyword") String keyword) {
        return clientRepository.search(keyword);
    }

    @PostMapping(path = "/")
    public @ResponseBody String createClient(@RequestBody Client client) {
        clientRepository.save(client);
        return "Saved";
    }

    @PutMapping(path = "/{id}")
    public @ResponseBody String updateClient(@PathVariable(value = "id") Integer id, @RequestBody Client clientDetails) {
        Optional<Client> optionalClient = clientRepository.findById(id);
        Client client = optionalClient.get();

        client.setClientCode(clientDetails.getClientCode());
        client.setFirstName(clientDetails.getFirstName());
        client.setLastName(clientDetails.getLastName());
        client.setEmailAddress(clientDetails.getEmailAddress());
        client.setPhoneNumber(clientDetails.getPhoneNumber());
        clientRepository.save(client);

        return "Updated";
    }

    @DeleteMapping(path = "/{id}")
    public @ResponseBody String deleteClient(@PathVariable(value = "id") Integer id) {
        clientRepository.deleteById(id);
        return "Deleted";
    }

}