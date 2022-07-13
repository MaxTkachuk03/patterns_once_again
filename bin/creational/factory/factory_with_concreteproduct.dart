void main(List<String> args) {
//& Перший спосіб
  PhoneFactory iphone = IphonePhoneFactory();
  PhoneFactory xiaomi = XiaomiPhoneFactory();
  PhoneFactory meizu = MeizuPhoneFactory();

  iphone.create().myPhone();
  xiaomi.create().myPhone();
  meizu.create().myPhone();

  print("="*20);

//$ Другий спосіб
  PhoneFactory iphone1 = IphonePhoneFactory();
  PhoneProduct iphoneProduct = iphone1.create();

  PhoneFactory xiaomi1 = XiaomiPhoneFactory();
  PhoneProduct xiaomiProduct = xiaomi1.create();

  PhoneFactory meizu1 = MeizuPhoneFactory();
  PhoneProduct meizuProduct = meizu1.create();

  iphoneProduct.myPhone();
  xiaomiProduct.myPhone();
  meizuProduct.myPhone();

  print("="*20);

//@ Третій спосіб
  PhoneFactory? phone;

  void which(String s){
    if(phone==null){
      if(s=="Iphone"){
        phone = IphonePhoneFactory();
      }
      if(s=="Xiaomi"){
        phone = XiaomiPhoneFactory();
      }
      if(s=="Meizu"){
        phone = MeizuPhoneFactory();
      }
      else{
        throw Exception('Не виготовляємо таку марку!');
      }
    }
  }
  which("Meizu");
  PhoneProduct product = phone!.create();
  product.myPhone();

}

//# Product
abstract class PhoneProduct{
  void myPhone();
}

class IphonePhoneProduct implements PhoneProduct{
  @override
  void myPhone() {
    print("Зліпили смартфон Iphone");
  }
}

class XiaomiPhoneProduct implements PhoneProduct{
  @override
  void myPhone() {
    print("Зліпили смартфон Xiaomi");
  }
}

class MeizuPhoneProduct implements PhoneProduct{
  @override
  void myPhone() {
    print("Зліпили смартфон Meizu");
  }
}

//! Factory
abstract class PhoneFactory{
  PhoneProduct create();
}

class IphonePhoneFactory implements PhoneFactory{
  @override
  PhoneProduct create() {
    return IphonePhoneProduct(); 
  }
}

class XiaomiPhoneFactory implements PhoneFactory{
  @override
  PhoneProduct create() {
    XiaomiPhoneProduct xiaomi = XiaomiPhoneProduct();
    return xiaomi;
  }
}

class MeizuPhoneFactory implements PhoneFactory{
  @override
  PhoneProduct create() {
    return MeizuPhoneProduct();
  }
}