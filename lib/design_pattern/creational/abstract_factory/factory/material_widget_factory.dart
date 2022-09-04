import 'package:design_pattern/design_pattern/creational/abstract_factory/factory/widget_factory.dart';

import '../activity_widgets/activity_indicator.dart';
import '../activity_widgets/android_activity.dart';
import '../slider_widgets/android_slider.dart';
import '../slider_widgets/slider.dart';
import '../switch_widgets/android_switch.dart';
import '../switch_widgets/switch.dart';

class MaterialWidgetsFactory implements IWidgetsFactory {
  @override
  String getTitle() {
    return 'Android widgets';
  }

  @override
  IActivityIndicator createActivityIndicator() {
    return AndroidActivityIndicator();
  }

  @override
  ISlider createSlider() {
    return AndroidSlider();
  }

  @override
  ISwitch createSwitch() {
    return AndroidSwitch();
  }
}