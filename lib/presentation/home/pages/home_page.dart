import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibrona/common/widgets/appbar/basic_appbar.dart';
import 'package:vibrona/core/config/assets/assets_images.dart';
import 'package:vibrona/core/config/assets/assets_vectors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        widget: Center(child: Image.asset(AssetsImages.assetsImagesAppBarLogo)),
        isbackHide: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_homeTopCard()],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 150,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: SvgPicture.asset(AssetsVectors.assetsVectorsHomeTopCard),
            ),
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 35),
                child: Image.asset(AssetsImages.assetsImagesMahmoud),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
