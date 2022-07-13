void main(List<String> args) {
//! Перши спосіб
  Singleton first = Singleton();
  first.addName("Сергій");
  first.show();

  print("-"*5);

  Singleton second = Singleton();
  second.addName("Микола");
  second.show();

  print("-"*5);

  print("Перевіримо чи екземпляр дійсно один: ");
  print(identical(first, second));

//! Другий спосіб
  // Singleton first = Singleton();
  // first.names = "Ольга";
  // print(first);

  // print("-"*5);

  // Singleton second = Singleton();
  // second.names = "Яна";
  // print(second);

  // print("-"*5);

  // print("Перевіримо чи екземпляр дійсно один: ");
  // print(identical(first, second));
}

class Singleton{
  static Singleton? _instance;

//! Перши спосіб
  String _names = "Імена:\n";

  Singleton._init(){
    _instance = this;
  }

  factory Singleton() => _instance ??= Singleton._init();

  void addName(String n){
    _names+="$n\n";
  }

  void show(){
    print(_names);
  }

//! Другий спосіб
  // String names = "";

  // Singleton._init();

  // factory Singleton(){
  //   return _instance ??= Singleton._init();
  // }

  // @override
  // String toString() {
  //   String name = "";
  //   name += names; 
  //   return "Імена:\n$name\n";
  // }
}