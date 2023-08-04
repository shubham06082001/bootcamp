import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Stack;

public class Listing {
  public static void main(String[] Args) {
    List<Integer> list = new ArrayList(); // List is an interface

    list.add(1);
    list.add(2);
    list.add(3);
    list.add(4);
    list.add(5);

    System.out.println(list);

    list.set(2, 1000);

    System.out.println(list);

    System.out.println(list.contains(2));

    for (Integer el : list) {
      System.out.println("element is: " + el);
    }

    Iterator<Integer> it = list.iterator();

    while (it.hasNext()) {
      System.out.println("iterator: " + it.next());
    }

    Stack<String> animals = new Stack<>();
    animals.push("Lion");
    animals.push("Dog");
    animals.push("Horse");
    animals.push("Cat");
    System.out.println("Stack" + animals);
    System.out.println(animals.peek());

  }
}
