import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:money_manager/app/pages/debug_screen/bindings/_binding.dart';
import 'package:money_manager/app/pages/debug_screen/views/debug_view.dart';
import 'package:money_manager/app/pages/demo/bindings/_binding.dart';
import 'package:money_manager/app/pages/demo/views/_view.dart';
import 'package:money_manager/app/pages/home/bindings/_binding.dart';
import 'package:money_manager/app/pages/home/views/_view.dart';
import 'package:money_manager/app/pages/login/bindings/login_binding.dart';
import 'package:money_manager/app/pages/login/views/login_view.dart';
import 'package:money_manager/app/ui/fragments.dart';

import '';
import '../middlewares/auth_guard.dart';

abstract class Routes {
  static const login = '/login';
  static const home = '/home';
  static const debug_screen = '/debug_screen';
  static const accounts = "/accounts";
}

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      // ignore: prefer_const_constructors
      page: () => HomeView(),
      binding: HomeBinding(),
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
    ),
    GetPage(
      name: Routes.accounts,
      page: () => AccountsView(),
      binding: HomeBinding(),
    )
  ];
}
