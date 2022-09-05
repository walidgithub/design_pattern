import '../object_we_want_to_take.dart';

class ExampleStateWithoutSingleton extends ExampleStateBase {
  ExampleStateWithoutSingleton() {
    initialText =
    "A new 'ExampleStateWithoutSingleton' instance has been created.";
    stateText = initialText;
    print(stateText);
  }
}