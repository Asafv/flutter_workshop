import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:models/models.dart';

import '../di/service_locator.dart';
import '../home/home_page.dart';
import 'middlewares/auth_middleware.dart';

final pages = [
  GetPage(
    name: Routes.home.path,
    // This will be triggered everytime we want to get the home page
    middlewares: [AuthMiddleware(locator.get<AuthManager>())],
    transition: Transition.fade,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 300),
    // binding: HomeBinding(),
    page: () => HomePage(),
  ),
  GetPage(
    name: Routes.login.path,
    transition: Transition.fade,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 300),
    binding: LoginBinding(),
    page: () => LoginPage(),
  ),
  // TODO add biometric page (from biometric module)
];
