import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

class AuthMiddleware extends GetMiddleware {
  final AuthManager _authManager;

  AuthMiddleware(this._authManager);

  @override
  RouteSettings? redirect(String? route) {
    debugPrint("authState: ${_authManager.authState}");

    switch (_authManager.authState) {
      case AuthState.none:
      case AuthState.loginRequired:
        return RouteSettings(name: Routes.login.path);

      // TODO add biometric route if auth state is required
      case AuthState.biometricRequired:
      // return RouteSettings(name: Routes.biometric.path);

      case AuthState.authenticated:
        return null;
    }
  }
}
