import 'package:environment/environment.dart';
import 'package:environment/src/config/base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get baseUrl => 'https://my.endpoint.dev';

  @override
  Flavor get env => Flavor.dev;

  @override
  String get randomKey => 'SHEKER-KOLSHEO DEV';
}
