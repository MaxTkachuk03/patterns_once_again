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
  String credit(Credit credit);
  String deposit(Deposit deposit);
}

//! Concrete Visitor
class Person implements IClient{
  int age;
  String name;

  Person({
    required this.name, 
    required this.age
  });

  @override
  String credit(Credit credit) {
    return "Фізична особа $name віком $age";
  }

  @override
  String deposit(Deposit deposit) {
    return "Фізична особа $name віком $age";
  }
}

//! Concrete Visitor
class Company implements IClient{
  String name;
  int number;

  Company({
    required this.name, 
    required this.number
  });

  @override
  String credit(Credit credit) {
    return "Юридична особа $name з номером державної реєстрації $number";
  }

  @override
  String deposit(Deposit deposit) {
    return "Юридична особа $name з номером державної реєстрації $number";
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
    print("${visitor.credit(this)} бере кредит під 20%");
  }
}

//# Concrete Element
class Deposit implements BankSystem{
  @override
  void accept(IClient visitor) {
    print("${visitor.deposit(this)} кладе гроші на депозит під 10%");
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