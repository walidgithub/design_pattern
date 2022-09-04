import '../activity_widgets/activity_indicator.dart';
import '../slider_widgets/slider.dart';
import '../switch_widgets/switch.dart';

abstract class IWidgetsFactory {
  String getTitle();
  IActivityIndicator createActivityIndicator();
  ISlider createSlider();
  ISwitch createSwitch();
}