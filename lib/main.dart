import 'dart:async';
import 'dart:ui';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_workshop/di/service_locator.dart';
import 'app.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    String env = const String.fromEnvironment("FLAVOR", defaultValue: 'dev');
    Environment().initConfig(Flavor.fromName(env));

    await setupDependencies();

    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    PlatformDispatcher.instance.onError = (error, stack) {
      debugPrint('ERROR: $error, stack: $stack');
      // FirebaseCrashlytics.instance.recordFlutterError(
      //     FlutterErrorDetails(exception: '$error', stack: stack));
      return true;
    };

    runApp(const MainApp());
  }, (error, stack) {
    debugPrint('ERROR: $error, stack: $stack');
    // FirebaseCrashlytics.instance.recordFlutterFatalError(
    //     FlutterErrorDetails(exception: '$error', stack: stack));
  });
}
