import 'package:environment/src/config/base_config.dart';
import 'package:environment/src/config/dev/dev_config.dart';
import 'package:environment/src/config/prod/prod_config.dart';

enum Flavor {
  dev,
  prod;

  factory Flavor.fromName(String name) =>
      Flavor.values.firstWhere((element) => element.name == name);
}

T? runOnFlavor<T>({
  Function()? dev,
  Function()? prod,
}) {
  switch (Environment().config.env) {
    case Flavor.dev:
      if (dev != null) {
        return dev.call();
      }
      break;
    case Flavor.prod:
      if (prod != null) {
        return prod.call();
      }
  }
  return null;
}

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  late BaseConfig config;

  initConfig(Flavor flavor) {
    print('Flavor: ${flavor.name}');
    config = _getConfig(flavor);
  }

  BaseConfig _getConfig(Flavor flavor) {
    switch (flavor) {
      case Flavor.prod:
        return ProdConfig();
      case Flavor.dev:
        return DevConfig();
    }
  }
}
