package org.aim.carpentry.tasks;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/tasks")

public class TaskController {
    
    @Autowired
    private TaskRepository taskRepository;

    @GetMapping
    public Iterable<Task> getAllTasks() {
        return taskRepository.findAll();
    }

}