import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibrona/common/widgets/button/basic_app_button.dart';
import 'package:vibrona/core/config/assets/assets_images.dart';
import 'package:vibrona/core/config/assets/assets_vectors.dart';
import 'package:vibrona/core/config/theme/app_colors.dart';
import 'package:vibrona/presentation/auth/pages/signup_or_signin.dart';
import 'package:vibrona/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Image.asset(AssetsImages.assetsImagesLogo),
                  Spacer(),
                  Text(
                    "Choose Mode",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 36),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context.read<ThemeCubit>().updateTheme(
                                        ThemeMode.dark,
                                      );
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Color(
                                          0xff30393c,
                                        ).withValues(alpha: 0.2),
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        AssetsVectors.assetsVectorsMoon,
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "Dark Mode",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: 50),
                      Column(
                        children: [
                          ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context.read<ThemeCubit>().updateTheme(
                                        ThemeMode.light,
                                      );
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Color(
                                          0xff30393c,
                                        ).withValues(alpha: 0.2),
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        AssetsVectors.assetsVectorsSun,
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "Light Mode",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  BasicAppButton(
                    text: 'Continue',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupOrSignin(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
