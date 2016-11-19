package com.niit.myproject.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.niit.myproject.dao.ProductDAO;
import com.niit.myproject.model.Product;

@Controller
public class AdminController {
@Autowired
	
	ProductDAO productdao;
	
	@RequestMapping("/admin")
	public String showAdmin()
	{
		return "admin";
	}
	@RequestMapping("/admin/productinventory")
	public String showProductInventory(Model model)
	{
		List<Product> products=productdao.getAll();
		model.addAttribute("products",products);
		return "productinventory";
	}
	@RequestMapping("/admin/productinventory/addproduct")
	public String addProduct(Model model)
	{
		Product product=new Product();
		product.setProductCategory("Mobile");
		model.addAttribute("product",product);
		
	 return "addproduct";	
	}

	@RequestMapping(value="/admin/productinventory/addproduct", method=RequestMethod.POST)
	public String addProductPost(@Valid @ModelAttribute("product") Product product,BindingResult result, HttpServletRequest request)
	{
		if(result.hasErrors())
		{
			return "addproduct";
		}
		productdao.addProduct(product);
				
		
		// ................................... multi part starts
		// here....................

		// need to have a transient field of type MultipartFile in Product
		// model class
		MultipartFile productImage = product.getFile();

		// only if file exist upload the image
		if(productImage!=null && productImage.getSize() > 0) {
				// first get the root directory and then append the directory where
				// you want to store
				String rootPath = request.getSession().getServletContext().getRealPath("/");
				String directoryPath = rootPath + "resources\\images\\product";
				// append the file name
				String filePath = directoryPath + File.separator + product.getProductid() + ".jpg";
				// ========================================================
				// If directory does not exist create the directory
				if (!Files.exists(Paths.get(directoryPath))) {
					try {
						// create the directories recursively
						Files.createDirectories(Paths.get(directoryPath));
					}

					catch (IOException ex) {
						ex.printStackTrace();
					}
				}
				// =======================================================
				// transfer the file

			try {
					productImage.transferTo(new File(filePath));
				} catch (Exception ex) {
					ex.printStackTrace();
				}

				// ................................... ends
				// here..................................				
		}
		
		
 return "redirect:/admin/productinventory";	
	}
//11/11/2016 starts	
@RequestMapping("/admin/productinventory/editproduct/{id}")
public String editProduct(@PathVariable("id")int id, Model model)
{
	Product product=productdao.getProductById(id);
	model.addAttribute(product);
	return "editproduct";
}

@RequestMapping(value="/admin/productinventory/editproduct" , method=RequestMethod.POST)
public String editProductPost(@Valid @ModelAttribute("product") Product product ,BindingResult result,Model model, HttpServletRequest request)
{
	if(result.hasErrors())
	{
		return "addproduct";
	}
	
	if (product.getProductid() == 0) {
		
		productdao.addProduct(product);
	// ................................... multi part starts
			// here....................

			// need to have a transient field of type MultipartFile in Product
			// model class
			MultipartFile productImage = product.getFile();

			// only if file exist upload the image
			if(productImage!=null && productImage.getSize() > 0) {
					// first get the root directory and then append the directory where
					// you want to store
					String rootPath = request.getSession().getServletContext().getRealPath("/");
					String directoryPath = rootPath + "resources\\images\\product";
					// append the file name
					String filePath = directoryPath + File.separator + product.getProductid() + ".jpg";
					// ========================================================
					// If directory does not exist create the directory
					if (!Files.exists(Paths.get(directoryPath))) {
						try {
							// create the directories recursively
							Files.createDirectories(Paths.get(directoryPath));
						}

						catch (IOException ex) {
							ex.printStackTrace();
						}
					}
					// =======================================================
					// transfer the file

				try {
						productImage.transferTo(new File(filePath));
					} catch (Exception ex) {
						ex.printStackTrace();
					}

					// ................................... ends
					// here..................................				
			}
			
	}
	else {
		// ................................... multi part starts
					// here....................

					// need to have a transient field of type MultipartFile in Product
					// model class
					MultipartFile productImage = product.getFile();

					// only if file exist upload the image
					if(productImage!=null && productImage.getSize() > 0) {
							// first get the root directory and then append the directory where
							// you want to store
							String rootPath = request.getSession().getServletContext().getRealPath("/");
							String directoryPath = rootPath + "resources\\images\\product";
							// append the file name
							String filePath = directoryPath + File.separator + product.getProductid() + ".jpg";
							// ========================================================
							// If directory does not exist create the directory
							if (!Files.exists(Paths.get(directoryPath))) {
								try {
									// create the directories recursively
									Files.createDirectories(Paths.get(directoryPath));
								}

								catch (IOException ex) {
									ex.printStackTrace();
								}
							}
							// =======================================================
							// transfer the file

						try {
								productImage.transferTo(new File(filePath));
							} catch (Exception ex) {
								ex.printStackTrace();
							}

							// ................................... ends
							// here..................................				
					}
		productdao.updateProduct(product);
	}
	return "redirect:/admin/productinventory";
}

	//11/11/2026 ends
	@RequestMapping(value={"/admin/productinventory/deleteproduct/{id}"})
	public String deleteProduct(@PathVariable int id,Model model) 
	{
		productdao.removeProduct(id);
		
		return "redirect:/admin/productinventory";
	}

}
