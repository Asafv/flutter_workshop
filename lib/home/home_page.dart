import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

// TODO move this to module at your free time :)

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'welcome'.tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.displayMedium,
            ).marginOnly(bottom: 24),
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
            OutlinedButton(
              onPressed: () async {
                // TODO bad practice, this code should be inside the controller!
                final success = await GetIt.I.get<AuthManager>().logout();
                if (success) {
                  Get.offNamed(Routes.login.path);
                }
              },
              child: Text(
                "Logout",
                style: Get.textTheme.headlineMedium,
              ),
            ).marginSymmetric(vertical: 24)
          ],
        ),
      ),
    );
  }
}
