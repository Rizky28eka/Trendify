import 'package:get/get.dart';
import 'package:trendify2/apps/controllers/home_controller.dart';
import 'package:trendify2/apps/controllers/login_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
