package productcrud.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import productcrud.model.Product;

@Component
public class ProductDao {
    @Autowired
	private HibernateTemplate hibernateTemplate;
    
    // create product
    @Transactional
    public void createProduct(Product product) {
		this.hibernateTemplate.save(product);
    	
    }
    
    // get all products
    public List<Product> getAllProducts() {
      this.hibernateTemplate.loadAll(Product.class);
      return getAllProducts();
}
    
    //detele product by id
    @Transactional
    public void deteleProductById(int id) {
		Product product = this.hibernateTemplate.load(Product.class, id);
		this.hibernateTemplate.delete(product);
	}
    
    // get single product by id
    
    public Product getProductById(int id) {
    	return this.hibernateTemplate.get(Product.class, id);
    }

}