import '../../creational/prototype/shape.dart';
import 'i_memento.dart';
import 'memento.dart';

class Originator {
  Shape? state;

  Originator() {
    state = Shape.initial();
  }

  IMemento createMemento() {
    return Memento(state!);
  }

  void restore(IMemento memento) {
    state = memento.getState();
  }
}