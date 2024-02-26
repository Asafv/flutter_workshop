// TODO add your routes here
enum Routes {
  home,
}

extension RouteUtils on Routes {
  String get path => switch (this) {
        Routes.home => "/",
        _ => "/$name",
      };
}
