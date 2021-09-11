package com.miniproject.service;

import java.util.List;
import com.miniproject.entity.Product;

public interface ProductService {

	List<Product> findAll();

	Product findById(Integer id);

	List<Product> findByCategoryId(String cid);

	Product create(Product product);

	Product update(Product product);

	void delete(Integer id);

	List<Object[]> findTop10();

	List<Object[]> findTop10Loai();

	List<Object[]> findDoanhThu();

}
