// TODO add your routes here
enum Routes {
  home,
  login,
}

extension RouteUtils on Routes {
  String get path => switch (this) {
        Routes.home => "/",
        _ => "/$name",
      };
}
