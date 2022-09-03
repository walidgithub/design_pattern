import 'package:flutter/cupertino.dart';

import 'activity_indicator.dart';

class IosActivityIndicator implements IActivityIndicator {
  @override
  Widget render() {
    return CupertinoActivityIndicator();
  }
}