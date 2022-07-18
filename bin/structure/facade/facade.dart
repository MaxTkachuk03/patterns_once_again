void main(List<String> args) {
  SmartHomeFacade homeFacade = SmartHomeFacade();

  homeFacade.home();
  
  print("="*30);

  homeFacade.relax();

  print("="*30);

  homeFacade.out();
}

class SmartHomeFacade{
  HomeSecurity security = HomeSecurity();
  Light light = Light();
  HomeCinema cinema = HomeCinema();
  Heating heating = Heating();

  void out(){
    security.turnon();
    light.turnoff();
    heating.turnoff();
    cinema.turnoff();
  }
  void home(){
    security.turnoff();
    light.turnon();
    heating.turnon();
  }

  void relax(){
    cinema.turnon();
    light.turnoff();
  }

  void warmWeather(){
    heating.turnoff();
  }
}

class HomeSecurity{
  void turnon(){
    print("Вмикаємо систему охорони...");
  }

  void turnoff(){
    print("Вимикаємо систему охорони!");
  }
}

class Light{
  void turnon(){
    print("Вмикаємо світло...");
  }

  void turnoff(){
    print("Вимикаємо світло!");
  }
}

class HomeCinema{
  void turnon(){
    print("Вмикаємо домашній кінотеатр...");
  }

  void turnoff(){
    print("Вимикаємо домашній кінотеатр!");
  }
}

class Heating{
  void turnon(){
    print("Вмикаємо опалення...");
  }

  void turnoff(){
    print("Вимикаємо опалення!");
  }
}

