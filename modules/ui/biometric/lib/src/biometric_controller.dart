import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:models/models.dart';

class BiometricController extends GetxController {
  final AuthManager _authManager;

  BiometricController(this._authManager);

  final RxBool isBiometricInProgress = false.obs;
  final RxBool isError = false.obs;

  onBiometricLogin() async {
    isBiometricInProgress.value = true;
    isError.value = false;

    final success = await _authManager.biometricAccessRequest();
    if (success) {
      await Get.offAllNamed(Routes.home.path);
    }

    // change back the state & display some error
    isBiometricInProgress.value = false;
    isError.value = true;
  }
}
