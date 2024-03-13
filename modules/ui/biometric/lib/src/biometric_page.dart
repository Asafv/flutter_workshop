import 'package:biometric/src/biometric_controller.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:common_ui/common_ui.dart';

class BiometricPage extends GetView<BiometricController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'biometricTitle'.tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.displayMedium,
            ).marginOnly(
              top: Get.theme.layout.xLargePadding,
              bottom: Get.theme.layout.mediumPadding,
            ),

            /// independant reactive widget
            Text(
              'biometricDescription'.tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.headlineSmall,
            ).marginOnly(bottom: Get.theme.layout.xLargePadding),

            Obx(
              () => Column(
                children: [
                  FilledButton(
                    onPressed: controller.isBiometricInProgress.value
                        ? null
                        : controller.onBiometricLogin,
                    child: Padding(
                      padding: EdgeInsets.all(Get.theme.layout.smallPadding),
                      child: Text(
                        "biometricLogin".tr,
                        style: Get.textTheme.headlineMedium
                            ?.copyWith(color: Get.theme.colorScheme.onPrimary),
                      ),
                    ),
                  ).marginOnly(bottom: Get.theme.layout.xLargePadding),
                  Visibility(
                    visible: controller.isBiometricInProgress.value,
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),

            Obx(
              () => Visibility(
                visible: controller.isError.value,
                child: Text(
                  'biometricError'.tr,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headlineSmall
                      ?.copyWith(color: Get.theme.colorScheme.error),
                ),
              ),
            )

            /// State management from controller StateMixing
          ],
        ).paddingSymmetric(horizontal: Get.theme.layout.defaultPadding),
      ),
    );
  }
}
