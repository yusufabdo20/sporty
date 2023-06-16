// import 'package:sporty/models/massage_model.dart';
// import 'package:sporty/models/user_model.dart';

// class EventsModel {
//   final String eventName, sportType, city, date;
//   String eventId;
//   List<UserModel>? users;
//   List<MessageModel>? messages;

//   EventsModel(
//       {this.messages,
//       required this.eventName,
//       required this.eventId,
//       required this.sportType,
//       required this.city,
//       required this.date,
//        this.users});

//   factory EventsModel.fromJson(Map<String, dynamic> jsonData) {
//     print('moooooooooooo');
//     return EventsModel(
//       eventName: jsonData['eventName'],
//       sportType: jsonData['sportType'],
//       date: 'monday',
//       city: jsonData['city'],
//       // messages: jsonData['messages']!=null ? MessageModel.fromJsonList(jsonData['messages']) : [],
//       // users: [UserModel.fromJsonList(jsonData['users'])],
//       // users: [],
//       // eventId: '23',
//       eventId: jsonData['eventId'],
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sporty/models/user_model.dart';

// class EventModel {
//   final String id;
//   final String eventName;
//   final String sportType;
//   final String city;
//   final String date;
//   final DateTime createdAt;
//   List<Users> users;
//   List<Map<String, dynamic>> messages;

//   EventModel({
//     required this.id,
//     required this.eventName,
//     required this.sportType,
//     required this.city,
//     required this.date,
//     required this.createdAt,
//     required this.users,
//     required this.messages,
//   });

//   // factory EventModel.fromMap(Map<String, dynamic> map, String id) {
//   //   return EventModel(
//   //     id: id,
//   //     eventName: map['eventName'],
//   //     sportType: map['sportType'],
//   //     city: map['city'],
//   //     date: map['date'],
//   //     createdAt: map['createdAt'].toDate(),
//   //     users: List<Map<String, dynamic>>.from(map['users']),
//   //     messages: List<Map<String, dynamic>>.from(map['messages']),
//   //   );
//   // }
//   factory EventModel.fromMap(Map<String, dynamic> map, String id) {
//     return EventModel(
//       id: id,
//       eventName: map['eventName'] ?? '',
//       sportType: map['sportType'] ?? '',
//       city: map['city'] ?? '',
//       date: map['date'] ?? '',
//       createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
//       messages:  List<Users> ,
//       users: ,
//     );
//   }
// }

class EventModel {
  final String id;
  final String eventName;
  final String sportType;
  final String city;
  final String date;
  final DateTime createdAt;
  List<Users> users;
  List<Messages> messages;

  EventModel({
    required this.id,
    required this.eventName,
    required this.sportType,
    required this.city,
    required this.date,
    required this.createdAt,
    required this.users,
    required this.messages,
  });

  factory EventModel.fromMap(Map<String, dynamic> map, String id) {
    final usersList = map['users'] as List<dynamic>?;
    final messagesList = map['messages'] as List<dynamic>?;

    List<Users> users = [];
    List<Messages> messages = [];
    if (usersList != null) {
      users = usersList.map((userMap) {
        return Users(
          userEmail: userMap['userEmail'] ?? '',
          userAdmin: userMap['userAdmin'] ?? '',
        );
      }).toList();
    }

    if (messagesList != null) {
      messages = messagesList.map((messagmap) {
        return Messages(
          idMail: messagmap['idMAil'] ?? '',
          message: messagmap['message'] ?? '',
        );
      }).toList();
    }

    return EventModel(
      id: id,
      eventName: map['eventName'] ?? '',
      sportType: map['sportType'] ?? '',
      city: map['city'] ?? '',
      date: map['date'] ?? '',
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      users: users,
      messages: messages,
    );
  }
}

class Users {
  final String userEmail;
  final String userAdmin;

  Users({
    required this.userEmail,
    required this.userAdmin,
  });
}

class Messages {
  final String idMail;
  final String message;

  Messages({
    required this.idMail,
    required this.message,
  });
}
