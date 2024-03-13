enum Routes {
  home,
  login,
  biometric,
  settings,
}

extension RouteUtils on Routes {
  String get path => switch (this) {
        Routes.home => "/",
        _ => "/$name",
      };
}
