import 'package:design_pattern/design_pattern/creational/abstract_factory/switch_widgets/switch.dart';
import 'package:flutter/cupertino.dart';

class IosSwitch implements ISwitch {
  @override
  Widget render(bool value, ValueSetter<bool> onChanged) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
    );
  }
}