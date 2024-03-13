import 'package:common_dependencies/common_dependencies.dart';
import 'package:common_ui/common_ui.dart';
import 'package:models/models.dart';

class HomeController extends GetxController {
  final RxBool toTheMoon = true.obs;

  void switchTheme() => Themes().switchTheme();

  void switchFlightDirection() => toTheMoon.value = !toTheMoon.value;

  void onSettingsPressed() async => await Get.toNamed(Routes.settings.path);
}
