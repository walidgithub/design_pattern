import '../../creational/prototype/shape.dart';
import 'i_memento.dart';

class Memento extends IMemento {
  Shape? _state;

  Memento(Shape shape) {
    _state = Shape.copy(shape);
  }

  Shape getState() {
    return _state!;
  }
}