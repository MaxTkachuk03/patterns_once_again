void main(List<String> args) {
  House house = HouseDoBuilder()
  .setMainMaterial(MainMaterial.brick)
  .setPrice(100000)
  .setSize(Size.middle)
  .build();
  
  print(house.toString());
}

enum Size{ large, small, middle}

enum MainMaterial{ brick, concrete, tree}

class House{
  late Size size;
  MainMaterial? mainMaterial;
  int? price;

  @override
  String toString() {
    return "Розмір: ${size.toString().split(".")[1]}" 
    "\nМатеріал з якого побудований будинок: ${mainMaterial.toString().split(".")[1]}" 
    "\nЦіна будинку: $price \$";
  }
}

abstract class HouseBuilder{
  HouseBuilder setSize(Size s);
  HouseBuilder setMainMaterial(MainMaterial m);
  HouseBuilder setPrice(int p);
  House build();
}

class HouseDoBuilder implements HouseBuilder{
  House house = House();

  @override
  HouseBuilder setMainMaterial(MainMaterial m) {
    house.mainMaterial = m;
    return this;
  }

  @override
  HouseBuilder setPrice(int p) {
    house.price = p;
    return this;
  }

  @override
  HouseBuilder setSize(Size s) {
    house.size = s;
    return this;
  }
  
  @override
  House build() {
    return house;
  }
}