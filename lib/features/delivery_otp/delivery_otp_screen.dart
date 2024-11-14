import 'package:drop_it/routes/app_routes.dart';
import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class DeliveryOTPScreen extends StatelessWidget {
  const DeliveryOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                "Enter Oliver’s Pin",
                style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                  color: TColors.black,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                "Enter the four digit OTP code from Oliver",
                style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                  color: TColors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              OtpTextField(
                numberOfFields: 4,
                styles: [
                  TTextTheme.lightTextTheme.titleSmall!.copyWith(
                    color: TColors.dark,
                    fontWeight: FontWeight.w700,
                  ),
                  TTextTheme.lightTextTheme.titleSmall!.copyWith(
                    color: TColors.dark,
                    fontWeight: FontWeight.w700,
                  ),
                  TTextTheme.lightTextTheme.titleSmall!.copyWith(
                    color: TColors.dark,
                    fontWeight: FontWeight.w700,
                  ),
                  TTextTheme.lightTextTheme.titleSmall!.copyWith(
                    color: TColors.dark,
                    fontWeight: FontWeight.w700,
                  )
                ],
                fieldHeight: 50,
                fieldWidth: 50,
                borderColor: Colors.black87,
                enabledBorderColor: Colors.black45,
                showFieldAsBox: true,
                focusedBorderColor: Colors.black,
                obscureText: true,
                onCodeChanged: (value) {},
                onSubmit: (String code) {
                  if (code.length == 4) {
                    Get.toNamed(AppRoutes.clientRatingRoute);
                  }
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Resend Code",
                  style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                    color: TColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
