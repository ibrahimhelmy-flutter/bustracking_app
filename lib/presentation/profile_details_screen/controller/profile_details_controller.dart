import 'package:bustrackingapp/core/app_export.dart';
import 'package:bustrackingapp/presentation/profile_details_screen/models/profile_details_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/network/auth_service.dart';

/// A controller class for the ProfileDetailsScreen.
///
/// This class manages the state of the ProfileDetailsScreen, including the
/// current profileDetailsModelObj
class ProfileDetailsController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  Rx<ProfileDetailsModel> profileDetailsModelObj = ProfileDetailsModel().obs;
  final _auth = AuthService();
  Future<String?> getUseremail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  getUserData() async {
    final email =  await getUseremail()??"";

    if(email.isNotEmpty){
      return _auth.getUser(email: email);
    }else{
      Get.snackbar("Error", "Login To Continue");
    }
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
  }
}
