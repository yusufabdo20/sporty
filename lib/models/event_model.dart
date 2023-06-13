import 'package:sporty/models/massage_model.dart';
import 'package:sporty/models/user_model.dart';

class EventsModel {
  final String eventName, sportType, city, date;
  String eventId;
  UserModel users;
  MessageModel messages;

  EventsModel(
      {required this.messages,
      required this.eventName,
      required this.eventId,
      required this.sportType,
      required this.city,
      required this.date,
      required this.users});

  factory EventsModel.fromJson(jsonDate) {
    return EventsModel(
      eventName: jsonDate['eventName'],
      sportType: jsonDate['sportType'],
      date: jsonDate['date'],
      city: jsonDate['city'],
      messages: MessageModel.fromJson('message'),
      users: UserModel.fromJson('users'),
      eventId: jsonDate['eventId'],
    );
  }
}
