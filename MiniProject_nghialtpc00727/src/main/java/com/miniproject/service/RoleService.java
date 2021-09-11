package com.miniproject.service;

import java.util.List;

import com.miniproject.entity.Role;

public interface RoleService {
	public List<Role> findAll();

	public Role findById(String string);
}
