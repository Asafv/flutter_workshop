import '../../common_ui.dart';

class AppTextTheme extends TextTheme {
  // Headline 1
  @override
  TextStyle get displayMedium => TextStyle(
        fontSize: 44,
        fontWeight: FontWeight.w700,
      );

  // Headline 2
  @override
  TextStyle get displaySmall => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
      );

  // Headline 3
  @override
  TextStyle get headlineMedium => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      );

  // Headline 4
  @override
  TextStyle get headlineSmall => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );

  // Body1.Medium
  @override
  TextStyle get titleSmall => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

// Body1.Regular
  @override
  TextStyle get bodyLarge => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

// Body2.Regular
  @override
  TextStyle get bodyMedium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

// Secondary.OVERLINE
  @override
  TextStyle get bodySmall => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.9,
      );

  const AppTextTheme();
}
