import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/local_routes.dart';
import '../services/auth_service.dart';

class AuthGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    if (kDebugMode) {
      print("route: ${route!}");
    }
    return authService.loggedIn
        ? null
        : const RouteSettings(name: Routes.login);
  }
}
