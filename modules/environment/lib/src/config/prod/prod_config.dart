import 'package:environment/environment.dart';
import 'package:environment/src/config/base_config.dart';

class ProdConfig implements BaseConfig {
  @override
  String get baseUrl => 'https://my.endpoint.com';

  @override
  Flavor get env => Flavor.prod;

  @override
  String get randomKey => 'SHEKER-KOLSHEO PROD';
}
