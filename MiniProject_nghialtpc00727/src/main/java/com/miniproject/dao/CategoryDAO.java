package com.miniproject.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.miniproject.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, String> {

}
