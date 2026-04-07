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
import org.springframework.web.bind.annotation.RequestParam;
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
        productDao.createProduct(product);

        return new RedirectView(request.getContextPath() + "/view-product");
    }

    @RequestMapping("/view-product")
    public String viewProducts(Model model) {
        List<Product> products = productDao.getAllProducts();
        model.addAttribute("products", products);
        return "view-product";
    }


    @RequestMapping("delete/{id}")
    public RedirectView deleteProduct(@PathVariable("id") int id, HttpServletRequest request) {
        this.productDao.deteleProductById(id);
        return new RedirectView(request.getContextPath() + "/view-product");
    }

    
    @RequestMapping("/update/{id}")
    public String updateForm(@PathVariable("id") int id, Model model) {
        Product product = this.productDao.getProductById(id);
        model.addAttribute("product", product);
        return "update_product";
    }

    
    @RequestMapping(value = "/update-product", method = RequestMethod.POST)
    public RedirectView updateProduct(@ModelAttribute Product product, HttpServletRequest request) {

        this.productDao.updateProduct(product);

        return new RedirectView(request.getContextPath() + "/view-product");
    }
    
    @RequestMapping("/search")
    public String search(@RequestParam("keyword") String keyword, Model m) {

        List<Product> products = productDao.searchProduct(keyword);

        m.addAttribute("products", products);

        return "view-product";
    }
    @RequestMapping("/sort")
    public String sort(@RequestParam("type") String type, Model m) {

        List<Product> products = productDao.sortProduct(type);

        m.addAttribute("products", products);

        return "view-product";
    }
    @RequestMapping("/filter")
    public String filter(
            @RequestParam("keyword") String keyword,
            @RequestParam("min") double min,
            @RequestParam("max") double max,
            Model m) {

        List<Product> products = productDao.filterProduct(keyword, min, max);

        m.addAttribute("products", products);

        return "view-product";
    }
}