import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<LoginController>(() => LoginController());
/*
    Get.put<ApiProvider>(ApiProvider());
    Get.lazyPut<LoginController>(() => LoginController());
    await super.dependencies();
*/

   // SharedPreferences.getInstance().then((value) => Get.put(value,tag:"SharedPreferences"));
    //Get.lazyPut<SharedPreferences>(() => );
   // Get.lazyPut<LoginController>(() => LoginController());
  }
}
