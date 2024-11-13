import 'package:drop_it/features/auth/components/social_login_widget.dart';
import 'package:drop_it/features/auth/registration/registration_controller.dart';
import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:drop_it/utils/constants/sizes.dart';
import 'package:drop_it/utils/constants/spacer_helper.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      body: GetBuilder<RegistrationController>(
          init: RegistrationController(),
          builder: (controller) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
                  child: Column(
                    children: [
                      // Logo Image and App Name
                      Image.asset(
                        TImages.appLogoBlack,
                        height: 250,
                        width: 250,
                        fit: BoxFit.fill,
                      ),

                      // Registration Form Fields
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Registration',
                          style: TTextTheme.lightTextTheme.headlineSmall!
                              .copyWith(
                                  color: TColors.black,
                                  fontWeight: FontWeight.w900),
                        ),
                      ),
                      SpacerHelper.verticalSpaceExtraLarge(),
                      Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              CustomFieldWithLabel(
                                label: 'First Name',
                                icon: TImages.personIcon,
                                hintText: "Enter your first name here",
                                validators: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'First name is required'),
                                  FormBuilderValidators.minLength(2,
                                      errorText:
                                          'Minimum 2 characters required'),
                                  FormBuilderValidators.match(
                                      RegExp(r'^[a-zA-Z]+$'),
                                      errorText: 'Only letters allowed'),
                                ]),
                                keyboardType: TextInputType.name,
                              ),
                              SpacerHelper.verticalSpaceMedium(),
                              CustomFieldWithLabel(
                                label: 'Last Name',
                                icon: TImages.personIcon,
                                hintText: "Enter your last name here",
                                validators: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Last name is required'),
                                  FormBuilderValidators.minLength(2,
                                      errorText:
                                          'Minimum 2 characters required'),
                                  FormBuilderValidators.match(
                                      RegExp(r'^[a-zA-Z]+$'),
                                      errorText: 'Only letters allowed'),
                                ]),
                                keyboardType: TextInputType.name,
                              ),
                              SpacerHelper.verticalSpaceMedium(),
                              CustomFieldWithLabel(
                                label: 'Phone no.',
                                icon: TImages.phoneIcon,
                                hintText: "Enter your phone number",
                                validators: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Phone number is required'),
                                  FormBuilderValidators.match(
                                      RegExp(r'^\+?[0-9]{7,15}$'),
                                      errorText: 'Enter a valid phone number'),
                                ]),
                                keyboardType: TextInputType.phone,
                              ),
                              SpacerHelper.verticalSpaceMedium(),
                              CustomFieldWithLabel(
                                label: 'Email',
                                icon: TImages.mailIcon,
                                hintText: "Enter your email address",
                                validators: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Email is required'),
                                  FormBuilderValidators.email(
                                      errorText: 'Enter a valid email address'),
                                ]),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SpacerHelper.verticalSpaceMedium(),
                              CustomDropdownWithLabel(
                                label: 'Gender',
                                icon: TImages.genderIcon,
                                validators: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'Gender is required'),
                                ]),
                              ),
                            ],
                          )),

                      // Submit Button
                      SpacerHelper.verticalSpaceLarge(),
                      SizedBox(
                        width: Get.width,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.registrationValidation();
                          },
                          child: const Text('Submit'),
                        ),
                      ),

                      // Social Login Section
                      SpacerHelper.verticalSpaceLarge(),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Or register with",
                              style: TTextTheme.lightTextTheme.bodyLarge!
                                  .copyWith(
                                      color: TColors.black,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      SpacerHelper.verticalSpaceLarge(),
                      const SocialLoginWidget(),

                      // Login Option
                      SpacerHelper.verticalSpaceLarge(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TTextTheme.lightTextTheme.bodyLarge!
                                .copyWith(
                                    color: TColors.black,
                                    fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigate to login
                            },
                            child: Text(
                              'Login',
                              style: TTextTheme.lightTextTheme.bodyLarge!
                                  .copyWith(
                                      color: TColors.primary,
                                      fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      SpacerHelper.verticalSpaceExtraLarge(),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class CustomFieldWithLabel extends StatelessWidget {
  final String hintText;
  final String label;
  final String icon;
  final String? Function(String?)? validators;
  final TextInputType? keyboardType;

  const CustomFieldWithLabel({
    super.key,
    required this.label,
    required this.icon,
    required this.hintText,
    this.validators,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TTextTheme.lightTextTheme.titleSmall!.copyWith(
            color: TColors.darkerGrey,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextFormField(
          style: TTextTheme.lightTextTheme.titleSmall!.copyWith(
            color: TColors.darkerGrey,
            fontWeight: FontWeight.w400,
          ),
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: IconButton(
              onPressed: null,
              icon: Image.asset(
                icon,
                height: icon == TImages.phoneIcon ? 15 : 18,
                width: icon == TImages.phoneIcon ? 15 : 18,
              ),
              iconSize: 18,
            ),
            border: const UnderlineInputBorder(),
          ),
          keyboardType: keyboardType,
          validator: validators,
        ),
      ],
    );
  }
}

class CustomDropdownWithLabel extends StatelessWidget {
  final String label;
  final String icon;
  final String? Function(String?)? validators;

  const CustomDropdownWithLabel(
      {super.key, required this.label, required this.icon, this.validators});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TTextTheme.lightTextTheme.titleSmall!.copyWith(
            color: TColors.darkerGrey,
            fontWeight: FontWeight.w700,
          ),
        ),
        DropdownButtonFormField<String>(
          style: TTextTheme.lightTextTheme.titleSmall!.copyWith(
            color: TColors.darkerGrey,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: "Select your gender",
            prefixIcon: IconButton(
              onPressed: null,
              icon: Image.asset(
                icon,
                height: 18,
                width: 18,
              ),
              iconSize: 18,
            ),
            border: const UnderlineInputBorder(),
          ),
          items: ['Male', 'Female', 'Other']
              .map((gender) =>
                  DropdownMenuItem(value: gender, child: Text(gender)))
              .toList(),
          validator: validators,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
