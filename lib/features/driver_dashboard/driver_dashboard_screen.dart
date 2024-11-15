import 'package:drop_it/features/driver_side_menu/driver_side_menu_screen.dart';
import 'package:drop_it/routes/app_routes.dart';
import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:drop_it/utils/constants/spacer_helper.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverDashboardScreen extends StatefulWidget {
  const DriverDashboardScreen({super.key});

  @override
  DriverDashboardScreenState createState() => DriverDashboardScreenState();
}

class DriverDashboardScreenState extends State<DriverDashboardScreen> {
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
          Positioned(
            top: 50,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.bar_chart,
                    color: TColors.secondary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Earnings',
                    style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                      color: TColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: [
                      Text(
                        '12  | ',
                        style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                          color: TColors.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '40',
                        style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                          color: TColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 140,
            left: 130,
            child: TextButton.icon(
              onPressed: () {
                Get.toNamed(AppRoutes.pickupRequestRoute);
              },
              icon: const Icon(
                Icons.power_settings_new,
                color: Colors.white,
                size: 18,
              ),
              label: const Text(
                'Go Online',
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: TColors.primary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 12,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "You're Offline.",
                          style: TTextTheme.lightTextTheme.titleSmall!.copyWith(
                            color: TColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SpacerHelper.verticalSpaceExtraLarge(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 145,
            right: 16,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.my_location),
                onPressed: () {},
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
