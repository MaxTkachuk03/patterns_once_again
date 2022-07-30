void main(List<String> args) {
  Car one = PetrolCar();

  one.execute();

  print("="*20);

  Car two = ElectroCar();

  two.execute();
  
}

abstract class Car{
  void body(){
    print("Корпус машини...");
  }
  void wheels(){
    print("4 колеса...");
  }
  void engine();

  void execute(){
    body();
    engine();
    wheels();
  }
}

class ElectroCar extends Car{
  @override
  void engine() {
    print("Електричний двигун!");
  }
}

class PetrolCar extends Car{
  @override
  void engine() {
    print("Бензиновий двигун!");
  }
}