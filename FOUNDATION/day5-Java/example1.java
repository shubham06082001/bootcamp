// import java.


class Parent {
  int id;

  public Parent(int id) {
    System.out.println("parent constructor id: " + id);
  }

  public Parent() {
    System.out.println("parent default constructor");
  }
}

class Child extends Parent {
  public Child() {
    super(10);
    System.out.println("child default constructor");
  }
}

public class example1 {
  public static void main(String[] args) {
    Child c1 = new Child();

  }
}
