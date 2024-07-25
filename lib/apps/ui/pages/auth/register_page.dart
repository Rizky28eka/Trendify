import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify2/apps/controllers/register_controller.dart';

import 'package:trendify2/apps/ui/widgets/text_form_field_widget.dart';
import 'package:trendify2/apps/ui/widgets/icon_text_button_widget.dart';
import 'package:trendify2/apps/utils/constants.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController registerController = Get.put(RegisterController());
  final ResponsiveUtils responsiveUtils = Get.find<ResponsiveUtils>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: _signin(context),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveUtils.getWidthPercentage(0.04),
              vertical: responsiveUtils.getHeightPercentage(0.02),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 400,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Create\n',
                          style: headingTextStyle.copyWith(
                            fontSize: responsiveUtils.getWidthPercentage(0.12),
                            color: primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'an Account!',
                          style: headingTextStyle.copyWith(
                            fontSize: responsiveUtils.getWidthPercentage(0.12),
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: responsiveUtils.getHeightPercentage(0.02),
                  ),
                  Text(
                    "Join our community and start exploring the best trends and deals today!",
                    textAlign: TextAlign.left,
                    style: bodyTextStyle.copyWith(
                      fontSize: responsiveUtils.getWidthPercentage(0.03),
                    ),
                  ),
                  SizedBox(
                    height: responsiveUtils.getHeightPercentage(0.03),
                  ),
                  _emailAddress(),
                  SizedBox(
                    height: responsiveUtils.getHeightPercentage(0.02),
                  ),
                  _password(),
                  SizedBox(
                    height: responsiveUtils.getHeightPercentage(0.02),
                  ),
                  _confirmPassword(),
                  SizedBox(
                    height: responsiveUtils.getHeightPercentage(0.02),
                  ),
                  _register(),
                  SizedBox(
                    height: responsiveUtils.getHeightPercentage(0.02),
                  ),
                  _orText(),
                  SizedBox(
                    height: responsiveUtils.getHeightPercentage(0.02),
                  ),
                  _googleSignUpButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailAddress() {
    return TextFormFieldWidget(
      controller: registerController.emailController,
      hintText: 'Email',
      icon: Icons.email,
      keyboardType: TextInputType.emailAddress,
      textColor: Colors.black,
      hintColor: const Color(0xff6A6A6A),
      borderColor: const Color(0xffF7F7F9),
      cursorColor: Colors.grey,
      iconColor: Colors.grey,
      suffixIconColor: Colors.grey.withOpacity(0.7),
      onChanged: (value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }

  Widget _password() {
    return TextFormFieldWidget(
      obscureText: true,
      controller: registerController.passwordController,
      hintText: 'Password',
      icon: Icons.lock,
      textColor: Colors.black,
      hintColor: const Color(0xff6A6A6A),
      borderColor: const Color(0xffF7F7F9),
      cursorColor: Colors.grey,
      iconColor: Colors.grey,
      suffixIconColor: Colors.grey.withOpacity(0.7),
      onChanged: (value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  Widget _confirmPassword() {
    return TextFormFieldWidget(
      obscureText: true,
      controller: registerController.confirmPasswordController,
      hintText: 'Confirm Password',
      icon: Icons.lock,
      textColor: Colors.black,
      hintColor: const Color(0xff6A6A6A),
      borderColor: const Color(0xffF7F7F9),
      cursorColor: Colors.grey,
      iconColor: Colors.grey,
      suffixIconColor: Colors.grey.withOpacity(0.7),
      onChanged: (value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value != registerController.passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  Widget _register() {
    return SizedBox(
      width: double.infinity,
      child: IconTextButtonWidget(
        text: 'Register',
        onPressed: () {
          registerController.register(Get.context!);
        },
        isLoading: registerController.isLoading.value,
      ),
    );
  }

  Widget _googleSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: IconTextButtonWidget(
        text: 'Sign up with Google',
        onPressed: () {
          registerController.signUpWithGoogle();
        },
        isLoading: registerController.isLoading.value,
      ),
    );
  }

  Widget _orText() {
    return Center(
      child: Text(
        'OR',
        style: bodyTextStyle.copyWith(
          fontSize: responsiveUtils.getWidthPercentage(0.03),
          fontWeight: FontWeight.bold,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _signin(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(responsiveUtils.getWidthPercentage(0.04)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account? ',
            style: bodyTextStyle.copyWith(
              fontSize: responsiveUtils.getWidthPercentage(0.03),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed('/LOGIN');
            },
            child: Text(
              'Sign In',
              style: bodyTextStyle.copyWith(
                color: primaryColor,
                fontSize: responsiveUtils.getWidthPercentage(0.03),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
