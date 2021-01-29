package org.aim.carpentry.project;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/projects")

public class ProjectController {
    
    @Autowired
    private ProjectRepository projectRepository;

    @GetMapping(path = "")
    public @ResponseBody Iterable<Project> getAllProjects() {
        return projectRepository.findAll();
    }

    @GetMapping(path = "/{id}")
    public @ResponseBody Project getProject(@PathVariable (value = "id") Integer id) {
        Optional<Project> project = projectRepository.findById(id);
        return project.get();
    }

    @PutMapping(path = "/{id}")
    public @ResponseBody String updateProject(@PathVariable(value = "id") Integer id, @RequestBody Project projectDetails) {
        Optional<Project> optionalProject = projectRepository.findById(id);
        Project project = optionalProject.get();

        project.setProjectCode(projectDetails.getProjectCode());
        project.setProjectDescription(projectDetails.getProjectDescription());
        project.setStatusId(projectDetails.getStatusId());
        project.setClientId(projectDetails.getClientId());
        project.setClientProjectNumber(projectDetails.getClientProjectNumber());
        projectRepository.save(project);

        return "Updated";
    }

    @DeleteMapping(path = "/{id}")
    public @ResponseBody String deleteProject(@PathVariable(value = "id") Integer id) {
        projectRepository.deleteById(id);
        return "Deleted";
    }


    @PostMapping(path = "/")
    public Project createProject(@RequestBody Project project){
        return projectRepository.save(project);
    }

    }
