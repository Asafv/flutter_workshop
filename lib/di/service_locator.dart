import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

// we can import GetIt from common_dependencies
final locator = GetIt.instance;

Future<void> setupDependencies() async {
  await GetStorage.init();

  // TODO add your dependencies here

  /// wait for all needed dependencies to init
  await locator.allReady();

  debugPrint('DI complete');
}
