import 'dart:async';

import 'package:bustrackingapp/core/app_export.dart';
import 'package:bustrackingapp/presentation/home_page/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

/// A controller class for the HomePage.
///
/// This class manages the state of the HomePage, including the
/// current homeModelObj
class HomeController extends GetxController {
  HomeController(this.homeModelObj);

  TextEditingController searchController = TextEditingController();
  GoogleMapController? mapsController;
  Rx<HomeModel> homeModelObj;

  double lat = 40.6974881;
  double lng = -73.979681;
  // bool iscomplete = false;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
    mapsController!.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  getLocation() async {
    LocationData currentLocaion;
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    currentLocaion = await location.getLocation();

    lat = currentLocaion.latitude!;
    lng = currentLocaion.longitude!;
    // iscomplete = true;
  }
}
