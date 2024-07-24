import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Constants for colors and text styles
const Color primaryColor = Color(0xFF000000);
const Color secondaryColor = Color(0xff407BFF);
const Color backgroundColor = Color(0xFFF5F5F5);
const Color accentColor = Color(0xFFBB86FC);

const double headingFontSize = 26.0;
const double subheadingFontSize = 20.0;
const double bodyFontSize = 16.0;
const double captionFontSize = 12.0;

const TextStyle headingTextStyle = TextStyle(
  fontSize: headingFontSize,
  fontWeight: FontWeight.bold,
  color: primaryColor,
);

const TextStyle subheadingTextStyle = TextStyle(
  fontSize: subheadingFontSize,
  fontWeight: FontWeight.w600,
  color: primaryColor,
);

const TextStyle bodyTextStyle = TextStyle(
  fontSize: bodyFontSize,
  fontWeight: FontWeight.normal,
  color: Colors.black87,
);

const TextStyle captionTextStyle = TextStyle(
  fontSize: captionFontSize,
  fontWeight: FontWeight.normal,
  color: Colors.grey,
);

class ResponsiveUtils extends GetxController {
  // Singleton pattern for global access
  static ResponsiveUtils get to => Get.find();

  // Update screen size when the screen size changes
  @override
  void onInit() {
    super.onInit();
    // Listen to screen size changes if needed
    // Example: Get.window.onResize(() => update());
  }

  double get width => Get.size.width;
  double get height => Get.size.height;

  double getWidthPercentage(double percentage) {
    return width * (percentage);
  }

  double getHeightPercentage(double percentage) {
    return height * (percentage);
  }
}

// app_constants.dart
const String onboardingTitle1 = "Discover the Trend";
const String onboardingBody1 =
    "Explore the latest trends and hottest products in the market with Trendify.";

const String onboardingTitle2 = "Personalized Shopping";
const String onboardingBody2 =
    "Get tailored recommendations and exclusive deals based on your preferences.";

const String onboardingTitle3 = "Seamless Checkout";
const String onboardingBody3 =
    "Enjoy a smooth and secure checkout experience with multiple payment options.";
