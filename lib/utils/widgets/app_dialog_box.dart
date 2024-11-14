import 'dart:ui';
import 'package:drop_it/routes/app_routes.dart';
import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/constants/spacer_helper.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialogBox {
  AppDialogBox._();
  static final instance = AppDialogBox._();
  void showReachDestinationDialog() {
    Get.dialog(
      Stack(
        children: [
          // Blurred background effect
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Center(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
              decoration: BoxDecoration(
                color: TColors.scaffoldBackground,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'You have reached your drop point!',
                    textAlign: TextAlign.center,
                    style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                      color: TColors.primary,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  Text(
                    'Now you can either wait or make a call to the recipient. Then enter the recipient OTP to confirm and deliver the package.',
                    textAlign: TextAlign.center,
                    style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                      color: TColors.black,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SpacerHelper.verticalSpaceLarge(),
                  SizedBox(
                    width: Get.width,
                    child: OutlinedButton(
                      onPressed: () {
                        // Handle call action
                      },
                      child: const Text(
                        'Call +1 569-245-5596',
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.deliveryOtpRoute);
                      },
                      child: const Text(
                        'Input OTP',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
