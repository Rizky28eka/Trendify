import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify2/apps/controllers/login_controller.dart';
import 'package:trendify2/apps/ui/widgets/text_form_field_widget.dart';
import 'package:trendify2/apps/ui/widgets/icon_text_button_widget.dart';
import 'package:trendify2/apps/utils/constants.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final ResponsiveUtils responsiveUtils = Get.find<ResponsiveUtils>();
  final _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: _signup(context),
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome\n',
                            style: headingTextStyle.copyWith(
                              fontSize:
                                  responsiveUtils.getWidthPercentage(0.12),
                              color: primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: 'back!',
                            style: headingTextStyle.copyWith(
                              fontSize:
                                  responsiveUtils.getWidthPercentage(0.12),
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
                      "Discover top trends and exclusive deals in our e-commerce platform. Ready to explore the best products and offers?",
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
                    _forgotPassword(),
                    SizedBox(
                      height: responsiveUtils.getHeightPercentage(0.02),
                    ),
                    _signin(),
                    SizedBox(
                      height: responsiveUtils.getHeightPercentage(0.02),
                    ),
                    _orText(),
                    SizedBox(
                      height: responsiveUtils.getHeightPercentage(0.02),
                    ),
                    _googleSignInButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailAddress() {
    return TextFormFieldWidget(
      controller: loginController.emailController,
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
      controller: loginController.passwordController,
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

  Widget _forgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Get.toNamed('/FORGOT_PASSWORD');
        },
        child: Text(
          'Forgot Password?',
          style: bodyTextStyle.copyWith(
            color: primaryColor,
            fontSize: responsiveUtils.getWidthPercentage(0.03),
          ),
        ),
      ),
    );
  }

  Widget _signin() {
    return SizedBox(
      width: double.infinity,
      child: IconTextButtonWidget(
        text: 'Sign In',
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            loginController.signin(Get.context!);
          }
        },
        isLoading: loginController.isLoading.value,
      ),
    );
  }

  Widget _googleSignInButton() {
    return SizedBox(
      width: double.infinity,
      child: IconTextButtonWidget(
        text: 'Sign in with Google',
        onPressed: () {
          loginController.signInWithGoogle();
        },
        isLoading: loginController.isLoading.value,
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

  Widget _signup(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(responsiveUtils.getWidthPercentage(0.04)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account? ',
            style: bodyTextStyle.copyWith(
              fontSize: responsiveUtils.getWidthPercentage(0.03),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed('/REGISTER');
            },
            child: Text(
              'Sign Up',
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
