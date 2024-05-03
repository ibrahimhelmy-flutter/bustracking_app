import 'package:bustrackingapp/core/app_export.dart';
import 'package:bustrackingapp/presentation/profile_page/models/profile_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/network/auth_service.dart';

/// A controller class for the ProfilePage.
///
/// This class manages the state of the ProfilePage, including the
/// current profileModelObj
class ProfileController extends GetxController {
  ProfileController(this.profileModelObj);
  final auth = AuthService();
  RxString name="".obs;
  RxString email="".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getEmail();


  }
  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName');
  }  Future<String?> getUseremail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }
   getEmail() async {
     name.value = await getUserName()??"";
     email.value = await getUseremail()??"";


  }


  Rx<ProfileModel> profileModelObj;
}
