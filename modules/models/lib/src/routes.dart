enum Routes {
  home,
  login,
  biometric,
  // TODO add biometic route
  // TODO add settings route
}

extension RouteUtils on Routes {
  String get path => switch (this) {
        Routes.home => "/",
        _ => "/$name",
      };
}
