import 'dart:ui';
import 'package:drop_it/features/splash/splash_controller.dart';
import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:drop_it/utils/constants/spacer_helper.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (context) {
          return Stack(
            children: [
              // Background dotted texture image
              Positioned.fill(
                child: Image.asset(
                  TImages.splashDotTexture,
                  fit: BoxFit.cover,
                  height: Get.height * 0.5,
                ),
              ),

              // Center "drop it" logo
              SizedBox(
                width: Get.width,
                child: Column(
                  children: [
                    SpacerHelper.verticalSpaceExtraLarge(),
                    SpacerHelper.verticalSpaceExtraLarge(),
                    Stack(
                      children: [
                        Image.asset(
                          TImages.appLogo,
                          width: 380,
                          height: 380,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          bottom: 85,
                          left: 80,
                          child: Text(
                            'Deliver package faster',
                            style: TTextTheme.lightTextTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Bottom package image
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                      sigmaX: 0.8,
                      sigmaY:
                          0.8), // Adjust sigma values to control blur intensity
                  child: Image.asset(
                    TImages.splashDeliveryBoxes,
                    width: Get.width * 0.8,
                  ),
                ),
              ),

              Positioned(
                bottom: 50,
                left: Get.width * 0.37,
                child: Text(
                  '©2024 Drop It',
                  style: TTextTheme.lightTextTheme.bodyLarge,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
