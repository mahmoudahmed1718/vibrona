import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vibrona/common/widgets/button/basic_app_button.dart';
import 'package:vibrona/core/config/assets/assets_images.dart';
import 'package:vibrona/core/config/assets/assets_vectors.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(AssetsVectors.assetsVectorsTopPattern),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(AssetsVectors.assetsVectorsBottomPattern),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,

                      child: Image.asset(AssetsImages.assetsImagesLogo),
                    ),

                    Text(
                      'Welcome to Vibrona',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Sign up or Sign in to continue your journey',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: BasicAppButton(
                            text: 'Sign Up',

                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              minimumSize: Size.fromHeight(80),
                            ),

                            onPressed: () {},

                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
