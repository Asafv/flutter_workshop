import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:models/models.dart';

import '../home/home_page.dart';

final pages = [
  GetPage(
    name: Routes.home.path,
    // middlewares: [AuthMiddleware(locator.get<AuthManager>())],
    transition: Transition.fade,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 300),
    // binding: HomeBinding(),
    page: () => const HomePage(),
  ),
  GetPage(
    name: Routes.login.path,
    transition: Transition.fade,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 300),
    binding: LoginBinding(),
    page: () => LoginPage(),
  )
];
