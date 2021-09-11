package com.miniproject.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.miniproject.entity.Product;

public interface ProductDAO extends JpaRepository<Product, Integer> {
	
	@Query("SELECT p FROM Product p WHERE p.category.id=?1")
	List<Product> findByCategoryId(String cid);
	
	@Query(value = "SELECT Top 10 p.Id, p.Name, SUM(o.Quantity) AS soLuong\r\n" + 
			"FROM OrderDetails o join Products p on o.ProductId = p.Id\r\n" + 
			"GROUP BY p.Id, p.Name\r\n" + 
			"order by soLuong desc", nativeQuery = true)
	List<Object[]> findTop10();
	
	@Query(value = "SELECT Top 10 cate.Name, SUM(o.Quantity) AS soLuong, SUM(o.Price) AS tongTien\r\n" + 
			"FROM OrderDetails o INNER JOIN Products p  on o.ProductId = p.Id INNER JOIN\r\n" + 
			" Orders od on od.Id = o.OrderId INNER JOIN Categories cate on cate.Id = p.CategoryId\r\n" + 
			"GROUP BY cate.Name\r\n" + 
			"order by soLuong desc", nativeQuery = true)
	List<Object[]> findTop10Loai();
	
	@Query(value = "SELECT \r\n" + 
			"	   SUM(o.Quantity) AS SpDaBanRa, \r\n" + 
			"	   SUM(o.Price) AS TongTienThuDuoc\r\n" + 
			"FROM				 OrderDetails o ", nativeQuery = true)
	List<Object[]> findDoanhThu();
}
