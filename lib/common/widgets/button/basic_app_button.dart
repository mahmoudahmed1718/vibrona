import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton({
    super.key,
    this.onPressed,
    required this.text,
    this.hight,
  });
  final VoidCallback? onPressed;
  final String text;
  final double? hight;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(hight ?? 80),
      ),
      child: Text(text),
    );
  }
}
