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
		return this.hibernateTemplate.loadAll(Product.class);
	}

	// detele product by id
	@Transactional
	public void deteleProductById(int id) {
		Product product = this.hibernateTemplate.load(Product.class, id);
		this.hibernateTemplate.delete(product);
	}

	// get single product by id

	public Product getProductById(int id) {
		return this.hibernateTemplate.get(Product.class, id);
	}

	@Transactional
	public void updateProduct(Product product) {
		this.hibernateTemplate.update(product);
	}

	public List<Product> searchProduct(String keyword) {

		String query = "from Product where name like :key or description like :key";

		return (List<Product>) hibernateTemplate.findByNamedParam(query, "key", "%" + keyword + "%");
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> filterProduct(String keyword, double minPrice, double maxPrice) {

	    String query = "from Product where "
	            + "(name like ? or description like ?) "
	            + "and price between ? and ?";

	    return (List<Product>) hibernateTemplate.find(
	            query,
	            "%" + keyword + "%",
	            "%" + keyword + "%",
	            minPrice,
	            maxPrice
	    );
	}
	
	 @SuppressWarnings("unchecked")
	    public List<Product> sortProduct(String type) {

	        String query = "";

	        if (type.equals("low")) {
	            query = "from Product order by price asc";
	        } else if (type.equals("high")) {
	            query = "from Product order by price desc";
	        } else {
	            query = "from Product order by name asc";
	        }

	        return (List<Product>) hibernateTemplate.find(query);
	    }

}