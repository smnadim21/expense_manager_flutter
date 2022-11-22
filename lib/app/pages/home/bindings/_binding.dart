import 'package:get/get.dart';

import '../controllers/_controller.dart';

class HomeBinding extends Bindings {
  @override
  Future<void> dependencies() async {
/*    Get.put<ApiProvider>(ApiProvider());
    Get.lazyPut<DemoController>(() => DemoController());*/

    //Get.put(HomeController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
