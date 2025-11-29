import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: Image.asset(AssetsImages.assetsImagesIslamSobhi),
            // ),
          ],
        ),
      ),
    );
  }
}
