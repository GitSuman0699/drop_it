import 'dart:ui';
import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class DriverSideMenuScreen extends StatelessWidget {
  const DriverSideMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blurred background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
            ),
          ),
          // Side Menu
          Drawer(
            width: Get.width,
            child: Container(
              color: TColors.primary,
              padding:
                  const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Close Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Image.asset(
                          TImages.drawerCloseIcon,
                          height: 16,
                          width: 16,
                        ),
                        iconSize: 16,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          TImages.drawernotificationIcon,
                          height: 21,
                          width: 21,
                        ),
                        iconSize: 21,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Profile Picture
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(TImages
                        .driverProfilePicture), // Replace with actual image asset
                  ),
                  const SizedBox(height: 12),
                  // Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 25,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '4.3',
                        style: TTextTheme.lightTextTheme.titleLarge!.copyWith(
                          color: TColors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Name and vehicle info
                  Text(
                    'Samuel Butler',
                    style: TTextTheme.lightTextTheme.headlineSmall!.copyWith(
                      color: TColors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Column(
                    children: [
                      Text(
                        'KSF-622AE',
                        textAlign: TextAlign.center,
                        style: TTextTheme.lightTextTheme.titleMedium!.copyWith(
                          color: TColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Honda CBZ',
                        textAlign: TextAlign.center,
                        style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                          color: TColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Wallet Section
                  Container(
                    width: Get.width * 0.65,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: TColors.scaffoldBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Wallet',
                          style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                            color: TColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // const SizedBox(height: 8),
                        Text(
                          '\$350.00',
                          style:
                              TTextTheme.lightTextTheme.headlineLarge!.copyWith(
                            color: TColors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: Get.width * 0.3,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate to Wallet screen
                            },
                            child: Text(
                              'View Wallet',
                              style: TTextTheme.lightTextTheme.labelLarge!
                                  .copyWith(
                                color: TColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Menu Options
                  Expanded(
                    child: ListView(
                      children: [
                        _buildMenuOption(
                          icon: TImages.drawerProfileIcon,
                          text: 'Profile',
                          onTap: () {
                            // Navigate to Profile screen
                          },
                        ),
                        _buildMenuOption(
                          icon: TImages.drawerPastOrderIcon,
                          text: 'Past orders',
                          onTap: () {
                            // Navigate to Past Orders screen
                          },
                        ),
                        _buildMenuOption(
                          icon: TImages.drawerSupportIcon,
                          text: 'Support',
                          onTap: () {
                            // Navigate to Support screen
                          },
                        ),
                        _buildMenuOption(
                          icon: TImages.drawerTermsAndConditionsIcon,
                          text: 'Terms & Conditions',
                          onTap: () {
                            // Navigate to Terms & Conditions screen
                          },
                        ),
                        _buildMenuOption(
                          icon: TImages.drawerlogoutIcon,
                          text: 'Log out',
                          onTap: () {
                            // Perform log out
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build each menu option
  Widget _buildMenuOption(
      {required String icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: SizedBox(
        child: Image.asset(
          icon,
          height: 20,
          width: 20,
        ),
      ),
      title: Text(
        text,
        style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
          color: TColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
      onTap: onTap,
    );
  }
}
