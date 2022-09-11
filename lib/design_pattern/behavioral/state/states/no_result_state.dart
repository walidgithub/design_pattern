import 'package:design_pattern/design_pattern/behavioral/state/states/loading_state.dart';
import 'package:flutter/material.dart';

import '../i-state.dart';
import '../state_context.dart';

class NoResultsState implements IState {
  @override
  Future nextState(StateContext context) async {
    context.setState(LoadingState());
  }

  @override
  Widget render() {
    return Text(
      'No Results',
      style: TextStyle(fontSize: 24.0),
      textAlign: TextAlign.center,
    );
  }
}