import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  registrationValidation() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {}
  }
}
