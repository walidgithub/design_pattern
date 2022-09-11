import 'package:design_pattern/design_pattern/behavioral/state/state_context.dart';
import 'package:design_pattern/design_pattern/behavioral/state/states/no_result_state.dart';
import 'package:flutter/material.dart';

import 'i-state.dart';

class StateExample extends StatefulWidget {
  @override
  _StateExampleState createState() => _StateExampleState();
}

class _StateExampleState extends State<StateExample> {
  var _stateContext = StateContext();

  Future<void> _changeState() async {
    await _stateContext.nextState();
  }

  @override
  void dispose() {
    _stateContext.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: LayoutConstants.paddingL),
        child: Column(
          children: <Widget>[
            PlatformButton(
              child: Text('Load names'),
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeState,
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            StreamBuilder(
              initialData: NoResultsState(),
              stream: _stateContext.outState,
              builder: (_, AsyncSnapshot<IState> snapshot) =>
                  snapshot.data.render(),
            ),
          ],
        ),
      ),
    );
  }
}