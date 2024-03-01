import 'package:common_dependencies/common_dependencies.dart';
import 'package:models/models.dart';

class LoginController extends GetxController with StateMixin {
  // change this to see success flow
  bool error = false;

  // Reactive field not related to State Mixin - will be inside Obx Widget
  final RxString descriptionText = "loginDescription".tr.obs;

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void onLoginClick() async {
    // change to loading state
    change(null, status: RxStatus.loading());
    await Future.delayed(Duration(seconds: 2));

    // Reactive update the UI
    descriptionText.value = "loginInProgress".tr;

    await Future.delayed(Duration(seconds: 3));

    // error
    if (error) {
      descriptionText.value = "loginDescription".tr;
      change(null, status: RxStatus.error("tryAgainError".tr));
      return;
    }

    // success flow
    Get.offAllNamed(Routes.home.name);
  }

  void onTryAgainClick() {
    // here we use success as the default
    change(null, status: RxStatus.success());
  }
}
