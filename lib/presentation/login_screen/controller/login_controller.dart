import 'dart:developer';

import 'package:bustrackingapp/core/app_export.dart';
import 'package:bustrackingapp/presentation/login_screen/models/login_model.dart';
import 'package:flutter/material.dart';

import '../../../core/network/auth_service.dart';

/// A controller class for the LoginScreen.
///
/// This class manages the state of the LoginScreen, including the
/// current loginModelObj
class LoginController extends GetxController {
  final _auth = AuthService();
  RxBool isLoading =false.obs;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<LoginModel> loginModelObj = LoginModel().obs;




  login() async {
    isLoading(true);
    final user =
    await _auth.loginUserWithEmailAndPassword(emailController.text, passwordController.text);
    isLoading(false);
    if (user != null) {
      emailController.clear();
      passwordController.clear();
      PrefUtils.setIsLogin(true);
      log("User Logged In");
      Get.offAllNamed(AppRoutes.homeContainerScreen);
    }
  }
  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
