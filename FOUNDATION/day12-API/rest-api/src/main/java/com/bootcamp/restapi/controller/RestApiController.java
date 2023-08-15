package com.bootcamp.restapi.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class RestApiController {

  @GetMapping("/message")
  public String displayWelcome() {
    return "Welcome to rest API";
  }

  @GetMapping("/")
  public String displayMessageString() {
    return "Welcome to rest API -- hello world";
  }

  @GetMapping("/home")
  public String home() {
    return "HOME API";
  }

  @GetMapping("/product")
  public String product() {
    return "Product API";
  }

}
