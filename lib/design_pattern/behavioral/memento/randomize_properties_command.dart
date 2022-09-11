import 'dart:ui';

import 'package:faker/faker.dart';

import 'i_command.dart';
import 'i_memento.dart';
import 'originator.dart';

class RandomisePropertiesCommand implements ICommand {
  Originator? originator;
  IMemento? _backup;

  RandomisePropertiesCommand(this.originator) {
    _backup = originator?.createMemento();
  }

  @override
  void execute() {
    var shape = originator?.state;
    shape?.color = Color.fromRGBO(
        random.integer(255), random.integer(255), random.integer(255), 1.0);
    shape.height = random.integer(150, min: 50).toDouble();
    shape.width = random.integer(150, min: 50).toDouble();
  }

  @override
  void undo() {
    if (_backup != null) {
      originator?.restore(_backup!);
    }
  }
}