import 'package:common_dependencies/common_dependencies.dart';
import 'package:common_ui/common_ui.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'loginTitle'.tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.displayMedium,
            ).marginOnly(top: 60, bottom: 24),

            /// independant reactive widget
            Obx(
              () => Text(
                controller.descriptionText.value,
                textAlign: TextAlign.center,
                style: Get.textTheme.headlineSmall,
              ).marginOnly(bottom: 60),
            ),

            /// State management from controller StateMixing
            controller.obx(
              (state) => Column(
                children: [
                  FilledButton(
                    onPressed: controller.onLoginClick,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "login".tr,
                        style: Get.textTheme.headlineMedium
                            ?.copyWith(color: Get.theme.colorScheme.onPrimary),
                      ),
                    ),
                  ),
                ],
              ),
              onLoading: CircularProgressIndicator(),
              onError: (error) => Column(
                children: [
                  Text(
                    '$error',
                    textAlign: TextAlign.center,
                    style: Get.textTheme.titleLarge?.copyWith(
                      color: Get.theme.colorScheme.error,
                    ),
                  ).marginOnly(bottom: 24),
                  FilledButton(
                    onPressed: controller.onTryAgainClick,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "tryAgain".tr,
                        style: Get.textTheme.headlineSmall?.copyWith(
                          color: Get.theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
