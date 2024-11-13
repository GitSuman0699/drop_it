import 'package:drop_it/features/auth/login/login_screen.dart';
import 'package:drop_it/features/auth/otp/otp_screen.dart';
import 'package:drop_it/features/auth/registration/registration_screen.dart';
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
  ];
}
