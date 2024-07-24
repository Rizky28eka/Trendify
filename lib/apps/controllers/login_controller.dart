import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isEmailLoading = false.obs;
  final RxBool isGoogleLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      isEmailLoading.value = true;
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        Get.offAllNamed('/home');
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
          'Login Error',
          e.message ?? 'Unknown error occurred',
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isEmailLoading.value = false;
      }
    }
  }
}
