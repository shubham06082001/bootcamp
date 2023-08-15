class Human {
  void greet() {
    System.out.println("Human hello");
  }

  void meet() {
    System.out.println("Human meeting started...");
  }
}

class Person extends Human {
  Person() {
    System.out.println("Person class constructor");
  }

  void greet() {
    super.greet();
    System.out.println("Person hello");
  }
}

class Employee extends Person {
  Employee() {
    System.out.println("Employee class constructor");
  }
}

public class Inheritance {
  public static void main(String[] args) {
    Person p = new Person();
    Employee e = new Employee();
    p.greet();
    e.greet();
  }
}
