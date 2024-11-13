import 'package:drop_it/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  loginValidation() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.otpRoute);
    }
  }
}
