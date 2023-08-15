package com.bootcamp.restCrud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.bootcamp.restCrud.model.Employee;

import com.bootcamp.restCrud.repository.EmployeeRepository;

@RestController
@RequestMapping("api/v1")
public class EmployeeController {
  @Autowired
  private EmployeeRepository employeeRepository;

  @GetMapping("/")
  public String displayWelcome() {
    return "Welcome to rest API integrated with MYSQL database";
  }

  @PostMapping("/employees")
  public Employee createEmployee(@RequestBody Employee employee) {
    return employeeRepository.save(employee);
  }

  @GetMapping("/employees")
  public List<Employee> displayEmployee() {
    return employeeRepository.findAll();
  }

  @GetMapping("/employees/{id}")
  public Employee searchEmployee(@PathVariable int id) {
    return employeeRepository.findById(id).get();
  }

  @DeleteMapping("/employees/{id}")
  public String deleteEmployee(@PathVariable int id) {
    employeeRepository.deleteById(id);
    return "employee deleted successfully";
  }
}
