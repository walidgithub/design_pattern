import '../ingredients/mayonnaise.dart';
import '../ingredients/mcchickenpatty.dart';
import '../ingredients/regularbun.dart';
import '../ingredients/shreddedlettuce.dart';
import 'burgerbuilderbase.dart';

class McChickenBuilder extends BurgerBuilderBase {
  McChickenBuilder() {
    price = 1.29;
  }

  @override
  void addBuns() {
    burger!.addIngredient(RegularBun());
  }

  @override
  void addCheese() {
    // Not needed
  }

  @override
  void addPatties() {
    burger!.addIngredient(McChickenPatty());
  }

  @override
  void addSauces() {
    burger!.addIngredient(Mayonnaise());
  }

  @override
  void addSeasoning() {
    // Not needed
  }

  @override
  void addVegetables() {
    burger!.addIngredient(ShreddedLettuce());
  }
}