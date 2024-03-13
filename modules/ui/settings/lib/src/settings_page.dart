import 'package:common_dependencies/common_dependencies.dart';
import 'package:common_ui/common_ui.dart';

import 'settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "I am a Module now :)",
              style: Get.textTheme.displaySmall?.copyWith(
                color: Get.theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ).marginSymmetric(vertical: Get.theme.layout.largePadding),
            const Spacer(),
            Text(
              "Add an Image or Animation!",
              style: Get.textTheme.displaySmall?.copyWith(
                color: Get.theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ).marginSymmetric(vertical: Get.theme.layout.largePadding),
            const Spacer(),

            /// change by the UI state class inside the controller
            controller.obx(
              (state) => Column(
                children: [
                  Text(
                    'runningOn'.trParams({"env": state!.env}),
                    style: Get.textTheme.bodyLarge,
                  ),
                  Text(
                    'endpoint'.trParams({"url": state.baseUrl}),
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodyLarge,
                  ),
                  Text(
                    'randomKey'.trParams({"randomKey": state.randomKey}),
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodyLarge,
                  ),
                ],
              ),
              onLoading: CircularProgressIndicator(),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: controller.logout,
              child: Text(
                "logout".tr,
                style: Get.textTheme.headlineMedium,
              ),
            ).marginSymmetric(vertical: Get.theme.layout.mediumPadding),
          ],
        ),
      ),
    );
  }
}
