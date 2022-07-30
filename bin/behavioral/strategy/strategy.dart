void main(List<String> args) {
  PaymentSystem system = PaymentSystem();
  system.setStartegy(BankTransfer());

  system.doSomething(51, 7);

  print("\nМіняємо спосіб оплати...");
  print("="*30);
  
  system.setStartegy(Cash());

  system.doSomething(5, 0.1);

  print("\nМіняємо спосіб оплати...");
  print("="*30);

  system.setStartegy(MobilePayment());

  system.doSomething(700, 23);

  print("\nМіняємо спосіб оплати...");
  print("="*30);

  system.setStartegy(CreditCard());

  system.doSomething(300, 0.5);
}

//! Context
class PaymentSystem{
  PaymentMethods? pay;

  void setStartegy(PaymentMethods methods){
    pay = methods;
  }

  void doSomething(double a,double b){
    print("Сума: ${pay?.execute(a, b)}");
  }
}

//# Strategy
abstract class PaymentMethods{
  double execute(double a,double b);
}

//$ Concrete Strategys:
// Банківський переказ (+)
class BankTransfer implements PaymentMethods{
  @override
  double execute(double a, double b) {
    print("Розрахунок банківським переказом....");
    return a+b;
  }
}

// Mобільний платіж (-)
class MobilePayment implements PaymentMethods{
  @override
  double execute(double a, double b) {
    print("Розрахунок за допомогою мобільного....");
    return a-b;
  }
}

// Готівка (*)
class Cash implements PaymentMethods{
  @override
  double execute(double a, double b) {
    print("Розрахунок готівкою....");
    return a*b;
  }
}

// Кредитна карта (/)
class CreditCard implements PaymentMethods{
  @override
  double execute(double a, double b) {
    print("Розрахунок кредитною картою....");
    return a/b;
  }
}