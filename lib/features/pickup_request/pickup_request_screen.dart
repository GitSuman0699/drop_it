import 'package:drop_it/features/driver_side_menu/driver_side_menu_screen.dart';
import 'package:drop_it/routes/app_routes.dart';
import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:drop_it/utils/constants/sizes.dart';
import 'package:drop_it/utils/constants/spacer_helper.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:drop_it/utils/widgets/verticle_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickupRequestScreen extends StatefulWidget {
  const PickupRequestScreen({super.key});

  @override
  State<PickupRequestScreen> createState() => _PickupRequestScreenState();
}

class _PickupRequestScreenState extends State<PickupRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DriverSideMenuScreen(),
      ),
      body: Stack(
        children: [
          // Map view placeholder (replace this with actual map widget in real app)
          Positioned.fill(
            child: Image.asset(
              TImages.driverDashboardMap1, // Replace with your map image asset
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 500,
            left: 200,
            child: Image.asset(
              TImages
                  .driverNavigationArrow, // Replace with your map image asset
              height: 90,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: Builder(
              builder: (context) => IconButton(
                icon: Image.asset(
                  TImages.dashboardMenu,
                  height: 45,
                  width: 45,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.16,
            minChildSize: 0.16,
            maxChildSize: 0.65,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: TColors.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Top handle
                      SpacerHelper.verticalSpaceSmall(),
                      Container(
                        height: 8.0,
                        width: 90,
                        decoration: BoxDecoration(
                          color: TColors.darkerGrey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      SpacerHelper.verticalSpaceLarge(),

                      // Accept button
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: TSizes.lg),
                        child: SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.acceptRequestRoute);
                            },
                            child: Text(
                              "Accept",
                              style: TTextTheme.lightTextTheme.headlineSmall!
                                  .copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SpacerHelper.verticalSpaceLarge(),

                      // Fare and premium pay
                      Text(
                        '\$18.60',
                        style:
                            TTextTheme.lightTextTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 36,
                        ),
                      ),
                      SpacerHelper.verticalSpaceSmall(),
                      Text(
                        'Including premium pay',
                        style: TTextTheme.lightTextTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SpacerHelper.verticalSpaceLarge(),

                      // Timer and decline button
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: TSizes.lg),
                        child:
                            // Timer
                            Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: LinearProgressIndicator(
                                      value: 0.6,
                                      backgroundColor:
                                          Colors.white.withOpacity(0.7),
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              Colors.red),
                                      minHeight: 5,
                                    ),
                                  ),
                                ),
                                SpacerHelper.horizontalSpaceMedium(),
                                // Decline button
                                SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 2),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Decline',
                                      style: TTextTheme
                                          .lightTextTheme.labelLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SpacerHelper.verticalSpaceExtraSmall(),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Request will be auto decline after ',
                                    style: TTextTheme.lightTextTheme.bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13),
                                  ),
                                  TextSpan(
                                    text: '12',
                                    style: TTextTheme.lightTextTheme.bodyLarge!
                                        .copyWith(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(
                                    text: ' sec',
                                    style: TTextTheme.lightTextTheme.bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(width: 10),
                      ),
                      SpacerHelper.verticalSpaceMedium(),
                      Container(
                        height: 4.0,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: TColors.darkerGrey.withOpacity(0.4),
                        ),
                      ),
                      SpacerHelper.verticalSpaceMedium(),

                      // Time and distance
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: TSizes.lg),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 25,
                            ),
                            SpacerHelper.horizontalSpaceMedium(),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '18 min ',
                                    style: TTextTheme.lightTextTheme.titleLarge!
                                        .copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '(1.3 mi away)',
                                    style: TTextTheme
                                        .lightTextTheme.titleMedium!
                                        .copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SpacerHelper.verticalSpaceMedium(),
                      Container(
                        height: 4.0,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: TColors.darkerGrey.withOpacity(0.4),
                        ),
                      ),
                      SpacerHelper.verticalSpaceMedium(),

                      // Pickup and Dropoff
                      const PickupAndDropWidget(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PickupAndDropWidget extends StatelessWidget {
  const PickupAndDropWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icons for pickup and drop
          Column(
            children: [
              SpacerHelper.verticalSpaceExtraSmall(),
              SizedBox(
                height: 20,
                width: 20,
                child: Image.asset(TImages.pickupIcon),
              ),
              CustomPaint(
                size: const Size(2, 70),
                painter: DashedLineVerticalPainter(color: Colors.white),
              ),
              SizedBox(
                height: 20,
                width: 20,
                child: Image.asset(TImages.dropIcon),
              ),
            ],
          ),
          SpacerHelper.horizontalSpaceLarge(),

          // Addresses
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Pickup location
                Text(
                  'PICKUP',
                  style: TTextTheme.lightTextTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w900, color: TColors.accent),
                ),
                SpacerHelper.verticalSpaceExtraSmall(),
                Text(
                  '1298 Elliott Street Portsmouth, NH 03801',
                  style: TTextTheme.lightTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),

                SpacerHelper.verticalSpaceMedium(),

                const Divider(),

                SpacerHelper.verticalSpaceMedium(),

                // Dropoff location
                Text(
                  'DROP',
                  style: TTextTheme.lightTextTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w900, color: TColors.accent),
                ),
                const SizedBox(height: 4),
                Text(
                  '733 Jail Drive Portsmouth, NH 03802',
                  style: TTextTheme.lightTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
