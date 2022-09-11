import 'package:design_pattern/design_pattern/behavioral/state/state_context.dart';
import 'package:flutter/material.dart';

abstract class IState {
  Future nextState(StateContext context);
  Widget render();
}