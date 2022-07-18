void main(List<String> args) {
  Dressing person = Person("Sergey");
  Dressing clothe1 = Shorts(person);
  Dressing clothe2 = Socks(clothe1);
  Dressing clothe3 = Jeans(clothe2);
  Dressing clothe4 = SweatShirt(clothe3);
  Dressing clothe5 = Jacket(clothe4);
  
  clothe5.getClothes();
  print("Загальна вага: ${clothe5.weightClothes().toStringAsFixed(3)}");
}

//# Component
abstract class Dressing{
  void getClothes();
  double weightClothes();
}

//# Concrete Component
class Person implements Dressing{
  String name;

  Person(this.name);

  @override
  void getClothes() {
    print("$name одягає");
  }
  
  @override
  double weightClothes() {
    return 0;
  }
}

//! Base Decorator
abstract class Clothes implements Dressing{
  Dressing dressing;

  Clothes(this.dressing);

  @override
  void getClothes();
  @override
  double weightClothes();
}

//! Concrete Decorators:
class Shorts extends Clothes{
  Shorts(super.dressing);

  @override
  void getClothes() {
    dressing.getClothes();
    print("труси,");
  }

  @override
  double weightClothes() {
    return dressing.weightClothes() + 0.1;
  }
}

class Jeans extends Clothes{
  Jeans(super.dressing);

  @override
  void getClothes() {
    dressing.getClothes();
    print("джинси,");
  }

  @override
  double weightClothes() {
    return dressing.weightClothes() + 0.3;
  }
}

class Socks extends Clothes{
  Socks(super.dressing);

  @override
  void getClothes() {
    dressing.getClothes();
    print("носки,");
  }

  @override
  double weightClothes() {
    return dressing.weightClothes() + 0.05;
  }
}

class TShirt extends Clothes{
  TShirt(super.dressing);

  @override
  void getClothes() {
    dressing.getClothes();
    print("футболку,");
  }

  @override
  double weightClothes() {
    return dressing.weightClothes() + 0.15;
  }
}

class SweatShirt extends Clothes{
  SweatShirt(super.dressing);

  @override
  void getClothes() {
    dressing.getClothes();
    print("світшот,");
  }

  @override
  double weightClothes() {
    return dressing.weightClothes() + 0.4;
  }
}

class Jacket extends Clothes{
  Jacket(super.dressing);

  @override
  void getClothes() {
    dressing.getClothes();
    print("куртку,");
  }

  @override
  double weightClothes() {
    return dressing.weightClothes() + 0.8;
  }
}