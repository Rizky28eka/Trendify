import 'package:get/get.dart';
import 'package:trendify2/apps/bindings/onboarding_binding.dart';
import 'package:trendify2/apps/bindings/splash_binding.dart';
import 'package:trendify2/apps/ui/pages/onboarding/onboarding_page.dart';
import 'package:trendify2/apps/ui/pages/splash/splash_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => OnBoardingPage(),
      binding: OnboardingBinding(),
    ),
  ];
}
