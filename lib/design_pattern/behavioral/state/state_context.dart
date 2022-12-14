import 'dart:async';

import 'package:design_pattern/design_pattern/behavioral/state/states/loading_state.dart';
import 'package:design_pattern/design_pattern/behavioral/state/states/no_result_state.dart';

import 'i-state.dart';

class StateContext {
  StreamController<IState> _stateStream = StreamController<IState>();
  Sink<IState> get _inState => _stateStream.sink;
  Stream<IState> get outState => _stateStream.stream;

  IState? _currentState;

  StateContext() {
    _currentState = NoResultsState();
    _addCurrentStateToStream();
  }

  void dispose() {
    _stateStream.close();
  }

  void setState(IState state) {
    _currentState = state;
    _addCurrentStateToStream();
  }

  void _addCurrentStateToStream() {
    _inState.add(_currentState!);
  }

  Future<void> nextState() async {
    await _currentState?.nextState(this);

    if (_currentState is LoadingState) {
      await _currentState?.nextState(this);
    }
  }
}