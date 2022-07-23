// ignore_for_file: file_names
void main(List<String> args) {
  IBase human = User();
  IBase proxy = DefensiveProxy(human);

  proxy.passwordCode("admin");
}

abstract class IBase{
  void passwordCode(String code);
}

class DefensiveProxy implements IBase{
  IBase human;

  DefensiveProxy(this.human);

  String alf = "abcdefghijklmnopqrstuvwxyz";

  void codeMessage(String doing){
    String out = "";
    for(int i=0;i<doing.length;i++){
      for(int j=0;j<alf.length;j++){
        if(doing[i] == alf[j]){
          if(j>=26){
            out += doing.replaceAll(doing[i],alf[j-27]).substring(i,i+1);
          }
          else{
            out += doing.replaceAll(doing[i],alf[j+2]).substring(i,i+1);
          }
        }
      }
    }
    print("Вихiдне повідомлення: $out");
  }

  // List<String> alf = ["a","b","c","d","e","f","g","h","i","j","k",
  // "l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];

  @override
  void passwordCode(String code) {
      human.passwordCode(code);
      codeMessage(code);
  }
}

class User implements IBase{
  @override
  void passwordCode(String code) {
    print("Вхiдне повідомлення: $code");
  }
}