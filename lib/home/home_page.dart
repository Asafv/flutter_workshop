import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

// TODO move this to module at your free time :)

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            'randomKey'.trParams({"randomKey": Environment().config.randomKey}),
            textAlign: TextAlign.center,
            style: Get.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
