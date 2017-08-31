package com.kgfsl.springbootconfig.controller;

import java.lang.*;

import com.kgfsl.springbootconfig.model.Employee;
import com.kgfsl.springbootconfig.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = { "/employee1" })
public class EmployeeController {
    EmployeeController employeecontroller;

    @Autowired
    private EmployeeRepository employeeRepository;

    @RequestMapping(value = "/all")
    public String index(Model model) {
        System.out.println(employeeRepository.findAll());
        model.addAttribute("employees", employeeRepository.findAll());
        return "employee/employee";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(Employee employee) {
        employeeRepository.save(employee);
        if (employee.getId() == 0) {
            this.employeeRepository.save(employee);
        } else {
        }

        return "redirect:all";
    }

    @RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("employee", employeeRepository.findOne(id));
        return "employee/employee";
    }

    @RequestMapping(value = "{id}")
    public String Delete(@PathVariable("id") Integer id) {
        employeeRepository.delete(id);
        return "redirect:all";
    }
}