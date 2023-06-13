import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sporty/models/user_model.dart';

const kPramairycolor = Colors.blue;
const klogo = 'assets/images/logo.png';

const kMassagesCollections = 'massages';
const kMassage = 'massage';

const kCreatedAt = 'createdAt';
const uniqId = 'id';

const List<String> images = [
  'assets/images/sportsman.png',
  'assets/images/ski.png',
  'assets/images/scuba-diver.png',
  'assets/images/football.png',
  'assets/images/soccer-player.png',
  'assets/images/player.png',
];

const List<String> city = [
  'Maadi',
  '6thOctober',
  '15thMay',
  'ElShorouk',
  'Badr',
  'ElRehab',
  'Madinaty',
  'Heliopolis',
];

const List<String> day = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
];

// Future<List<UserModel>> fetchUserListByEmail(String email) async {
//   try {
//     CollectionReference usersCollection =
//         FirebaseFirestore.instance.collection('users');
//     QuerySnapshot snapshot = await usersCollection.get();

//     List<UserModel> userList = [];

//     if (snapshot.docs.isNotEmpty) {
//       for (DocumentSnapshot doc in snapshot.docs) {
//         Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
//         String userName = userData['name'];
//         String userEmail = userData['email'];
//         String userImage = userData['image'];

//         UserModel user = UserModel(
//           userName: userName,
//           userImage: userImage,
//           userEmail: userEmail,
//         );

//         if (user.userEmail == email) {
//           userList.add(user);
//         }
//       }
//     }

//     return userList;
//   } catch (error) {
//     print('Error getting users collection: $error');
//     return [];
//   }
// }
