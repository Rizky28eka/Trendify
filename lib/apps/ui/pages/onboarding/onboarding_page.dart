import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';
import 'package:trendify2/apps/controllers/onboarding_controller.dart';
import 'package:trendify2/apps/utils/constants.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    final ResponsiveUtils responsive = ResponsiveUtils.to;

    final double pageMargin = responsive.getWidthPercentage(0.04);
    final double imageSize = responsive.getWidthPercentage(0.02);

    final pageDecoration = PageDecoration(
      titleTextStyle: headingTextStyle,
      bodyTextStyle: bodyTextStyle,
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
      imageAlignment: Alignment.center,
      contentMargin: EdgeInsets.all(pageMargin),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: IntroductionScreen(
          key: controller.introKey,
          globalBackgroundColor: Colors.white,
          allowImplicitScrolling: true,
          autoScrollDuration: 3000,
          infiniteAutoScroll: true,
          pages: [
            PageViewModel(
              title: onboardingTitle1,
              body: onboardingBody1,
              image: controller.buildSvg('img1.svg', size: imageSize),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: onboardingTitle2,
              body: onboardingBody2,
              image: controller.buildSvg('img2.svg', size: imageSize),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: onboardingTitle3,
              body: onboardingBody3,
              image: controller.buildSvg('img3.svg', size: imageSize),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => controller.onIntroEnd(),
          onSkip: () => controller.onIntroEnd(),
          showSkipButton: true,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: false,
          back: const Icon(Icons.arrow_back),
          skip: Text(
            'Skip',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: primaryColor,
              fontSize: responsive.getWidthPercentage(0.04),
            ),
          ),
          next: Icon(
            Icons.arrow_forward,
            color: primaryColor,
            size: responsive.getWidthPercentage(0.06),
          ),
          done: Text(
            'Done',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: primaryColor,
              fontSize: responsive.getWidthPercentage(0.04),
            ),
          ),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: EdgeInsets.all(pageMargin),
          controlsPadding: kIsWeb
              ? EdgeInsets.all(responsive.getWidthPercentage(0.03))
              : EdgeInsets.fromLTRB(
                  responsive.getWidthPercentage(0.02),
                  responsive.getWidthPercentage(0.01),
                  responsive.getWidthPercentage(0.02),
                  responsive.getWidthPercentage(0.01),
                ),
          dotsDecorator: DotsDecorator(
            size: Size(responsive.getWidthPercentage(0.03),
                responsive.getWidthPercentage(0.03)),
            activeSize: Size(responsive.getWidthPercentage(0.07),
                responsive.getWidthPercentage(0.03)),
            activeColor: primaryColor,
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(responsive.getWidthPercentage(0.03))),
            ),
          ),
          dotsContainerDecorator: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(responsive.getWidthPercentage(0.02))),
            ),
          ),
        ),
      ),
    );
  }
}
