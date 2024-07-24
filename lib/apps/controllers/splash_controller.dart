import 'package:get/get.dart';
import 'package:trendify2/apps/ui/pages/onboarding/onboarding_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHomePage();
  }

  void _navigateToHomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(() => OnBoardingPage());
  }
}
