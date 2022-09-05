import '../object_we_want_to_take.dart';

class ExampleStateByDefinition extends ExampleStateBase {
  static ExampleStateByDefinition? _instance;

  ExampleStateByDefinition._internal() {
    initialText = "A new 'ExampleStateByDefinition' instance has been created.";
    stateText = initialText;
    print(stateText);
  }

  static ExampleStateByDefinition getState() {
    if (_instance == null) {
      _instance = ExampleStateByDefinition._internal();
    }

    return _instance!;
  }
}