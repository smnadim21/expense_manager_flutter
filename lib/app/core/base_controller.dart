import 'package:get/get.dart';
import 'package:money_manager/app/api/api_provider.dart';
import '../../tools/shared_pref.dart';
import '../services/auth_service.dart';

abstract class BaseController extends SuperController {
  final offlineData = Get.put(OfflineData());
  final authService = Get.find<AuthService>();
  final api = Get.put(ApiProvider());
  dynamic args = Get.arguments ?? {};
  RxString pageTitle = RxString("Money Manager");

  @override
  void onInit() {
    // TODO: implement onInit
    print("onInit() :  + ${Get.currentRoute}");
    args = Get.arguments;
    pageTitle.value = args != null ? args["title"] ?? "Money Manager" : "Money Manager";
    super.onInit();
  }
}
