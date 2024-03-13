import 'package:biometric/src/biometric_controller.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';

// once we define our bindings, we have a dedicated place to
// initialize our dependencies for the controller
class BiometricBinding extends Bindings {
  @override
  void dependencies() =>
      Get.lazyPut(() => BiometricController(GetIt.I.get<AuthManager>()));
}
