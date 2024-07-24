import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify2/apps/data/service/auth_service.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signin(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields');
      return;
    }

    final success = await AuthService()
        .signin(email: email, password: password, context: context);

    if (success) {
      Get.offAllNamed('/HOME'); // Navigate to home page
    } else {
      Get.snackbar('Error', 'Sign in failed');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
