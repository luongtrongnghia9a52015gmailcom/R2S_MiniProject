package com.miniproject.service;

import java.util.List;

import com.miniproject.entity.Authority;

public interface AuthorityService {

	List<Authority> findAuthoritiesOfAdministrators();

	List<Authority> findAll();

	Authority create(Authority auth);

	void delete(Integer id);

	void deleteByUsername(String username);
}
