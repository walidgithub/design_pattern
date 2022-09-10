import 'package:flutter/material.dart';

import '../../creational/prototype/shape.dart';
import 'command.dart';
import 'command_history.dart';
import 'commands/change_color_command.dart';
import 'commands/change_height_command.dart';
import 'commands/change_width_command.dart';

class CommandExample extends StatefulWidget {
  @override
  _CommandExampleState createState() => _CommandExampleState();
}

class _CommandExampleState extends State<CommandExample> {
  final CommandHistory _commandHistory = CommandHistory();
  final Shape _shape = Shape.initial();

  void _changeColor() {
    var command = ChangeColorCommand(_shape);
    _executeCommand(command);
  }

  void _changeHeight() {
    var command = ChangeHeightCommand(_shape);
    _executeCommand(command);
  }

  void _changeWidth() {
    var command = ChangeWidthCommand(_shape);
    _executeCommand(command);
  }

  void _executeCommand(Command command) {
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
        padding: EdgeInsets.symmetric(horizontal: LayoutConstants.paddingL),
        child: Column(
          children: <Widget>[
            ShapeContainer(
              shape: _shape,
            ),
            const SizedBox(height: LayoutConstants.spaceM),
            PlatformButton(
              child: Text('Change color'),
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeColor,
            ),
            PlatformButton(
              child: Text('Change height'),
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeHeight,
            ),
            PlatformButton(
              child: Text('Change width'),
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeWidth,
            ),
            Divider(),
            PlatformButton(
              child: Text('Undo'),
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _commandHistory.isEmpty ? null : _undo,
            ),
            const SizedBox(height: LayoutConstants.spaceM),
            Row(
              children: <Widget>[
                CommandHistoryColumn(
                  commandList: _commandHistory.commandHistoryList,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}