import 'package:drop_it/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(AppRoutes.welcomeRoute);
    });
  }
}
