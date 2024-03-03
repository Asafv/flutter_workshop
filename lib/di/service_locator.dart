import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

// we can import GetIt from common_dependencies
final locator = GetIt.instance;

Future<void> setupDependencies() async {
  await GetStorage.init();

  // Auth dependencies
  locator.registerSingleton<AuthRepository>(
      AuthRepository(remoteAuth: RemoteAuth()));

  locator.registerSingletonAsync(() async {
    final authManager =
        AuthManager(authRepository: locator.get<AuthRepository>());
    return await authManager.init();
  });

  /// wait for all needed dependencies to init
  await locator.allReady();

  debugPrint('DI complete');
}
