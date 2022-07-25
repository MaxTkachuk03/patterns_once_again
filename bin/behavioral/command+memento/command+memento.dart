// ignore_for_file: file_names
void main(List<String> args) {
  Costumer costumer = Costumer(); 
  WaiterCommand waiter = WaiterCommand(costumer);
  Cooker cooker = Cooker();

  waiter.setOffer("Стейк з яловичини");
  print(waiter.toString());

  print("\nЗапис у блокнот...");

  cooker.setSave(waiter.save());

  print("\nКлієнт змінює замовлення...\n");

  waiter.setOffer("Червона риба в соусі");
  print(waiter);

  print("\nЗапис у блокнот...");

  cooker.setSave(waiter.save());

  print("\nКлієнт змінює замовлення...\n");

  waiter.setOffer("Паста \"Карбонара\"");
  print(waiter);

  print("\nЗапис у блокнот...");

  cooker.setSave(waiter.save());

  print("\nКлієнт передумав. Повертаємо минуле замовлення...\n");
  waiter.load(cooker.getSave());
  print("$waiter\n");

  print("Блокнот:");
  print("-"*45);
  cooker.allSaved();
  print("-"*45);
}

//$ Command
class WaiterCommand{
  Costumer costumer;

  WaiterCommand(this.costumer);

  void setOffer(String s){
    costumer.setOf(s);
  }

  Snapshot save(){
    return Snapshot.setMemento(costumer.getOffer());
  }

  void load(Snapshot snapshot){
    costumer.str = snapshot.getCommand();
  }

  @override
  String toString() {
    return costumer.getOffer();
  }
}

//$ Invoker
class Costumer{
  late String str;

  void setOf(String s){
    str = s;
  }
  
  String getOffer(){
    return str;
  }
}

//@ Receiver, Caretaker
class Cooker{
  List<Snapshot> save = [];

  Snapshot getSave(){
    return save.elementAt(1);
  }

  void setSave(Snapshot snapshot){
    save.add(snapshot);
  }

  void allSaved(){
    if(save.isNotEmpty){
      for(Snapshot s in save){
        print(s.waiter);
      }
    }
  }
}

//! Memento, Save
class Snapshot{
  late final String waiter;

  Snapshot.setMemento(String w){
    waiter = w;
  }

  String getCommand(){ 
    return waiter;
  }
}