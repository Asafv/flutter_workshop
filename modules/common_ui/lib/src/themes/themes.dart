import 'package:common_dependencies/common_dependencies.dart';

import '../../common_ui.dart';
import 'app_assets.dart';
import 'app_colors.dart';
import 'app_colors_dark.dart';
import 'app_sizes.dart';
import 'app_text_theme.dart';
import 'color_schemes.dart';

extension ThemeUtils on ThemeData {
  AppColors get colors =>
      brightness == Brightness.light ? AppColors() : AppColorsDark();

  AppSizes get layout => const AppSizes();

  AppAssets get assets => const AppAssets();
}

class Themes {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  bool _loadThemeFromBox() => _box.read(_key) ?? true;

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  static ThemeData get lightTheme {
    return ThemeData(
      // this will override the default scaffold background color
      scaffoldBackgroundColor: lightColorScheme.background,
      colorScheme: lightColorScheme,
      useMaterial3: true,
      textTheme: const AppTextTheme(),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: darkColorScheme.background,
      colorScheme: darkColorScheme,
      useMaterial3: true,
      // we can chage the text theme based on the ThemeData we want to use
      textTheme: const AppTextTheme(),
    );
  }
}
