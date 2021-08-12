import 'country.dart';
import 'problem.dart';

class City extends Country with Problems {
  City() : super("โตเกียว", "ดาบพิฆาษอสูร");

  void callSuper() {
    print("เมืองหลวง : " + super.city);
    super.callHello();
  }

  @override
  String callAnime() => "ดาบพิฆาษอสูร";
}
//