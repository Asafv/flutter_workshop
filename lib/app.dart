import 'package:common_dependencies/common_dependencies.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:models/models.dart';

import 'navigation/pages.dart';
import 'translations/app_translations.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: Themes().theme,
      initialRoute: Routes.home.path,
      getPages: pages,
      translations: AppTranslations(),
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 300),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
