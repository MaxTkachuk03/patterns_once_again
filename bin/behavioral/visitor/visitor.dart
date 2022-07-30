// Дана техніка ще називається подвійною диспетчеризацією (double dispatch), 
// коли виконання операції залежить від імені запиту та двох типів одержувачів 
// (об'єкт Visitor та об'єкт Element).
void main(List<String> args) {
  // IClient client = Person(name: "Іван", age: 19);

  // client.credit(Credit());

  Bank bank = Bank();

  bank.addProcedure(Credit());
  bank.addProcedure(Deposit());

  bank.go(Person(name: "Іван", age: 19));

  print("="*100);

  bank.go(Company(name: "Nike", number: 44341571713));
}

//! Visitor
abstract class IClient{
  void credit(Credit credit);
  void deposit(Deposit deposit);
}

//! Concrete Visitor
class Person implements IClient{
  int age;
  String name;

  Person({required this.name, required this.age});

  @override
  void credit(Credit credit) {
    print("Фізична особа $name віком $age бере кредит під 15%");
  }

  @override
  void deposit(Deposit deposit) {
    print("Фізична особа $name віком $age кладе гроші на депозит під 10%");
  }
}

//! Concrete Visitor
class Company implements IClient{
  String name;
  int number;

  Company({required this.name, required this.number});

  @override
  void credit(Credit credit) {
    print("Юридична особа $name з номером державної реєстрації $number бере кредит під 25%");
  }

  @override
  void deposit(Deposit deposit) {
    print("Юридична особа $name з номером державної реєстрації $number кладе гроші на депозит під 15%");
  }
}

//# Element
abstract class BankSystem{
  void accept(IClient visitor);
}

//# Concrete Element
class Credit implements BankSystem{
  @override
  void accept(IClient visitor) {
    visitor.credit(this);
  }
}

//# Concrete Element
class Deposit implements BankSystem{
  @override
  void accept(IClient visitor) {
    visitor.deposit(this);
  }
}

class Bank{
  List<BankSystem> clients = [];

  void addProcedure(BankSystem client){
    clients.add(client);
  }

  void kickProcedure(BankSystem client){
    clients.remove(client);
  }

  void go(IClient system){
    for(BankSystem b in clients){
      b.accept(system);
    }
  }
}