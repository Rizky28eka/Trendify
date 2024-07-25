import 'package:flutter/material.dart';
import 'package:trendify2/apps/utils/constants.dart';

class IconTextButtonWidget extends StatefulWidget {
  final String? text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  const IconTextButtonWidget({
    super.key,
    this.text,
    this.icon,
    required this.onPressed,
    this.isLoading = false,
    this.onChanged,
    this.keyboardType,
  });

  @override
  _IconTextButtonWidgetState createState() => _IconTextButtonWidgetState();
}

class _IconTextButtonWidgetState extends State<IconTextButtonWidget> {
  bool _isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        onPressed: !widget.isLoading && _isEnabled ? widget.onPressed : null,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          backgroundColor:
              !widget.isLoading && _isEnabled ? primaryColor : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Center(
          child: widget.isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : _buildButtonContent(),
        ),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (widget.icon != null && widget.text != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.icon!,
          const SizedBox(width: 8.0),
          Text(
            widget.text!,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      );
    } else if (widget.icon != null) {
      return widget.icon!;
    } else if (widget.text != null) {
      return Text(
        widget.text!,
        style: const TextStyle(color: Colors.white),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
