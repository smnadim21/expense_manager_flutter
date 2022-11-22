import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class AuthService extends GetxService {
  bool loggedIn = false;

  AuthService init() {
    return this;
  }
}
