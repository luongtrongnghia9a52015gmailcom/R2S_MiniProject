package com.miniproject.service;

import java.util.List;

import com.miniproject.entity.Account;

public interface AccountService {
	Account findById(String username);

	List<Account> getAdministrators();

	List<Account> findAll();

	Account create(Account taikhoan);

	Account update(Account account);

	void delete(String username);

}
