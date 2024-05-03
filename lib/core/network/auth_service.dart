import 'dart:developer';

import 'package:bustrackingapp/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  // Method to create a user with email and password
  Future<User?> createUserWithEmailAndPassword(
      String name, String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
     await saveUserName( name);
      await saveUserEmail( email);
      return userCredential.user;
      // User created successfully, do something if needed
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Error $e';
      print(errorMessage);
      // Display error message as a toast
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } catch (e) {
      String errorMessage = 'Error  $e';
      print(errorMessage);
      // Display generic error message as a toast
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    return null;
  }

/*  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      log("Something went wrong");
    }
    return null;
  }*/

  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
     await saveUserEmail( email);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Error $e';
      print(errorMessage);
      // Display error message as a toast
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } catch (e) {
      String errorMessage = 'Error1  $e';
      print(errorMessage);
      // Display generic error message as a toast
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    return null;
  }
  Future<void> signout() async {
    try {
      await _auth.signOut();
      PrefUtils.setIsLogin(false);

      Get.offAllNamed(AppRoutes.loginScreen);
    } catch (e) {
      log("Something went wrong");
    }
  }

  Future<void> saveUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }  Future<void> saveUserEmail(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', name);
  }

/*  Future<String> getStringFromPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getString(key)) ?? "";
  }

  Future<void> saveStringToPreferences(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }*/
}