import 'package:environment/environment.dart';

abstract class BaseConfig {
  Flavor get env;
  String get baseUrl;
  String get randomKey;
}
