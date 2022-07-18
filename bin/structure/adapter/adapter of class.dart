// ignore_for_file: file_names
void main(List<String> args) {
  //Euro m = Dollar();
  Euro money = MoneyAdapter();
  print(money.getEuro(100));
}
//Adaptee
class Dollar{
  double convert(double sum){
    return sum;
  }
}
//Target
abstract class Euro{
  String getEuro(int d);
}
//Adapter
class MoneyAdapter extends Dollar implements Euro  {
  @override
  String getEuro(int sum) {
    convert(sum.toDouble());
    return "$sum \$ конвертємо...\n"
    "Отримаємо ${sum/2} Euro";
  }
}

