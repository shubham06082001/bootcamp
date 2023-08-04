package day8_coding_practices.clean_coding.model;

public class Product {
  private int id;
  private String name;
  private String category;
  private int price;

  Product(int id, String name, String category, int price) {
    super();
    this.id = id;
    this.name = name;
    this.category = category;
    this.price = price;
  }

  public int getId() {
    return id;
  }

  public String getName() {
    return name;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }
}
