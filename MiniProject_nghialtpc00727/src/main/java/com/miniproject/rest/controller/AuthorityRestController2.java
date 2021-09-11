package com.miniproject.rest.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.miniproject.entity.Account;
import com.miniproject.entity.Authority;
import com.miniproject.service.AuthorityService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/authorities2")
public class AuthorityRestController2 {
	@Autowired
	AuthorityService authorityService;
	
	@DeleteMapping("{username}")
	public void delete1(@PathVariable("username") String username) {
		authorityService.deleteByUsername(username);
	}
}