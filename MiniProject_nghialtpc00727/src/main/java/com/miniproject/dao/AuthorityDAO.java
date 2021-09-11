package com.miniproject.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.miniproject.entity.Account;
import com.miniproject.entity.Authority;

public interface AuthorityDAO extends JpaRepository<Authority, Integer>{
	
	@Query("SELECT DISTINCT a FROM Authority a WHERE a.account IN ?1")
	List<Authority> authoritiesOf(List<Account> accounts);
	
	@Modifying
	@Transactional
	@Query("DELETE FROM Authority a WHERE a.account.username = ?1")
	void delete(String username);

}
