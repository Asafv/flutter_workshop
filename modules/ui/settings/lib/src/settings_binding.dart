import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';

import 'settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut(() => SettingsController(GetIt.I.get<AuthManager>()));
}
