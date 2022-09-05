abstract class Ingredient {

  List<String>? allergens;

  String? name;

  List<String> getAllergens() {
    return allergens!;
  }

  String getName() {
    return name!;
  }
}