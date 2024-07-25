import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify2/apps/data/service/auth_service.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> signin(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields');
      return;
    }

    isLoading.value = true;
    try {
      final success = await AuthService().signin(
        email: email,
        password: password,
        context: context,
      );

      if (success) {
        Get.offAllNamed('/HOME');
      } else {
        Get.snackbar('Error', 'Sign in failed');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    try {
      final success = await AuthService().signInWithGoogle();

      if (success) {
        Get.offAllNamed('/HOME');
      } else {
        Get.snackbar('Error', 'Google sign-in failed');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
