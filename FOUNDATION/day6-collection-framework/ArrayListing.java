import java.util.ArrayList;

public class ArrayListing {
  public static void main(String[] Args) {
    String[] studentsName = new String[5];

    studentsName[0] = "Rakesh";
    studentsName[4] = "Raman";

    for (int i = 0; i < studentsName.length; i++) {
      System.out.println(studentsName[i]);
    }

    ArrayList<String> studentsNameList = new ArrayList<String>();

    // size -> n -> n + (n/2) + 1 -> ...

    studentsNameList.add("Rakesh");
    studentsNameList.add("Roman");
    studentsNameList.add("Rakesh");
    studentsNameList.add("Ram");
    System.out.println(studentsNameList.size());
    studentsNameList.add(1, "Raman");
    System.out.println(studentsNameList.size());

    ArrayList<String> list1 = new ArrayList<String>();
    list1.addAll(studentsNameList);
    System.out.println(list1.size());
    System.out.println(list1.get(2));

    list1.remove(2);
    System.out.println(list1);

    list1.remove(3);
    System.out.println(list1);
  }
}
