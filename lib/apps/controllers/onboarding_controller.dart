import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:trendify2/apps/ui/pages/auth/login_page.dart';

class OnboardingController extends GetxController {
  final GlobalKey<IntroductionScreenState> introKey =
      GlobalKey<IntroductionScreenState>();

  Widget buildSvg(String assetName, {required double size}) {
    return SvgPicture.asset(
      'assets/images/onboarding/$assetName',
      width: 350.0,
      fit: BoxFit.cover,
    );
  }

  void onIntroEnd() {
    Get.off(() => LoginPage());
  }
}
