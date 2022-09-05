import '../ingredients/beefpatty.dart';
import '../ingredients/grillseasoning.dart';
import '../ingredients/ketchup.dart';
import '../ingredients/mustard.dart';
import '../ingredients/onions.dart';
import '../ingredients/pickleslices.dart';
import '../ingredients/regularbun.dart';
import 'burgerbuilderbase.dart';

class HamburgerBuilder extends BurgerBuilderBase {
  HamburgerBuilder() {
    price = 1.0;
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
    burger!.addIngredient(BeefPatty());
  }

  @override
  void addSauces() {
    burger!.addIngredient(Ketchup());
    burger!.addIngredient(Mustard());
  }

  @override
  void addSeasoning() {
    burger!.addIngredient(GrillSeasoning());
  }

  @override
  void addVegetables() {
    burger!.addIngredient(Onions());
    burger!.addIngredient(PickleSlices());
  }
}