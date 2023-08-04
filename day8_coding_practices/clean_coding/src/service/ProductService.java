

import java.util.ArrayList;

import day8_coding_practices.clean_coding.model.Product;
import src.util.AppConstants;

public class ProductService {

  private ArrayList<Product> products = new ArrayList<Product>();

  public String addProduct(Product product) {
    products.add(product);
    return AppConstants.INSERTED_INFO;
  }

  public ArrayList<Product> getAllProduct() {
    return products;
  }

  public ArrayList<Product> getProductByCategory(String category) {
    ArrayList<Product> productsByCategory = new ArrayList<Product>();
    for (Product product : products) {
      if (product.getCategory().equalsIgnoreCase(category)) {
        productsByCategory.add(product);
      }
    }
    System.out.println(productsByCategory);
    return productsByCategory;
  }

}
