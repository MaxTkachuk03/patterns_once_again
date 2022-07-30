void main(List<String> args) {
  TSLAExchange tsla = TSLAExchange();
  IObservers grow = GrowingChangeStocks(tsla);
  IObservers all = AllChangesStocks(tsla);

  print("Люди підписались");
  grow.subscribe();
  all.subscribe();
  print("="*20);

  tsla.changeStocks("зросли на", 5);
  print("="*20);

  tsla.changeStocks("зросли на", 13);
  print("="*20);

  tsla.changeStocks("Bипустили", 5);
  print("="*20);

  tsla.changeStocks("впали на", 5);
  print("="*20);

  print("Люди відписались");
  all.unSubscribe();
  print("="*20);

  tsla.changeStocks("зросли на", 2);
  print("="*20);

  tsla.changeStocks("Bипустили", 9);
  //print("="*20);
}

// Publisher
class TSLAExchange{
  List<IObservers> observers = [];
  late String ch;
  late int value;

  void addObserver(IObservers observer){
    observers.add(observer);
  }

  void deleteObserver(IObservers observer){
    observers.remove(observer);
  }

  void changeStocks(String change, int i){
    ch = change;
    value = i;
    notifyObserver();
  }

  void notifyObserver(){
    for(IObservers ob in observers){
      ob.update(ch,value);
    }
  }
}

// Observer
abstract class IObservers{
  TSLAExchange stockExchange;

  IObservers(this.stockExchange);

  void subscribe() {
    stockExchange.addObserver(this);
  }

  void unSubscribe() {
    stockExchange.deleteObserver(this);
  }

  void update(String change, int i);
}

// Concrete Observer
class GrowingChangeStocks extends IObservers{
  GrowingChangeStocks(super.stockExchange);
  int k=0;

  @override
  void update(String change, int i) {
    if(change.contains("зросли")){
      k++;
      if(k==1){
        print("Акції $change $i%. Всього зросли $k раз");
      }
      if(k>1 && k<5){
        print("Акції $change $i%. Всього зросли $k раза");
      }
      if(k>=5){
        print("Акції $change $i%. Всього зросли $k разів");
      }
    }
  }
  
  // @override
  // void subscribe() {
  //   stockExchange.addObserver(GrowingChangeStocks(stockExchange));
  // }
  
  // @override
  // void unSubscribe() {
  //   stockExchange.deleteObserver(this);
  // }
}

// Concrete Observer
class AllChangesStocks extends IObservers{
  AllChangesStocks(super.stockExchange);

  @override
  void update(String change, int i) {
    if(change.contains("зросли") || change.contains("впали")){
      print("Акції $change $i%");
    }
    else if(i==1){
      print("$change $i нову акцію");
    }
    else if(i>1 && i<5){
      print("$change $i нові акції");
    }
    else if(i>=5){
      print("$change $i нових акцій");
    }
  }
}