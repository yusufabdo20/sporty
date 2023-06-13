import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userEmail;
  final String userName;
  final String userImage;
  bool userAdmin = false;

  UserModel({
    required this.userName,
    required this.userImage,
    required this.userEmail,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      userName: jsonData['userName'],
      userImage: jsonData['userImage'],
      userEmail: jsonData['userEmail'],
    );
  }

  static List<UserModel> fromJsonList(List<DocumentSnapshot> documentList) {
    return documentList
        .map((document) => UserModel.fromJson(document.data() as Map<String, dynamic>))
        .toList();
  }
}