interface Bank {
  int id = 10;

  abstract float rateOfInterest();
}

class RBI {
  void hello() {
    System.out.println("Hello");
  }
}

class SBI implements Bank {
  @Override
  public float rateOfInterest() {
    return 9.15f;
  }
}

class Idly {
  void eat() {
    System.out.println("Eating Idly");
  }
}

class Dosa extends Idly {
  @Override
  void eat() {
    System.out.println("Eating Dosa");
  }
}

public class Interface {
  public static void main(String[] args) {
    Bank b = new SBI();
    System.out.println("ROI: " + b.rateOfInterest());
  }
}
