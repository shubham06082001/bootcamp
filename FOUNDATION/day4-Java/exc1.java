import java.util.Scanner;

public class exc1 {
  public static void main(String[] args) {
    int tableKey;
    Scanner scanner = new Scanner(System.in);
    System.out.print("Enter the integer:");
    tableKey = scanner.nextInt();

    for (int i = 1; i <= 10; i++) {
      System.out.println(tableKey + " * " + i + " = " + tableKey * i);
    }
  }
}
