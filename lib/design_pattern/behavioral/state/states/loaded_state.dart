import 'package:design_pattern/design_pattern/behavioral/state/states/loading_state.dart';
import 'package:flutter/material.dart';

import '../i-state.dart';
import '../state_context.dart';

class LoadedState implements IState {
  final List<String> names;

  const LoadedState(this.names);

  @override
  Future nextState(StateContext context) async {
    context.setState(LoadingState());
  }

  @override
  Widget render() {
    return Column(
      children: names
          .map(
            (name) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
              child: Text(name[0]),
            ),
            title: Text(name),
          ),
        ),
      )
          .toList(),
    );
  }
}