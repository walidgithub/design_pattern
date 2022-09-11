import 'package:design_pattern/design_pattern/behavioral/memento/randomize_properties_command.dart';
import 'package:flutter/material.dart';

import '../command/command_history.dart';
import 'i_command.dart';
import 'originator.dart';

class MementoExample extends StatefulWidget {
  @override
  _MementoExampleState createState() => _MementoExampleState();
}

class _MementoExampleState extends State<MementoExample> {
  final CommandHistory _commandHistory = CommandHistory();
  final Originator _originator = Originator();

  void _randomiseProperties() {
    var command = RandomisePropertiesCommand(_originator);
    _executeCommand(command);
  }

  void _executeCommand(ICommand command) {
    setState(() {
      command.execute();
      _commandHistory.add(command);
    });
  }

  void _undo() {
    setState(() {
      _commandHistory.undo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: ScrollBehavior(),
    child: SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: LayoutConstants.paddingL),
    child: Column(
    children: <Widget>[
    ShapeContainer(
    shape: _originator.state,
    ),
    const SizedBox(height: LayoutConstants.spaceM),
    PlatformButton(
    child: Text('Randomise properties'),
    materialColor: Colors.black,
    materialTextColor: Colors.white,
    onPressed: _randomiseProperties,
    ),
    Divider(),
    PlatformButton(
    child: Text('Undo'),
    materialColor: Colors.black,
      materialTextColor: Colors.white,
      onPressed: _randomiseProperties,
    ),
      Divider(),
      PlatformButton(
        child: Text('Undo'),
        materialColor: Colors.black,
        materialTextColor: Colors.white,
        onPressed: _commandHistory.isEmpty ? null : _undo,
      ),
      const SizedBox(height: LayoutConstants.spaceM),
    ],
    ),
    ),
    );
  }
}