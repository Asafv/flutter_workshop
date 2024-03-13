import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:models/models.dart';

// custom state class to inject to SettingsPage once state changes
class SettingsUiState {
  final String env;
  final String baseUrl;
  final String randomKey;

  SettingsUiState({
    required this.env,
    required this.baseUrl,
    required this.randomKey,
  });
}

class SettingsController extends GetxController
    with StateMixin<SettingsUiState?> {
  final AuthManager _authManager;
  SettingsController(this._authManager);

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  void _init() async {
    change(null, status: RxStatus.loading());

    await Future.delayed(Duration(seconds: 2));
    // changing the state with our custom UI state class
    change(
        SettingsUiState(
          env: Environment().config.env.name,
          baseUrl: Environment().config.baseUrl,
          randomKey: Environment().config.randomKey,
        ),
        status: RxStatus.success());
  }

  void logout() async {
    final success = await _authManager.logout();
    if (success) {
      Get.offNamed(Routes.login.path);
    }
  }
}
