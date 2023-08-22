import 'package:money_manager/app/ui/theme_widgets.dart';
import 'package:money_manager/global_import.dart';

import '../../../core/base_controller.dart';

class HomeController extends BaseController {
  RxnString userPassError = RxnString();
  Rx<Widget> alertWidget = Rx<Widget>(const SizedBox());

  @override
  void onReady() {
    super.onReady();
    // Snack.oK("Welcome! FQS!");
  }

  @override
  void onDetached() {
    Snack.oK("onDetached ${Get.currentRoute}");
  }

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {
    // Snack.oK("onResumed ${Get.currentRoute}");
  }

  void test() {
    Snack.oK("Pressed!");
  }

  void alert(String s) {
    alertWidget.value = AlertText(
      alertText: s,
      onTap: () {
        alertWidget.value = const SizedBox();
      },
    );
  }

  hideAlert() {
    alertWidget.value = const SizedBox();
  }

  void success(String s, {bool inverse = false}) {
    alertWidget.value = inverse
        ? AlertText.successInverse(alertText: s, onTap: hideAlert)
        : AlertText.success(alertText: s, onTap: hideAlert);
  }

  void warn(String s, {bool inverse = false}) {
    alertWidget.value = inverse
        ? AlertText.warnInverse(alertText: s, onTap: hideAlert)
        : AlertText.warn(alertText: s, onTap: hideAlert);
  }

  void failure(String s, {bool inverse = false}) {
    alertWidget.value = inverse
        ? AlertText.dangerInverse(alertText: s, onTap: hideAlert)
        : AlertText.danger(alertText: s, onTap: hideAlert);
  }

  void info(String s, {bool inverse = false}) {
    alertWidget.value = inverse
        ? AlertText.infoInverse(alertText: s, onTap: hideAlert)
        : AlertText.info(alertText: s, onTap: hideAlert);
  }


}
