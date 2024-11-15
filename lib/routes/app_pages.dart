import 'package:drop_it/features/accept_request/accept_request_screen.dart';
import 'package:drop_it/features/auth/login/login_screen.dart';
import 'package:drop_it/features/auth/otp/otp_screen.dart';
import 'package:drop_it/features/auth/registration/registration_screen.dart';
import 'package:drop_it/features/choose_vehicle.dart/choose_vehicle_screen.dart';
import 'package:drop_it/features/driver_dashboard/driver_dashboard_screen.dart';
import 'package:drop_it/features/client_rating/client_rating_screen.dart';
import 'package:drop_it/features/delivery_otp/delivery_otp_screen.dart';
import 'package:drop_it/features/document_upload/document_upload_screen.dart';
import 'package:drop_it/features/pickup_request/pickup_request_screen.dart';
import 'package:drop_it/features/splash/splash_screen.dart';
import 'package:drop_it/features/welcome/welcome_screen.dart';
import 'package:drop_it/routes/app_routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static const initial = AppRoutes.splashRoute;

  static final pages = <GetPage>[
    // Splash Screen
    GetPage(
      name: AppRoutes.splashRoute,
      page: () => const SplashScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),

    // Welcome Screen
    GetPage(
      name: AppRoutes.welcomeRoute,
      page: () => const WelcomeScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),

    // Login Screen
    GetPage(
      name: AppRoutes.loginRoute,
      page: () => const LoginScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),

    // OTP Screen
    GetPage(
      name: AppRoutes.otpRoute,
      page: () => const OTPScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),

    // Registration Screen
    GetPage(
      name: AppRoutes.registrationRoute,
      page: () => const RegistrationScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),

    // Choose Vehicle Screen
    GetPage(
      name: AppRoutes.chooseVehicleRoute,
      page: () => const ChooseVehicleScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),

    // Document Upload Screen
    GetPage(
      name: AppRoutes.documentUploadRoute,
      page: () => const DocumentUploadScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),

    // Delivery OTP Screen
    GetPage(
      name: AppRoutes.deliveryOtpRoute,
      page: () => const DeliveryOTPScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),

    // Client Rating Screen
    GetPage(
      name: AppRoutes.clientRatingRoute,
      page: () => const ClientRatingScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),

    // Driver Dashboard Screen
    GetPage(
      name: AppRoutes.clientDashboardRoute,
      page: () => const DriverDashboardScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),

    // Pickup Request Screen
    GetPage(
      name: AppRoutes.pickupRequestRoute,
      page: () => const PickupRequestScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),

    // Accept Request Screen
    GetPage(
      name: AppRoutes.acceptRequestRoute,
      page: () => const AcceptRequestScreen(),
      transitionDuration: const Duration(milliseconds: 500),
      // curve: Curves.easeOut,
      // transition: Transition.fadeIn,
    ),
  ];
}
