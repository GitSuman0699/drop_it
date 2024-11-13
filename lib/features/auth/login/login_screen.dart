import 'package:drop_it/features/auth/components/social_login_widget.dart';
import 'package:drop_it/features/auth/login/login_controller.dart';
import 'package:drop_it/routes/app_routes.dart';
import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:drop_it/utils/constants/sizes.dart';
import 'package:drop_it/utils/constants/spacer_helper.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
                child: SizedBox(
                  height: Get.height,
                  child: Column(
                    children: [
                      // Top Logo
                      Image.asset(
                        TImages.appLogoBlack,
                        height: 350,
                        width: 350,
                      ),
                      SpacerHelper.verticalSpaceMedium(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Login as Driver",
                          style: TTextTheme.lightTextTheme.headlineSmall!
                              .copyWith(
                                  color: TColors.black,
                                  fontWeight: FontWeight.w900),
                        ),
                      ),
                      SpacerHelper.verticalSpaceExtraLarge(),
                      // Phone Number Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone no.",
                            style: TTextTheme.lightTextTheme.titleSmall!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                          ),
                          SpacerHelper.verticalSpaceSmall(),
                          Form(
                            key: controller.formKey,
                            child: TextFormField(
                              style: TTextTheme.lightTextTheme.titleSmall!
                                  .copyWith(
                                color: TColors.darkerGrey,
                                fontWeight: FontWeight.w700,
                              ),
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              onChanged: (code) {
                                if (code.length == 10) {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                }
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.phone_outlined),
                                hintText: 'Enter your phone number',
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(8.0),
                                //   borderSide: const BorderSide(color: Colors.grey),
                                // ),
                              ),
                              keyboardType: TextInputType.phone,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText:
                                        'Please enter your phone number'),
                                FormBuilderValidators.match(RegExp(r'^\d{10}$'),
                                    errorText:
                                        'Please enter a valid 10-digit phone number'),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      SpacerHelper.verticalSpaceLarge(),
                      // Continue Button
                      SizedBox(
                        width: Get.width,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.loginValidation();
                          },
                          child: const Text(
                            'Continue',
                          ),
                        ),
                      ),
                      SpacerHelper.verticalSpaceLarge(),
                      SpacerHelper.verticalSpaceSmall(),
                      // Divider with "Or"
                      Row(
                        children: [
                          const Expanded(child: Divider(color: Colors.grey)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Or",
                              style: TTextTheme.lightTextTheme.bodyLarge!
                                  .copyWith(
                                      color: TColors.black,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Expanded(child: Divider(color: Colors.grey)),
                        ],
                      ),
                      SpacerHelper.verticalSpaceMedium(),
                      // Social Media Login Icons
                      const SocialLoginWidget(),
                      SpacerHelper.verticalSpaceExtraLarge(),
                      // Sign Up link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Need an account? ",
                            style: TTextTheme.lightTextTheme.bodyLarge!
                                .copyWith(
                                    color: TColors.black,
                                    fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.registrationRoute);
                            },
                            child: Text(
                              "Sign Up",
                              style: TTextTheme.lightTextTheme.bodyLarge!
                                  .copyWith(
                                      color: TColors.primary,
                                      fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      SpacerHelper.verticalSpaceLarge(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
