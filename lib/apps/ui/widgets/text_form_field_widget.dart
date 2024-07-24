import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Color? textColor;
  final Color? hintColor;
  final Color? borderColor;
  final Color? cursorColor;
  final Color? iconColor;
  final Color? suffixIconColor;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;
  final double? borderRadius;
  final TextStyle? textStyle;
  final FocusNode? focusNode;

  const TextFormFieldWidget({
    super.key,
    this.hintText,
    this.icon,
    this.controller,
    this.keyboardType,
    this.textColor,
    this.hintColor,
    this.borderColor,
    this.cursorColor,
    this.iconColor,
    this.suffixIconColor,
    this.onChanged,
    this.obscureText = false,
    this.validator,
    this.borderRadius,
    this.textStyle,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final _obscureText = RxBool(obscureText);

    return SizedBox(
      width: screenWidth * 0.9,
      child: Obx(() => TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: _obscureText.value,
            style: textStyle ??
                TextStyle(
                  color: textColor ?? Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: screenWidth * 0.03,
                ),
            cursorColor: cursorColor ?? Colors.grey,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintColor ?? Colors.grey,
                fontSize: screenWidth * 0.03,
              ),
              prefixIcon: icon != null
                  ? Icon(icon,
                      color: iconColor ?? Colors.grey, size: screenWidth * 0.06)
                  : null,
              suffixIcon: obscureText
                  ? IconButton(
                      icon: Icon(
                        _obscureText.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: suffixIconColor ?? Colors.grey.withOpacity(0.7),
                        size: screenWidth * 0.06,
                      ),
                      onPressed: () {
                        _obscureText.toggle();
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
                borderSide: BorderSide(
                  color: borderColor ?? Colors.grey,
                  width: 2.0,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: screenWidth * 0.03,
                horizontal: screenWidth * 0.04,
              ),
            ),
            onChanged: onChanged,
            validator: validator,
          )),
    );
  }
}
