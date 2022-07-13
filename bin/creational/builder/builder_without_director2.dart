void main(List<String> args) {
  HouseBuilder houseBuilder = HouseBuilder();
  houseBuilder.setMainMaterial(MainMaterial.concrete);
  houseBuilder.setPrice(20000000);
  houseBuilder.build();
  
  print(houseBuilder.toString());
}

enum Size{ large, small, middle}

enum MainMaterial{ brick, concrete, tree}

class HouseBuilder{
  HouseBuilder house = HouseBuilder();
  late Size size;
  MainMaterial? mainMaterial;
  int? price;

  void setMainMaterial(MainMaterial m) {
    house.mainMaterial = m;
  }

  void setPrice(int p) {
    house.price = p;
  }

  void setSize(Size s) {
    house.size = s;
  }

  void build() {
    setSize(size);
    setMainMaterial(mainMaterial!);
    setPrice(price!);
  }

  @override
  String toString() {
    return "Розмір: ${size.toString().split(".")[1]}" 
    "\nМатеріал з якого побудований будинок: ${mainMaterial.toString().split(".")[1]}" 
    "\nЦіна будинку: $price \$";
  }
}
