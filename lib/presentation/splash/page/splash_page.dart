import 'package:flutter/material.dart';
import 'package:vibrona/core/config/assets/assets_images.dart';
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
      body: Center(child: Image.asset(AssetsImages.assetsImagesSplashLogo)),
    );
  }

  Future<void> navigateToNextPage() async {
    // Implement your navigation logic here
    Future.delayed(const Duration(seconds: 2), () {
      // Example: Navigate to HomePage after 2 seconds
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => GetStartedPage()),
      );
    });
  }
}
