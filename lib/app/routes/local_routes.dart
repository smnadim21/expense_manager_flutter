import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:n_flutter/app/pages/debug_screen/bindings/_binding.dart';
import 'package:n_flutter/app/pages/debug_screen/views/debug_view.dart';
import 'package:n_flutter/app/pages/demo/bindings/_binding.dart';
import 'package:n_flutter/app/pages/demo/views/_view.dart';
import 'package:n_flutter/app/pages/home/bindings/_binding.dart';
import 'package:n_flutter/app/pages/home/views/_view.dart';
import 'package:n_flutter/app/pages/login/bindings/login_binding.dart';
import 'package:n_flutter/app/pages/login/views/login_view.dart';

import '';
import '../middlewares/auth_guard.dart';

abstract class Routes {
  static const login = '/login';
  static const home = '/home';
  static const debug_screen = '/debug_screen';
}

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      // ignore: prefer_const_constructors
      page: () => HomeView(),
      binding: HomeBinding(),
      middlewares: [
        AuthGuard(), //Need to be logged in to get to this page
      ],
    ),
    GetPage(
      name: Routes.login,
      // ignore: prefer_const_constructors
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.debug_screen,
      // ignore: prefer_const_constructors
      page: () => DebugView(),
      binding: DebugBinding(),
    )
  ];
}
