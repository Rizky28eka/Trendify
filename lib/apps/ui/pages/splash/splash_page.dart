import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trendify2/apps/controllers/splash_controller.dart';
import 'package:trendify2/apps/utils/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: ResponsiveUtils.to.getWidthPercentage(0.5),
              height: ResponsiveUtils.to.getWidthPercentage(0.5),
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: ResponsiveUtils.to.getHeightPercentage(0.02)),
            Text(
              'trendify2',
              style: headingTextStyle.copyWith(
                fontSize: ResponsiveUtils.to.getWidthPercentage(0.06),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
