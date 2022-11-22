
import 'package:n_flutter/global_import.dart';

import '../../../core/base_controller.dart';

class HomeController extends BaseController {


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Snack.oK("Welcome! FQS!");
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
    Snack.oK("onResumed ${Get.currentRoute}");
  }

  void test() {
    Snack.oK("Pressed!");
  }

}
