void main(List<String> args) {
  ConcreteMediator mediator = ConcreteMediator();
  Components admin = Admin(mediator);
  Components user  = User(mediator);
  Components developer = Developer(mediator);

  mediator.addComponent(developer);
  mediator.addComponent(admin);
  mediator.addComponent(user);

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
  List<Components> comp = [];

  void addComponent(Components component){
    comp.add(component);
  }

  @override
  void notify(String message, Components component) {
    for(Components c in comp){
      if(c!= component){
        c.getMessage(message);
      }
    }
  }
}

abstract class Components{
  void sendMessage(String message);

  void getMessage(String message);
}

class Admin implements Components{
  Mediator mediator;
  Admin(this.mediator);

  @override
  void getMessage(String message) {
    print("Адмін отримав повідомлення: $message");
  }
  
  @override
  void sendMessage(String message) {
    mediator.notify(message, this);
  }
}

class User implements Components{
  Mediator mediator;

  User(this.mediator);

  @override
  void getMessage(String message) {
    print("Користувач отримав повідомлення: $message");
  }
  
  @override
  void sendMessage(String message) {
    mediator.notify(message, this);
  }
}

class Developer implements Components{
  Mediator mediator;

  Developer(this.mediator);

  @override
  void getMessage(String message) {
    print("Розробник отримав повідомлення: $message");
  }
  
  @override
  void sendMessage(String message) {
    mediator.notify(message, this);
  }
}