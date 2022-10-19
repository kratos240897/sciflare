import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sciflare/modules/add_user/add_user.dart';
import 'package:sciflare/modules/add_user/add_user_binding.dart';
import 'package:sciflare/modules/home/home.dart';
import 'package:sciflare/modules/home/home_binding.dart';
import 'package:sciflare/routes/routes.dart';

class PageRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HOME:
        return GetPageRoute(
          routeName: Routes.HOME,
          page: () => const Home(),
          binding: HomeBinding(),
        );
      case Routes.ADD_USER:
        return GetPageRoute(
            routeName: Routes.ADD_USER,
            page: () => AddUser(),
            binding: AddUserBinding());
    }
    return null;
  }
}
