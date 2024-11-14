import 'package:drop_it/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  registrationValidation() async {
    Get.toNamed(AppRoutes.chooseVehicleRoute);
    // formKey.currentState!.save();
    // if (formKey.currentState!.validate()) {}
  }
}
