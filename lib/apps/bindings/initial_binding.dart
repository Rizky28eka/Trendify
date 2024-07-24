import 'package:get/get.dart';
import 'package:trendify2/apps/bindings/onboarding_binding.dart';
import 'splash_binding.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    SplashBinding().dependencies();
    OnboardingBinding().dependencies();
  }
}
