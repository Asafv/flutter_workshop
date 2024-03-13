import 'package:common_dependencies/common_dependencies.dart';

// Easy translations providered by GetX
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "flutterWorkshop": "Flutter Workshop",
          "toTheMoon": "To the Moon!",
          "toTheGround": "To the Ground!",
          "crashToGround": "Crash to Ground",
          "flyToMoon": "Fly to Moon",
          "runningOn": "ENV: @env",
          "endpoint": "Endpoint: @url",
          "randomKey": "RandomKey: @randomKey",
          "loginTitle": "Login",
          "loginDescription": "Login and start your journey",
          "loginInProgress": "Login in progress\nThis can take a while...",
          "login": "Login",
          "tryAgainError": "Something went wrong.\nPlease try again.",
          "tryAgain": "Try Again",
          "biometricTitle": "Biometric Required",
          "biometricDescription":
              "We keep your data safe with biometric entrance!",
          "biometricLogin": "Biometric Login",
          "biometricError": "Biometric Error, Please try again",
        }
      };
}
