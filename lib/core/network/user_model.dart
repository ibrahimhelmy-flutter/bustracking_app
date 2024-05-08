import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  UserModel({this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.password});

  toJSON() {
    return {
      "fullName": this.fullName,
      "email": this.email,
      "phoneNo": this.phoneNo,
      "password": this.password
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        fullName: data["fullName"],
        email: data["email"],
        phoneNo: data["phoneNo"],
        password: data["password"]
        );
  }
}
