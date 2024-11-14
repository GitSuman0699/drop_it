import 'package:drop_it/routes/app_routes.dart';
import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:drop_it/utils/constants/sizes.dart';
import 'package:drop_it/utils/constants/spacer_helper.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:drop_it/utils/widgets/app_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentUploadScreen extends StatelessWidget {
  const DocumentUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: TSizes.lg, vertical: TSizes.lg),
            child: SizedBox(
              height: Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        TImages.appLogoHorizantal,
                        height: 50,
                      ),
                    ],
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  Text(
                    'Welcome Samuel,',
                    style: TTextTheme.lightTextTheme.headlineLarge!.copyWith(
                      color: TColors.primary,
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SpacerHelper.verticalSpaceSmall(),
                  Text(
                    'We need the following documents to set up your account',
                    style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                      color: TColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SpacerHelper.verticalSpaceLarge(),
                  const DocumentItem(
                    title: "Driver's License–Front",
                    subtitle: 'Upload front side image of driving license',
                    showUploadIcon: true,
                  ),
                  const Divider(),
                  const DocumentItem(
                    title: "Profile Photo",
                    subtitle: 'Upload the profile image',
                    showUploadIcon: true,
                  ),
                  const Divider(),
                  const DocumentItem(
                    title: "Vehicle Registration",
                    subtitle: 'Upload the vehicle registration',
                    uploadedFile: 'vehicle1.jpg',
                  ),
                  const Divider(),
                  const DocumentItem(
                    title: "Vehicle Insurance",
                    subtitle: 'Upload the vehicle insurance',
                    uploadedFile: 'insurance_vehi.png',
                  ),
                  const Divider(),
                  SpacerHelper.verticalSpaceExtraLarge(),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.clientDashboardRoute);
                        // AppDialogBox.instance.showReachDestinationDialog();
                      },
                      child: const Text(
                        'Continue',
                      ),
                    ),
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

class DocumentItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? uploadedFile;
  final bool showUploadIcon;

  const DocumentItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.uploadedFile,
    this.showUploadIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TTextTheme.lightTextTheme.titleMedium!.copyWith(
                  color: TColors.black,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (showUploadIcon)
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    child: Image.asset(
                      TImages.fileUploadIcon,
                      height: 20,
                      width: 20,
                    ),
                  ),
                )
              else
                SizedBox(
                  child: Image.asset(
                    TImages.fileUploadDoneIcon,
                    height: 20,
                    width: 20,
                  ),
                ),
            ],
          ),
          SpacerHelper.verticalSpaceExtraSmall(),
          Text(
            subtitle,
            style: TTextTheme.lightTextTheme.bodySmall!.copyWith(
              color: TColors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            uploadedFile ?? '',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF0056B3),
            ),
          ),
        ],
      ),
    );
  }
}
