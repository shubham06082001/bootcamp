package com.bootcamp.restCrud.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bootcamp.restCrud.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
  
}
