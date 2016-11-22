package com.niit.myproject.dao;
import java.util.List;

import com.niit.myproject.model.Product;
public interface ProductDAO {
	public List<Product> getAll();

	public Product getProductById(String id);
	public void removeProduct(String id);
	public  void addProduct(Product product);
	public void updateProduct(Product product);

public List<Product> getProductByCategory(String cate);


	 
	  


}
