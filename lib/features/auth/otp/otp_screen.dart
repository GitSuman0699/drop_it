import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:drop_it/utils/constants/sizes.dart';
import 'package:drop_it/utils/constants/spacer_helper.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: SizedBox(
              height: Get.height,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    TImages.appLogoBlack,
                    height: 350,
                    width: 350,
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  Text(
                    "Welcome, Driver",
                    style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                        color: TColors.black, fontWeight: FontWeight.w900),
                  ),
                  SpacerHelper.verticalSpaceSmall(),
                  Text(
                    "Enter the four digit code sent to you\nat ******* 4117",
                    textAlign: TextAlign.center,
                    style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                        color: Colors.black87, fontWeight: FontWeight.w500),
                  ),
                  SpacerHelper.verticalSpaceLarge(),
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
                    onSubmit: (String code) {},
                  ),
                  SpacerHelper.verticalSpaceExtraLarge(),
                  SpacerHelper.verticalSpaceLarge(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Resend code logic
                        },
                        child: Text(
                          "Resend Code",
                          style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                            color: TColors.primary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      GestureDetector(
                        onTap: () {
                          // Change phone number logic
                        },
                        child: Text(
                          "Changed Phone no?",
                          style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
