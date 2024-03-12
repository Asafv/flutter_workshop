import 'package:common_dependencies/common_dependencies.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:models/models.dart';

// TODO Move HomePage to its own module
// - State Management (page → binding → controller [user actions only])

// TODO Move SettingsPage to its own module
// - Navigation (keep same page transition)
// - Architecture + State Management
//   (page → binding → controller with stateMixing<YourStateClass> → authManager)

class HomePage extends StatelessWidget {
  // TODO handle state changes from inside the controller!
  final RxBool _toTheMoon = true.obs;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      appBar: AppBar(
          title: const Text("flutter Workshop"),
          leading: IconButton(
              onPressed: () => _settingsPage(),
              icon: const Icon(Icons.settings)),
          actions: [
            IconButton(
                onPressed: () => Themes().switchTheme(),
                icon: Icon(isLight ? Icons.light_mode : Icons.dark_mode))
          ]),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Loading image asset from ThemeData with layout from ThemeData extension
                Image.asset(
                  Get.theme.assets.images.flutterBird,
                  height: Get.theme.layout.smallLogoSize.height,
                  width: Get.theme.layout.smallLogoSize.width,
                ).marginSymmetric(horizontal: Get.theme.layout.smallPadding),
                Obx(
                  () => Text(
                    _toTheMoon.value ? 'toTheMoon'.tr : 'toTheGround'.tr,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.displayMedium
                        // custom color used from ThemeData extension
                        ?.copyWith(color: Get.theme.colors.customColor),
                  ),
                ),
              ],
            ).marginSymmetric(vertical: Get.theme.layout.mediumPadding),

            /// Loading animation asset from ThemeData
            Obx(
              () => AnimatedRotation(
                  turns: _toTheMoon.value ? 0.0 : 1 / 2,
                  duration: const Duration(milliseconds: 350),
                  child: LottieBuilder.asset(
                      Get.theme.assets.animations.flyingRocket)),
            ),

            Obx(
              () => FilledButton(
                  onPressed: () => _toTheMoon.value = !_toTheMoon.value,
                  child: Text(
                      _toTheMoon.value ? "crashToGround".tr : "flyToMoon".tr)),
            ).marginOnly(bottom: Get.theme.layout.mediumPadding),
          ],
        ),
      ),
    );
  }

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
