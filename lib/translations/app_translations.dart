import 'package:common_dependencies/common_dependencies.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "welcome": "Flutter Workshop is ALIVE!",
          "runningOn": "ENV: @env",
          "endpoint": "Endpoint: @url",
          "randomKey": "RandomKey: @randomKey",
          "loginTitle": "Login",
          "loginDescription": "Login and start your journey",
          "loginInProgress": "Login in progress\nThis can take a while...",
          "login": "Login",
          "tryAgainError": "Something went wrong.\nPlease try again.",
          "tryAgain": "Try Again"
        }
      };
}
