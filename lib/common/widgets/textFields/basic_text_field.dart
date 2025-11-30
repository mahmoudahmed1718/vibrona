import 'package:flutter/material.dart';
import 'package:vibrona/core/config/theme/app_colors.dart';

class BasicTextField extends StatelessWidget {
  const BasicTextField({
    super.key,
    required this.text,
    this.onChanged,
    required this.icon,
  });
  final String text;
  final void Function(String)? onChanged;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: text,
        border: outlineBorder(),
        enabledBorder: outlineBorder(),
        focusedBorder: outlineBorder(),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),

      borderSide: BorderSide(color: AppColors.gray),
    );
  }
}
