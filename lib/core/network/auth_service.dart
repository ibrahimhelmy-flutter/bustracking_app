import 'dart:developer';

import 'package:bustrackingapp/core/app_export.dart';
import 'package:bustrackingapp/core/network/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  // Method to create a user with email and password
  Future<User?> createUserWithEmailAndPassword(
      {required UserModel user}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      await createUser(user: user);
      await saveUserName(user.fullName);
      await saveUserEmail(user.email);
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

  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      await saveUserEmail(email);
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
  }

  Future<void> saveUserEmail(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', name);
  }

  createUser({required UserModel user}) async {
    await _db
        .collection("users")
        .add(user.toJSON())
        .whenComplete(() => Get.snackbar(
            "Success", "Your user has been created",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green))
        .catchError((error, stack) {
      Get.snackbar("Error", "Something went wrong. Try Again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    });
  }

  Future<UserModel> getUser({required String email}) async {
    final snapshot =
        await _db.collection("users").where("email", isEqualTo: email).get();
  final user = await snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
  return user;
  }
}
