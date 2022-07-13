void main(List<String> args) {
  HouseBuilder house =  BrickHouseBuilder();
  Director director = Director(house);
  
  director.make();
  //print(house.build());

  print("="*52);

  HouseBuilder cHouse = ConcreteHouseBuilder();

  director.changeBuilder(cHouse);

  director.make();
  //print(cHouse.build());
}

class Director{
  HouseBuilder builder;

  Director(this.builder);

  void changeBuilder(HouseBuilder newBuilder){
    builder = newBuilder;
  }

  void make(){
    builder.setSize();
    builder.setFloor();
    builder.setMaterial();
    builder.setAcc();
    builder.setPrice();
    print(builder.build());
  }
}

enum Size{large, small, middle}

enum Accessories{pool, garage, garden, playground}

enum MainMaterial{brick, concrete, tree}

class House{
  Size? size;
  MainMaterial? mainMaterial;
  double? price;
  List<Accessories>? accses;
  int? floor;

  @override
  String toString() {
    String s = "";
    for (var element in accses!) {
      s+=element.toString().split(".")[1];
      if(element!=accses!.last){
        s+=", ";
      }
    }
    return "Розмір будинку: ${size.toString().split(".")[1]}"
    "\nКількість поверхів: $floor"
    "\nЗ якого матеріалу збудовано: ${mainMaterial.toString().split(".")[1]}"
    "\nДодаткові добудови: $s"
    "\nЦіна виробництва: $price \$";
  }
}

abstract class HouseBuilder{
  House house = House();

  void setMaterial();
  void setSize();
  void setPrice();
  void setAcc();
  void setFloor();

  House build(){
    return house;
  }
}

class TreeHouseBuilder extends HouseBuilder{

  @override
  void setMaterial() {
    house.mainMaterial = MainMaterial.tree;
  }

  @override
  void setSize() {
    house.size = Size.large;
  }
  
  @override
  void setAcc() {
    house.accses = [Accessories.garden, Accessories.playground];
  }
  
  @override
  void setFloor() {
    house.floor = 3;
  }
  
  @override
  void setPrice() {
    house.price = 1000000.4;
  }
}

class ConcreteHouseBuilder extends HouseBuilder{

  @override
  void setMaterial() {
    house.mainMaterial = MainMaterial.concrete;
  }

  @override
  void setSize() {
    house.size = Size.middle;
  }
  
  @override
  void setAcc() {
    house.accses = [Accessories.playground, Accessories.pool];
  }
  
  @override
  void setFloor() {
    house.floor = 2;
  }
  
  @override
  void setPrice() {
    house.price = 1500000.6;
  }
}

class BrickHouseBuilder extends HouseBuilder{

  @override
  void setMaterial() {
    house.mainMaterial = MainMaterial.brick;
  }

  @override
  void setSize() {
    house.size = Size.small;
  }
  
  @override
  void setAcc() {
    house.accses = [
      Accessories.garage,
      Accessories.garden,
      Accessories.pool,
      Accessories.playground
    ];
  }
  
  @override
  void setFloor() {
    house.floor = 1;
  }
  
  @override
  void setPrice() {
    house.price = 1200000.99;
  }
}