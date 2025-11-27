import 'package:flutter/material.dart';
import 'package:vibrona/core/config/assets/assets_images.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsImages.assetsImagesBakcgorundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withValues(alpha: 0.6),
            child: Column(
              children: [
                Image.asset(AssetsImages.assetsImagesLogo),
                Spacer(),
                Text(
                  "Enjoy listening to your favorite music",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
