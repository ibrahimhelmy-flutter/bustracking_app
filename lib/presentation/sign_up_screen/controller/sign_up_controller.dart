import 'dart:developer';

import 'package:bustrackingapp/core/app_export.dart';
import 'package:bustrackingapp/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/network/auth_service.dart';

/// A controller class for the SignUpScreen.
///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpController extends GetxController {
  final _auth = AuthService();
RxBool isLoading =false.obs;

  TextEditingController firstNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> agreementText = false.obs;


  signup(context) async {
    isLoading(true);
    final user =
    await _auth.createUserWithEmailAndPassword(firstNameController.text,emailController.text, passwordController.text,context);
    isLoading(false);
    if (user != null) {
      log("User Created Succesfully");
      // Get.offAllNamed(AppRoutes.initialRoute);
      Get.offAllNamed(AppRoutes.homeContainerScreen);
      PrefUtils.setIsLogin(true);
    }
  }

  @override
  void onClose() {
    super.onClose();
    firstNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }
}
