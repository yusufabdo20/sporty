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

class EventModel {
  final String id;
  final String eventName;
  final String sportType;
  final String city;
  final String date;
  final DateTime createdAt;
  List<Map<String, dynamic>> users;
  List<Map<String, dynamic>> messages;

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

  // factory EventModel.fromMap(Map<String, dynamic> map, String id) {
  //   return EventModel(
  //     id: id,
  //     eventName: map['eventName'],
  //     sportType: map['sportType'],
  //     city: map['city'],
  //     date: map['date'],
  //     createdAt: map['createdAt'].toDate(),
  //     users: List<Map<String, dynamic>>.from(map['users']),
  //     messages: List<Map<String, dynamic>>.from(map['messages']),
  //   );
  // }
  factory EventModel.fromMap(Map<String, dynamic> map, String id) {
  final users = map['users'];
  final messages = map['messages'];

  return EventModel(
    id: id,
    eventName: map['eventName'] ?? '',
    sportType: map['sportType'] ?? '',
    city: map['city'] ?? '',
    date: map['date'] ?? '',
    createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    users: (users != null && users is List) ? List<Map<String, dynamic>>.from(users) : [],
    messages: (messages != null && messages is List) ? List<Map<String, dynamic>>.from(messages) : [],
  );
}
}
