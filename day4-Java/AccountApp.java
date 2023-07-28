class account {
  int balance;

  account(int balance) {
    this.balance = balance;
  }

  void deposit(int amount) {
    balance += amount;
    System.out.println("Amount deposited: " + amount);
    alert();
  }

  void withdraw(int amount) {
    if (balance >= amount) {
      balance -= amount;
      System.out.println("Amount withdrawn: " + amount);
    } else {
      System.out.println("Insufficient balance");
    }
    alert();
  }

  void display() {
    System.out.println("Balance: " + balance);
    alert();
  }

  void alert() {
    String msg = "";
    if (balance <= 1000) {
      msg = "Low balance";
      System.err.println(msg);
    }
  }
}

public class AccountApp {
  public static void main(String[] args) {
    account acc = new account(0);
    // acc.deposit(10000);
    // acc.display();
    // acc.withdraw(3000);
    // acc.display();
    // acc.withdraw(6000);
    acc.display();
  }
}
