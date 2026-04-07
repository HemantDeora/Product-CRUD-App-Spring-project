package productcrud.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import productcrud.dao.ProductDao;
import productcrud.model.Product;

@Controller
public class MainController {
	
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/add-product")
	public String addProduct(Model m) {
		m.addAttribute("title", "Add Product");
		return "add_product";
	}
	
	@RequestMapping(value = "/save-product", method = RequestMethod.POST)
	public RedirectView saveProduct(@ModelAttribute Product product, HttpServletRequest request) {
		System.out.println(product);
		productDao.createProduct(product);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}
	
@RequestMapping("/view-product")
	public String viewProducts(Model model) {
	List<Product> products = productDao.getAllProducts();
	model.addAttribute("products", products);
         
	    model.addAttribute("title", "View Products");
	  

	    return "view-product";
	}

@RequestMapping("delete/{id}")
public RedirectView deleteProduct(@PathVariable("id") int id, HttpServletRequest request) {	
	this.productDao.deteleProductById(id);
	RedirectView redirectView = new RedirectView();
	redirectView.setUrl(request.getContextPath() + "/view-product");
	return redirectView;
	 

}
}
