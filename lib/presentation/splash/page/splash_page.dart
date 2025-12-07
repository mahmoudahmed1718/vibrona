import 'package:flutter/material.dart';
import 'package:vibrona/core/config/assets/assets_images.dart';
import 'package:vibrona/data/sources/auth/auth_firebase_service.dart';
import 'package:vibrona/presentation/home/pages/home_page.dart';
import 'package:vibrona/presentation/intro/pages/get_started_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    navigateToNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AssetsImages.assetsImagesLogo)),
    );
  }

  Future<void> navigateToNextPage() async {
    // Implement your navigation logic here
    Future.delayed(const Duration(seconds: 2), () {
      var isloggedIn = AuthFirebaseServiceImpl().isLoggedIn();
      if (isloggedIn) {
        // Navigate to Home Page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        // Navigate to Get Started Page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const GetStartedPage()),
        );
      }
    });
  }
}
