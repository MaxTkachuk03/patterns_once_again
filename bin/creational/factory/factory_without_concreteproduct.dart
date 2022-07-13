void main(List<String> args) {
  PhoneFactory iphone = IphonePhoneFactory();
  iphone.change(Product.meizu);
}

enum Product{
  iphone, meizu, xiaomi
}

abstract class PhoneFactory{
  void change(Product prod);
  void create();
}

class IphonePhoneFactory extends PhoneFactory{
  @override
  void create() {
    print("Зліпили смартфон Iphone");
  }
  
  @override
  void change(Product prod) {
    switch(prod){
      case Product.iphone: 
        IphonePhoneFactory().create(); 
        break;
      default:
        print('Не виготовляємо таку марку!');
        break;
    }
  }
}

class XiaomiPhoneFactory extends PhoneFactory{
  @override
  void create() {
    print("Зліпили смартфон Xiaomi");
  }
  
  @override
  void change(Product prod) {
    switch(prod){
      case Product.xiaomi:
        XiaomiPhoneFactory().create();
        break;
      default:
        print('Не виготовляємо таку марку!');
        break;
    }
  }
}

class MeizuPhoneFactory extends PhoneFactory{
  @override
  void create() {
    print("Зліпили смартфон Meizu");
  }
  
  @override
  void change(Product prod) {
    switch(prod){
      case Product.meizu:
        MeizuPhoneFactory().create();
        break;
      default:
        print('Не виготовляємо таку марку!');
    }
  }
}