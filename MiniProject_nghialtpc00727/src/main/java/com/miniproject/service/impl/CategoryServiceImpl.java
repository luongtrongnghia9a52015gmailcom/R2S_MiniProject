package com.miniproject.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miniproject.dao.CategoryDAO;
import com.miniproject.entity.Category;
import com.miniproject.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	CategoryDAO cdao;
	
	@Override
	public List<Category> findAll() {
		return cdao.findAll();
	}

}
