import 'package:design_pattern/design_pattern/behavioral/state/states/loading_state.dart';
import 'package:flutter/material.dart';

import '../i-state.dart';
import '../state_context.dart';

class ErrorState implements IState {
  @override
  Future nextState(StateContext context) async {
    context.setState(LoadingState());
  }

  @override
  Widget render() {
    return Text(
      'Oops! Something went wrong...',
      style: TextStyle(
        color: Colors.red,
        fontSize: 24.0,
      ),
      textAlign: TextAlign.center,
    );
  }
}