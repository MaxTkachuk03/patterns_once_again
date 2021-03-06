void main(List<String> args) {
  Mediator mediator = ConcreteMediator();
  Components admin = Admin(mediator);
  Components user  = User(mediator);
  Components developer = Developer(mediator);

  developer.sendMessage("Всі неполадки виправлено!");
  print("="*20);
  admin.sendMessage("Чат відкрито...");
  print("="*20);
  user.sendMessage("Привіт!");
}

abstract class Mediator{
  void notify(String message, Components component);
}

class ConcreteMediator implements Mediator{

  @override
  void notify(String message, Components component) {
    if(component is Admin){
      User(this).getMessage(message);
    }
    if(component is Developer){
      Admin(this).getMessage(message);
      User(this).getMessage(message);
    }
    if(component is User){
      User(this).getMessage(message);
    }
  }
}

abstract class Components{
  Mediator mediator;

  Components(this.mediator);

  void sendMessage(String message){
    mediator.notify(message, this);
  }

  void getMessage(String message);
}

class Admin extends Components{
  Admin(super.mediator);

  @override
  void getMessage(String message) {
    print("Адмін отримав повідомлення: $message");
  }
}

class User extends Components{
  User(super.mediator);

  @override
  void getMessage(String message) {
    print("Користувач отримав повідомлення: $message");
  }
}

class Developer extends Components{
  Developer(super.mediator);

  @override
  void getMessage(String message) {
    print("Розробник отримав повідомлення: $message");
  }
}