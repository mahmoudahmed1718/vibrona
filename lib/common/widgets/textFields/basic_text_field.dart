import 'package:flutter/material.dart';
import 'package:vibrona/core/config/theme/app_colors.dart';

class BasicTextField extends StatelessWidget {
  const BasicTextField({
    super.key,
    required this.text,
    this.onChanged,
    required this.icon,
    this.isobscure,
  });
  final String text;
  final void Function(String)? onChanged;
  final Widget icon;
  final bool? isobscure;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isobscure ?? false,
      onChanged: onChanged,

      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: text,
        contentPadding: const EdgeInsets.all(25),
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
