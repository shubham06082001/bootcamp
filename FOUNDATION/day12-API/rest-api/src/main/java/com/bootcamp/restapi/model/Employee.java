package com.bootcamp.restapi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Employee {
  private int id;
  private String name;
  private String dept;
  private int salary;
  private int age;

}
