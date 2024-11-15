import 'package:drop_it/features/driver_side_menu/driver_side_menu_screen.dart';
import 'package:drop_it/features/pickup_request/pickup_request_screen.dart';
import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:drop_it/utils/constants/sizes.dart';
import 'package:drop_it/utils/constants/spacer_helper.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:drop_it/utils/widgets/verticle_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptRequestScreen extends StatefulWidget {
  const AcceptRequestScreen({super.key});

  @override
  State<AcceptRequestScreen> createState() => _AcceptRequestScreenState();
}

class _AcceptRequestScreenState extends State<AcceptRequestScreen> {
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
            maxChildSize: 0.542,
            builder: (context, scrollController) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 35,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Navigate",
                              style: TTextTheme.lightTextTheme.labelLarge!
                                  .copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        SpacerHelper.horizontalSpaceSmall(),
                        Container(
                          height: 35,
                          width: 35,
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
                            icon: const Icon(
                              Icons.my_location,
                              size: 20,
                            ),
                            onPressed: () {},
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SpacerHelper.verticalSpaceSmall(),
                  Container(
                    decoration: const BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: TSizes.lg),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Top handle

                          Container(
                            height: 8.0,
                            width: 90,
                            decoration: BoxDecoration(
                              color: TColors.darkerGrey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          SpacerHelper.verticalSpaceLarge(),

                          // Pickup and Dropoff
                          const PickupAndDropWidget(),

                          SpacerHelper.verticalSpaceLarge(),
                          Container(
                            height: 4.0,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: TColors.darkerGrey.withOpacity(0.4),
                            ),
                          ),
                          SpacerHelper.verticalSpaceMedium(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: TSizes.lg),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "User Details",
                                  style: TTextTheme.lightTextTheme.labelLarge!
                                      .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '15min away',
                                  style: TTextTheme.lightTextTheme.labelLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w900,
                                          color: TColors.accent),
                                ),
                              ],
                            ),
                          ),
                          SpacerHelper.verticalSpaceSmall(),
                          const Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: TSizes.lg),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(
                                      'https://via.placeholder.com/48'), // Replace with actual user image
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'David Stone',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 16),
                                          SizedBox(width: 4),
                                          Text(
                                            '4.3',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 12),
                                Icon(Icons.message, color: Colors.white),
                                SizedBox(width: 16),
                                Icon(Icons.phone, color: Colors.white),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: TSizes.lg),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Payment Mode',
                                      style: TTextTheme
                                          .lightTextTheme.labelLarge!
                                          .copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Online  ',
                                            style: TTextTheme
                                                .lightTextTheme.titleMedium!
                                                .copyWith(
                                                    fontWeight: FontWeight.w900,
                                                    color: TColors.accent),
                                          ),
                                          TextSpan(
                                            text: '\$ 18.60',
                                            style: TTextTheme
                                                .lightTextTheme.titleMedium!
                                                .copyWith(
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 14),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Cancel Booking',
                                  ),
                                ),
                              ],
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
        ],
      ),
    );
  }
}



// class AcceptRequestScreen extends StatelessWidget {
//   const AcceptRequestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Map Background Placeholder
//           Container(
//             color: Colors.grey[300],
//             child: Center(
//               child: Icon(Icons.map, color: Colors.grey[600], size: 100),
//             ),
//           ),
//           const Positioned(
//             top: 40,
//             left: 16,
//             child: CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Icon(Icons.menu, color: Colors.blue),
//             ),
//           ),
//           const Positioned(
//             top: 40,
//             right: 16,
//             child: Row(
//               children: [
//                 Icon(Icons.wifi, color: Colors.blue),
//                 SizedBox(width: 8),
//                 Icon(Icons.battery_full, color: Colors.blue),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 150,
//             right: 16,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue[900],
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               onPressed: () {},
//               child: const Row(
//                 children: [
//                   Icon(Icons.navigation, color: Colors.white),
//                   SizedBox(width: 8),
//                   Text(
//                     'Navigate',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Draggable blue box
//           DraggableScrollableSheet(
//             initialChildSize: 0.3,
//             minChildSize: 0.3,
//             maxChildSize: 0.7,
//             builder: (context, scrollController) {
//               return Container(
//                 decoration: const BoxDecoration(
//                   color: Color(0xFF1A73E8),
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                 ),
//                 padding: const EdgeInsets.all(16),
//                 child: SingleChildScrollView(
//                   controller: scrollController,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Handle bar
//                       Center(
//                         child: Container(
//                           width: 40,
//                           height: 4,
//                           decoration: BoxDecoration(
//                             color: Colors.white54,
//                             borderRadius: BorderRadius.circular(2),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
                      
//                       // Pickup and Drop Information
//                       Row(
//                         children: [
//                           Column(
//                             children: [
//                               const Icon(Icons.circle, color: Colors.green, size: 16),
//                               Container(
//                                 width: 2,
//                                 height: 30,
//                                 color: Colors.white38,
//                               ),
//                               const Icon(Icons.location_on, color: Colors.red, size: 16),
//                             ],
//                           ),
//                           const SizedBox(width: 12),
//                           const Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'PICKUP',
//                                   style: TextStyle(
//                                     color: Colors.white70,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 4),
//                                 Text(
//                                   '1298 Elliott Street Portsmouth, NH 03801',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                                 SizedBox(height: 16),
//                                 Text(
//                                   'DROP',
//                                   style: TextStyle(
//                                     color: Colors.white70,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 4),
//                                 Text(
//                                   '733 Jail Drive Portsmouth, NH 03802',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Divider(color: Colors.white38, thickness: 1, height: 32),

//                       // User Details and Contact Icons
//                       const Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 24,
//                             backgroundImage: NetworkImage(
//                                 'https://via.placeholder.com/48'), // Replace with actual user image
//                           ),
//                           SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'David Stone',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(Icons.star, color: Colors.yellow, size: 16),
//                                     SizedBox(width: 4),
//                                     Text(
//                                       '4.3',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Text(
//                             '15min away',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                             ),
//                           ),
//                           SizedBox(width: 12),
//                           Icon(Icons.message, color: Colors.white),
//                           SizedBox(width: 16),
//                           Icon(Icons.phone, color: Colors.white),
//                         ],
//                       ),
//                       const Divider(color: Colors.white38, thickness: 1, height: 32),

//                       // Payment Mode and Cancel Button
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Payment Mode',
//                                 style: TextStyle(
//                                   color: Colors.white70,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 'Online  \$18.60',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.indigo[900],
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 16, vertical: 8),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: const Text(
//                               'Cancel Booking',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

