import 'package:flutter/material.dart';
import 'package:vibrona/common/widgets/appbar/basic_appbar.dart';
import 'package:vibrona/core/config/assets/assets_images.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BasicAppbar(
            widget: Center(
              child: Image.asset(AssetsImages.assetsImagesAppBarLogo),
            ),
          ),
          const SizedBox(height: 100),
          Text(
            'Sign in',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
