import 'package:get/get.dart';
import '../../../core/base_controller.dart';


class LoginController extends BaseController {
  RxString loginText = RxString('Please Wait..');

  Rxn<String> userEmailError = Rxn();
  Rxn<String> userPassError = Rxn();
  RxBool isVisible = RxBool(false);


  @override
  onInit() async {
    super.onInit();
    isVisible.value = true;
    loginText.value = "Please Login";

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
  }
}
