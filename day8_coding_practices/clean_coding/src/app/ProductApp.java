package day8_coding_practices.clean_coding.src.service.ProductService;

import java.util.ArrayList;
import java.util.Scanner;

import day8_coding_practices.clean_coding.model.Product;

public class ProductApp {
  public static void main(String[] args) {

    ProductService productService = new ProductService();

    Scanner sc = new Scanner(System.in);

    System.out.println("Enter the number of products to be added");
    int size = sc.nextInt();

    for (int i = 0; i < sc.nextInt(); i++) {

      System.out.println("Enter the product id");
      int id = sc.nextInt();
      System.out.println("Enter the product name");
      String name = sc.next();
      System.out.println("Enter the product category");
      String category = sc.next();
      System.out.println("Enter the product price");
      int price = sc.nextInt();

      Product product = new Product(id, name, category, price);
      productService.addProduct(product);

    }

    ArrayList<Product> products = productService.getAllProduct();

    for (Product product : products) {
      System.out.println(product);
    }
  }
}
