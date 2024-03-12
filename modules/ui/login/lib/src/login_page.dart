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
            ).marginOnly(
              top: Get.theme.layout.xLargePadding,
              bottom: Get.theme.layout.mediumPadding,
            ),

            /// independant reactive widget
            Obx(
              () => Text(
                controller.descriptionText.value,
                textAlign: TextAlign.center,
                style: Get.textTheme.headlineSmall,
              ).marginOnly(bottom: Get.theme.layout.xLargePadding),
            ),

            /// State management from controller StateMixing
            controller.obx(
              (state) => Column(
                children: [
                  FilledButton(
                    onPressed: controller.onLoginClick,
                    child: Padding(
                      padding: EdgeInsets.all(Get.theme.layout.smallPadding),
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
                  ).marginOnly(bottom: Get.theme.layout.mediumPadding),
                  FilledButton(
                    onPressed: controller.onTryAgainClick,
                    child: Padding(
                      padding: EdgeInsets.all(Get.theme.layout.smallPadding),
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
        ).paddingSymmetric(horizontal: Get.theme.layout.defaultPadding),
      ),
    );
  }
}
