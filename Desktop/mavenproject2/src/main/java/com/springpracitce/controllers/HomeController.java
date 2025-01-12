
package com.springpracitce.controllers;


import com.springpracitce.entity.Student;
import com.springpracitce.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class HomeController {
    
    @Autowired
    private StudentService studentService;
    
    @RequestMapping(value="/home", method = RequestMethod.GET)
    public String requestHandler(){
       
        System.out.println("HomeController activated");
        return "home";
    }
    @RequestMapping("/example")
    public String example(@ModelAttribute("Student") Student student, Model m){
        m.addAttribute("user",student);
        System.out.println("inside example request mapping");
        this.studentService.saveStudent(student);
        return "example";
    }
     
}
