package com.bootcamp.restCrud.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bootcamp.restCrud.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
}