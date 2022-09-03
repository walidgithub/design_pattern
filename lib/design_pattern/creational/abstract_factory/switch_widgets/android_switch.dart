import 'package:design_pattern/design_pattern/creational/abstract_factory/switch_widgets/switch.dart';
import 'package:flutter/material.dart';

class AndroidSwitch implements ISwitch {
  @override
  Widget render(bool value, ValueSetter<bool> onChanged) {
    return Switch(
      activeColor: Colors.black,
      value: value,
      onChanged: onChanged,
    );
  }
}