import 'package:common_dependencies/common_dependencies.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:models/models.dart';

class HomeController extends GetxController {
  final RxBool toTheMoon = true.obs;

  void switchTheme() => Themes().switchTheme();

  void switchFlightDirection() => toTheMoon.value = !toTheMoon.value;

  void onSettingsPressed() async => await _settingsPage();

  // TODO Move SettingsPage to its own module
// - Navigation (keep same page transition)
// - Architecture + State Management
//   (page → binding → controller with stateMixing<YourStateClass> → authManager)
  Future<dynamic>? _settingsPage() {
    // Get.to() = dynamic widget loading as a page.. for extra flexability without defining in routes
    return Get.to(
      Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Move me to module!",
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
              // TODO get all env data from controller and return it to ui with StateMixin<SettingsUiState> -> controller.obx
              Text(
                'runningOn'.trParams({"env": Environment().config.env.name}),
                style: Get.textTheme.bodyLarge,
              ),
              Text(
                'endpoint'.trParams({"url": Environment().config.baseUrl}),
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyLarge,
              ),
              Text(
                'randomKey'
                    .trParams({"randomKey": Environment().config.randomKey}),
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyLarge,
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () async {
                  // TODO move this inside the controller and make sure controller calls the auth manager through a dependency injection!
                  final success = await GetIt.I.get<AuthManager>().logout();
                  if (success) {
                    Get.offNamed(Routes.login.path);
                  }
                },
                child: Text(
                  "Logout",
                  style: Get.textTheme.headlineMedium,
                ),
              ).marginSymmetric(vertical: Get.theme.layout.mediumPadding),
            ],
          ),
        ),
      ),
      transition: Transition.rightToLeft,
    );
  }
}
