package com.bootcamp.restapi.controller;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bootcamp.restapi.model.Employee;

@RestController
@RequestMapping("/api/v1")
public class EmployeeController {
  ArrayList<Employee> employees = new ArrayList<Employee>();

  public EmployeeController() {
    employees.add(new Employee(1, "Sachin", "hr", 45000, 23));
    employees.add(new Employee(1, "John", "media", 45000, 23));
    employees.add(new Employee(1, "Alibaba", "java developer", 45000, 23));
  }

  @PostMapping("/employee")
  public String addEmployee(@RequestBody Employee employee) {
    employees.add(employee);
    return "employee added successfully!";
  }

  @GetMapping("/employee")
  public ArrayList<Employee> getAllEmployees() {
    return employees;
  }

  @GetMapping("")
}
