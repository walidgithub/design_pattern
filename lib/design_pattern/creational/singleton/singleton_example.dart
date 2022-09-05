import 'package:design_pattern/design_pattern/creational/singleton/calling_singleton/way_1.dart';
import 'package:design_pattern/design_pattern/creational/singleton/calling_singleton/way_2.dart';
import 'package:design_pattern/design_pattern/creational/singleton/calling_singleton/without_singleton.dart';
import 'package:flutter/material.dart';

import 'object_we_want_to_take.dart';

class SingletonExample extends StatefulWidget {
  @override
  _SingletonExampleState createState() => _SingletonExampleState();
}

class _SingletonExampleState extends State<SingletonExample> {
  final List<ExampleStateBase> stateList = [
    ExampleState(),
    ExampleStateByDefinition.getState(),
    ExampleStateWithoutSingleton()
  ];

  void _setTextValues([String text = 'Singleton']) {
    for (var state in stateList) {
      state.setStateText(text);
    }
    setState(() {});
  }

  void _reset() {
    for (var state in stateList) {
      state.reset();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: LayoutConstants.paddingL),
        child: Column(
          children: <Widget>[
            for (var state in stateList)
              Padding(
                padding: EdgeInsets.only(bottom: LayoutConstants.paddingL),
                child: SingletonExampleCard(
                  text: state.currentText,
                ),
              ),
            SizedBox(height: LayoutConstants.spaceL),
            PlatformButton(
              child: Text("Change states\' text to 'Singleton'"),
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _setTextValues,
            ),
            PlatformButton(
              child: Text("Reset"),
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _reset,
            ),
            const SizedBox(height: LayoutConstants.spaceXL),
            Text(
              'Note: change states\' text and navigate the application (e.g. go to the tab "description" or main menu, then go back to this example) to see how the Singleton state behaves!',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
