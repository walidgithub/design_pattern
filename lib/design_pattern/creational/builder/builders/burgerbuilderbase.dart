import '../burger.dart';

abstract class BurgerBuilderBase {

  Burger? burger;

  double? price;

  void createBurger() {
    burger = Burger();
  }

  Burger getBurger() {
    return burger!;
  }

  void setBurgerPrice() {
    burger!.setPrice(price!);
  }

  void addBuns();
  void addCheese();
  void addPatties();
  void addSauces();
  void addSeasoning();
  void addVegetables();
}