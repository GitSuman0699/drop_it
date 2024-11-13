import 'dart:ui';
import 'package:drop_it/routes/app_routes.dart';
import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:drop_it/utils/constants/spacer_helper.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            // Background dotted texture (if any) can be added here
            Positioned.fill(
              child: Image.asset(
                TImages.splashDotTexture,
                fit: BoxFit.cover,
                height: Get.height * 0.5,
              ),
            ),

            // Center Content logo and tagline
            SizedBox(
              width: Get.width,
              child: Column(
                children: [
                  SpacerHelper.verticalSpaceExtraLarge(),
                  Stack(
                    children: [
                      Image.asset(
                        TImages.appLogo,
                        width: 300,
                        height: 300,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        bottom: 45,
                        left: 95,
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

            // Boxes Image in the middle
            Positioned(
              bottom: 200,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                    sigmaX: 0.8,
                    sigmaY:
                        0.8), // Adjust sigma values to control blur intensity
                child: Image.asset(
                  TImages.welcomeDeliveryBoxes,
                  width: Get.width,
                ),
              ),
            ),

            // Welcome message and buttons
            Positioned(
              bottom: 0,
              child: Container(
                height: 310,
                width: Get.width,
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                  left: 30,
                  right: 30,
                ),
                decoration: const BoxDecoration(
                  color: TColors.scaffoldBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: TTextTheme.lightTextTheme.headlineMedium!
                          .copyWith(color: TColors.primary),
                    ),
                    SpacerHelper.verticalSpaceSmall(),
                    SpacerHelper.verticalSpaceSmall(),
                    Text(
                      'Are you here to get hired or get the job done?\nChoose your role:',
                      textAlign: TextAlign.center,
                      style: TTextTheme.lightTextTheme.bodyLarge!
                          .copyWith(color: TColors.black),
                    ),
                    SpacerHelper.verticalSpaceMedium(),
                    SpacerHelper.verticalSpaceExtraSmall(),
                    _buildWelcomeButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeButtons() {
    return Column(
      children: [
        SizedBox(
          width: Get.width,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Login as User'),
          ),
        ),
        SpacerHelper.verticalSpaceSmall(),
        SpacerHelper.verticalSpaceExtraSmall(),
        SizedBox(
          width: Get.width,
          child: OutlinedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.loginRoute);
            },
            child: const Text('Login as Driver'),
          ),
        ),
      ],
    );
  }
}
