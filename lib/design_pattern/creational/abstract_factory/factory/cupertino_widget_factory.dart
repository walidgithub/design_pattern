

import 'package:design_pattern/design_pattern/creational/abstract_factory/factory/widget_factory.dart';

import '../activity_widgets/activity_indicator.dart';
import '../activity_widgets/ios_activity.dart';
import '../slider_widgets/ios_slider.dart';
import '../slider_widgets/slider.dart';
import '../switch_widgets/ios_switch.dart';
import '../switch_widgets/switch.dart';

class CupertinoWidgetsFactory implements IWidgetsFactory {
  @override
  String getTitle() {
    return 'iOS widgets';
  }

  @override
  IActivityIndicator createActivityIndicator() {
    return IosActivityIndicator();
  }

  @override
  ISlider createSlider() {
    return IosSlider();
  }

  @override
  ISwitch createSwitch() {
    return IosSwitch();
  }
}