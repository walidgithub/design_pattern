import '../ingredients/beefpatty.dart';
import '../ingredients/bigmacbun.dart';
import '../ingredients/bigmacsauce.dart';
import '../ingredients/cheese.dart';
import '../ingredients/grillseasoning.dart';
import '../ingredients/onions.dart';
import '../ingredients/pickleslices.dart';
import '../ingredients/shreddedlettuce.dart';
import 'burgerbuilderbase.dart';

class BigMacBuilder extends BurgerBuilderBase {
  BigMacBuilder() {
    price = 3.99;
  }

  @override
  void addBuns() {
    burger!.addIngredient(BigMacBun());
  }

  @override
  void addCheese() {
    burger!.addIngredient(Cheese());
  }

  @override
  void addPatties() {
    burger!.addIngredient(BeefPatty());
  }

  @override
  void addSauces() {
    burger!.addIngredient(BigMacSauce());
  }

  @override
  void addSeasoning() {
    burger!.addIngredient(GrillSeasoning());
  }

  @override
  void addVegetables() {
    burger!.addIngredient(Onions());
    burger!.addIngredient(PickleSlices());
    burger!.addIngredient(ShreddedLettuce());
  }
}
