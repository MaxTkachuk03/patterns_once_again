void main(List<String> args) {
  Dollars dollars = Dollars();
  ATM ten = TenMoney(dollars.ten);
  ATM twenty = TewntyMoney(dollars.twenty);
  ATM fifty = Fiftymoney(dollars.fifty);
  ATM sto = OneHundredMoney(dollars.onehundred);

  ten.setNextATM(twenty);
  twenty.setNextATM(fifty);
  fifty.setNextATM(sto);

  ten.getMoney("не має такої кількості...", dollars.ten);
  print("="*40);
  ten.getMoney("закінчились...", dollars.twenty);
  print("="*40);
  ten.getMoney("не вистчаить....",dollars.fifty);
  print("="*40);
  ten.getMoney("все прекрасно, видаємо!",dollars.onehundred);
}
class Dollars{
  final int ten = 10;
  final int twenty = 20;
  final int fifty = 50;
  final int onehundred = 100;
}
abstract class ATM{
  ATM? next;
  int money;

  ATM(this.money);

  void setNextATM(ATM go){
    next = go;
  }

  void getMoney(String name,int number){
    if(number <= money){
      print(write(name));
    }
    if(next!=null){
      next!.getMoney(name,number);
    }
  }
  String write(String name);
}

class TenMoney extends ATM{
  TenMoney(super.money);
  
  @override
  String write(String name) {
    return "10\$ купюри: $name";
  }
}

class TewntyMoney extends ATM{
  TewntyMoney(super.money);

  @override
  String write(String name) {
    return "20\$ купюри: $name";
  }
}

class Fiftymoney extends ATM{
  Fiftymoney(super.money);

  @override
  String write(String name) {
    return "50\$ купюри: $name";
  }
}

class OneHundredMoney extends ATM{
  OneHundredMoney(super.money);

  @override
  String write(String name) {
    return "100\$ купюри: $name";
  }
}
