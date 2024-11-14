import 'package:drop_it/features/choose_vehicle.dart/choose_vehicle_controller.dart';
import 'package:drop_it/routes/app_routes.dart';
import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:drop_it/utils/constants/sizes.dart';
import 'package:drop_it/utils/constants/spacer_helper.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseVehicleScreen extends StatelessWidget {
  const ChooseVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.scaffoldBackground,
      body: GetBuilder<ChooseVehicleController>(
        init: ChooseVehicleController(),
        builder: (controller) {
          return Stack(
            children: [
              // Background image of boxes
              Positioned(
                bottom: 0,
                child: Image.asset(
                  TImages.splashDeliveryBoxes,
                  height: 400,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 400,
                  width: Get.width,
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpacerHelper.verticalSpaceLarge(),
                      Text(
                        'Choose how you want to earn with Drop It',
                        style:
                            TTextTheme.lightTextTheme.headlineSmall!.copyWith(
                          color: TColors.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SpacerHelper.verticalSpaceMedium(),
                      Text(
                        'Contrary to popular belief, Lorem Ipsum is not simply random text.',
                        style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                          color: TColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SpacerHelper.verticalSpaceLarge(),
                      SizedBox(
                        height: 500,
                        width: Get.width,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.vehicleoptions.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => GestureDetector(
                                onTap: () {
                                  if (controller
                                          .vehicleOptionTappedIndex.value !=
                                      index) {
                                    controller.vehicleOptionTappedIndex.value =
                                        index;
                                  }
                                },
                                child: VehicleOption(
                                  title: controller.vehicleoptions[index]
                                      ['title']!,
                                  description: controller.vehicleoptions[index]
                                      ['description']!,
                                  icon: controller.vehicleoptions[index]
                                      ['vehicle_image']!,
                                  color: controller
                                              .vehicleOptionTappedIndex.value ==
                                          index
                                      ? TColors.secondary
                                      : TColors.accent,
                                  iconColor: controller
                                              .vehicleOptionTappedIndex.value ==
                                          index
                                      ? Colors.white
                                      : Colors.black,
                                  textColor: controller
                                              .vehicleOptionTappedIndex.value ==
                                          index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SpacerHelper.verticalSpaceLarge(),
                      SizedBox(
                        width: Get.width,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.documentUploadRoute);
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
            ],
          );
        },
      ),
    );
  }
}

class VehicleOption extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final Color color;
  final Color iconColor;
  final Color textColor;

  const VehicleOption({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.lg, vertical: TSizes.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TTextTheme.lightTextTheme.titleLarge!.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SpacerHelper.horizontalSpaceMedium(),
            Expanded(
              flex: 3,
              child: Image.asset(
                icon,
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
