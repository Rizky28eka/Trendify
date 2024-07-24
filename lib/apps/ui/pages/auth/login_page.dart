import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify2/apps/controllers/login_controller.dart';
import 'package:trendify2/apps/ui/widgets/icon_text_button_widget.dart';
import 'package:trendify2/apps/ui/widgets/text_form_field_widget.dart';
import 'package:trendify2/apps/utils/constants.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController loginController = Get.put(LoginController());

  final ResponsiveUtils responsiveUtils = Get.find<ResponsiveUtils>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(responsiveUtils.getWidthPercentage(0.05)),
              child: Form(
                key: loginController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderText(),
                    SizedBox(height: responsiveUtils.getWidthPercentage(0.02)),
                    _buildDescriptionText(),
                    SizedBox(height: responsiveUtils.getWidthPercentage(0.10)),
                    _buildEmailTextField(),
                    SizedBox(height: responsiveUtils.getWidthPercentage(0.05)),
                    _buildPasswordTextField(),
                    SizedBox(height: responsiveUtils.getWidthPercentage(0.05)),
                    _buildForgotPasswordText(context),
                    SizedBox(height: responsiveUtils.getWidthPercentage(0.05)),
                    _buildLoginButtons(),
                    SizedBox(height: responsiveUtils.getWidthPercentage(0.05)),
                    _buildRegisterOption(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Welcome To\n',
            style: TextStyle(
              fontSize: responsiveUtils.getWidthPercentage(0.12),
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          TextSpan(
            text: 'Trendify',
            style: TextStyle(
              fontSize: responsiveUtils.getWidthPercentage(0.12),
              fontWeight: FontWeight.bold,
              color: secondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionText() {
    return Text(
      "Log in to explore a world of amazing deals and products.",
      style: TextStyle(
        fontSize: responsiveUtils.getWidthPercentage(0.03),
        fontWeight: FontWeight.bold,
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormFieldWidget(
      hintText: "Email",
      icon: Icons.email,
      keyboardType: TextInputType.emailAddress,
      controller: loginController.emailController,
      onChanged: (value) => loginController.emailController.text = value,
      validator: (value) =>
          value == null || value.isEmpty ? 'Email is required' : null,
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormFieldWidget(
      hintText: "Password",
      icon: Icons.lock,
      keyboardType: TextInputType.visiblePassword,
      controller: loginController.passwordController,
      onChanged: (value) => loginController.passwordController.text = value,
      obscureText: true,
      validator: (value) =>
          value == null || value.isEmpty ? 'Password is required' : null,
    );
  }

  Widget _buildForgotPasswordText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Placeholder(),
              ),
            );
          },
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              color: primaryColor,
              fontSize: responsiveUtils.getWidthPercentage(0.025),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButtons() {
    return Center(
      child: Column(
        children: [
          Obx(
            () => IconTextButtonWidget(
              text: 'Log In',
              onPressed: loginController.isGoogleLoading.value
                  ? null
                  : loginController.login,
              isLoading: loginController.isEmailLoading.value,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterOption(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Placeholder(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account?',
            style: TextStyle(
              fontSize: responsiveUtils.getWidthPercentage(0.028),
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          SizedBox(width: responsiveUtils.getWidthPercentage(0.01)),
          Text(
            'Register',
            style: TextStyle(
              fontSize: responsiveUtils.getWidthPercentage(0.028),
              fontWeight: FontWeight.bold,
              color: secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
