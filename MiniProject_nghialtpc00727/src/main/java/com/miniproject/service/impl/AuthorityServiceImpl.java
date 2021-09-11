package com.miniproject.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miniproject.dao.AccountDAO;
import com.miniproject.dao.AuthorityDAO;
import com.miniproject.entity.Account;
import com.miniproject.entity.Authority;
import com.miniproject.service.AuthorityService;

@Service
public class AuthorityServiceImpl implements AuthorityService{
	@Autowired
	AuthorityDAO dao;
	
	@Autowired
	AccountDAO adao;
	
	@Override
	public List<Authority> findAuthoritiesOfAdministrators() {
		List<Account> accounts = adao.getAdministrators();
		return dao.authoritiesOf(accounts);
	}

	@Override
	public List<Authority> findAll() {
		return dao.findAll();
	}

	@Override
	public Authority create(Authority auth) {
		return dao.save(auth);
	}

	@Override
	public void delete(Integer id) {
		dao.deleteById(id);
	}

	@Override
	public void deleteByUsername(String username) {
		dao.delete(username);
	}
}
